import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../../../core/network/edsm_endpoints.dart';
import '../../../../core/result/result.dart';
import '../../../../core/storage/key_value_store.dart';
import '../../../../core/storage/secure_store.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../../../core/time/clock.dart';
import '../../../commander/data/datasources/commander_api.dart';
import '../../domain/entities/done_index.dart';
import '../../domain/repositories/history_backfill_repository.dart';
import '../datasources/edsm_api.dart';
import '../datasources/visited_stars_cache_reader.dart';
import '../models/edsm_flight_log_dto.dart';

/// Fetches history from Frontier and EDSM, and remembers it.
@LazySingleton(as: HistoryBackfillRepository)
class HistoryBackfillRepositoryImpl implements HistoryBackfillRepository {
  const HistoryBackfillRepositoryImpl(
    this._capi,
    this._edsm,
    this._store,
    this._secure,
    this._clock,
  );

  final CommanderApi _capi;
  final EdsmApi _edsm;
  final KeyValueStore _store;
  final SecureStore _secure;
  final Clock _clock;

  /// One request covers a week, and EDSM measures it back from `endDateTime`.
  static const Duration window = Duration(days: 7);

  /// Consecutive empty windows before concluding there is nothing older.
  ///
  /// Three, not one: a commander takes breaks, and stopping at the first quiet
  /// week would end a backfill at the first fortnight's holiday.
  static const int quietWindowsBeforeStopping = 3;

  @override
  Future<Result<int>> importVisitedStars() => guard<int>(
        () async {
          final HttpResponse<List<int>> response = await _capi.visitedStars();
          final Uint8List body = Uint8List.fromList(response.data);

          final Uint8List? cache = _unzip(body);
          if (cache == null) {
            throw const FormatException(
              'Frontier prépare encore le cache des étoiles visitées. '
              'Réessayer dans quelques minutes.',
            );
          }

          final Set<int>? systems = VisitedStarsCacheReader.read(cache);
          if (systems == null) {
            throw const FormatException(
              'Le cache des étoiles visitées est dans un format inconnu.',
            );
          }

          final DoneIndex previous = await stored();
          final int added =
              systems.where((int id) => !previous.systemIds.contains(id)).length;
          await _write(previous.mergedWith(DoneIndex(systemIds: systems)));
          return added;
        },
        onError: _failure,
      );

  @override
  Future<Result<BackfillReport>> backfillFromEdsm({int maxWindows = 20}) async {
    final String? name = await _store.readString(StorageKeys.edsmCommanderName);
    final String? key = await _secure.read(StorageKeys.edsmApiKey);
    if (name == null || key == null) {
      return const Result<BackfillReport>.ok(
        BackfillReport(stoppedBecause: BackfillStop.credentialsRefused),
      );
    }

    return guard<BackfillReport>(
      () async {
        DoneIndex index = await stored();
        DateTime cursor = await _readCursor() ?? _clock.now();

        int windows = 0;
        int added = 0;
        int entries = 0;
        int quiet = 0;
        BackfillStop stop = BackfillStop.budgetSpent;

        while (windows < maxWindows) {
          final HttpResponse<dynamic> response = await _edsm.flightLogs(
            commanderName: name,
            apiKey: key,
            endDateTime: EdsmEndpoints.formatDate(cursor),
            startDateTime:
                EdsmEndpoints.formatDate(cursor.subtract(window)),
          );
          windows++;

          final EdsmFlightLogPage page = EdsmFlightLogPage.fromJson(
            response.data is Map<String, dynamic>
                ? response.data as Map<String, dynamic>
                : const <String, dynamic>{},
          );

          if (page.isCredentialFailure) {
            stop = BackfillStop.credentialsRefused;
            break;
          }
          if (!page.isSuccess) {
            stop = BackfillStop.failed;
            break;
          }

          entries += page.entryCount;
          final DoneIndex before = index;
          index = index.mergedWith(page.asIndex);
          added += index.systemIds.length - before.systemIds.length;
          added += index.systemNames.length - before.systemNames.length;

          // Persisted after every window, not at the end: a pass killed
          // halfway — the app backgrounded, the phone asleep — must resume
          // rather than spend its budget again.
          cursor = cursor.subtract(window);
          await _write(index);
          await _writeCursor(cursor);

          quiet = page.entryCount == 0 ? quiet + 1 : 0;
          if (quiet >= quietWindowsBeforeStopping) {
            stop = BackfillStop.quiet;
            break;
          }
        }

        return BackfillReport(
          stoppedBecause: stop,
          windowsFetched: windows,
          systemsAdded: added,
          entriesSeen: entries,
          oldestReached: cursor,
        );
      },
      onError: _failure,
    );
  }

  @override
  Future<bool> hasEdsmCredentials() async =>
      await _store.readString(StorageKeys.edsmCommanderName) != null &&
      await _secure.read(StorageKeys.edsmApiKey) != null;

  @override
  Future<void> setEdsmCredentials({
    required String commanderName,
    required String apiKey,
  }) async {
    await _store.writeString(StorageKeys.edsmCommanderName, commanderName);
    await _secure.write(StorageKeys.edsmApiKey, apiKey);
  }

  @override
  Future<void> clearEdsmCredentials() async {
    await _store.remove(StorageKeys.edsmCommanderName);
    await _secure.delete(StorageKeys.edsmApiKey);
  }

  @override
  Future<DoneIndex> stored() async {
    final List<dynamic>? ids =
        await _store.readJsonList(StorageKeys.routeHistorySystems);
    final List<dynamic>? names =
        await _store.readJsonList(StorageKeys.routeHistoryNames);
    return DoneIndex(
      // Stored as strings: an id64 exceeds what a JavaScript number holds
      // exactly, and this document is read by the web build too.
      systemIds: <int>{
        for (final dynamic raw in ids ?? const <dynamic>[])
          if (int.tryParse('$raw') case final int id) id,
      },
      systemNames: <String>{
        ...?names?.whereType<String>(),
      },
    );
  }

  @override
  Future<void> clear() async {
    await _store.remove(StorageKeys.routeHistorySystems);
    await _store.remove(StorageKeys.routeHistoryNames);
    await _store.remove(StorageKeys.routeHistoryCursor);
  }

  Future<void> _write(DoneIndex index) async {
    await _store.writeJsonList(
      StorageKeys.routeHistorySystems,
      index.systemIds.map((int id) => '$id').toList(growable: false),
    );
    await _store.writeJsonList(
      StorageKeys.routeHistoryNames,
      index.systemNames.toList(growable: false),
    );
  }

  Future<DateTime?> _readCursor() async {
    final String? raw = await _store.readString(StorageKeys.routeHistoryCursor);
    return raw == null ? null : DateTime.tryParse(raw);
  }

  Future<void> _writeCursor(DateTime at) => _store.writeString(
        StorageKeys.routeHistoryCursor,
        at.toIso8601String(),
      );

  /// The `.dat` inside Frontier's archive, or null when the body is not one.
  ///
  /// The member's name is never assumed. Nothing public documents what Frontier
  /// calls it, so a `findFile('VisitedStarsCache.dat')` would be a guess that
  /// breaks silently; the first file in the archive is taken instead.
  ///
  /// A body that is not a zip is the normal shape of "still generating": the
  /// documented `102` is an informational status that HTTP stacks routinely
  /// swallow, so the failure usually surfaces as an empty or non-zip payload
  /// rather than as a status code.
  static Uint8List? _unzip(Uint8List body) {
    if (body.length < 4 ||
        body[0] != 0x50 ||
        body[1] != 0x4B ||
        body[2] != 0x03 ||
        body[3] != 0x04) {
      return null;
    }
    final Archive archive = ZipDecoder().decodeBytes(body);
    for (final ArchiveFile file in archive.files) {
      if (file.isFile) {
        return Uint8List.fromList(file.content as List<int>);
      }
    }
    return null;
  }

  static Failure _failure(Object error, StackTrace stackTrace) {
    if (error is FormatException) {
      return ParsingFailure(message: error.message, cause: error);
    }
    return mapDioError(error, stackTrace, 'EDSM');
  }
}
