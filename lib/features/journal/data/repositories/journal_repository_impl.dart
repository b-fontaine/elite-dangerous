import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../../../core/result/result.dart';
import '../../../../core/stream/initial_then.dart';
import '../../domain/entities/journal_event.dart';
import '../../domain/repositories/journal_repository.dart';
import '../../domain/services/journal_event_parser.dart';
import '../datasources/journal_api.dart';
import '../datasources/journal_file_data_source.dart';
import '../datasources/journal_local_store.dart';

@LazySingleton(as: JournalRepository)
class JournalRepositoryImpl implements JournalRepository {
  JournalRepositoryImpl(this._api, this._files, this._store, this._parser);

  final JournalApi _api;
  final JournalFileDataSource _files;
  final JournalLocalStore _store;
  final JournalEventParser _parser;

  final StreamController<List<JournalEvent>> _controller =
      StreamController<List<JournalEvent>>.broadcast();

  /// Frontier fetches a whole day per request and asks for no more than about
  /// one query a minute; a wider window would take longer than the commander
  /// is willing to wait.
  static const int maxSyncDays = 14;

  @override
  Future<Result<List<JournalEvent>>> events() => guard(
        () async => _parser.parseLines(await _store.readLines()),
        onError: (Object error, _) => CacheFailure(
          message: 'Journal local illisible.',
          cause: error,
        ),
      );

  @override
  Stream<List<JournalEvent>> watchEvents() => initialThen<List<JournalEvent>>(
        () async =>
            (await events()).getOrElse((_) => const <JournalEvent>[]),
        _controller.stream,
      );

  @override
  Future<Result<JournalSyncReport>> syncFromCompanionApi({
    required DateTime from,
    required DateTime to,
  }) async {
    final DateTime start = DateTime.utc(from.year, from.month, from.day);
    final DateTime end = DateTime.utc(to.year, to.month, to.day);
    if (end.isBefore(start)) {
      return const ResultFailure<JournalSyncReport>(
        ValidationFailure(
          message: 'La date de fin précède la date de début.',
        ),
      );
    }

    final List<String> collected = <String>[];
    final List<String> partial = <String>[];
    int fetched = 0;
    int withoutPlay = 0;
    Failure? lastFailure;

    DateTime day = start;
    int guardCounter = 0;
    while (!day.isAfter(end) && guardCounter < maxSyncDays) {
      guardCounter++;
      try {
        final HttpResponse<String> response = await _api.journalForDay(
          day.year.toString().padLeft(4, '0'),
          day.month.toString().padLeft(2, '0'),
          day.day.toString().padLeft(2, '0'),
        );
        final int status = response.response.statusCode ?? 200;
        if (status == HttpStatus.noContent) {
          withoutPlay++;
        } else {
          fetched++;
          if (status == HttpStatus.partialContent) {
            partial.add(_formatDay(day));
          }
          collected.addAll(const LineSplitterLite().split(response.data));
        }
      } catch (error, stackTrace) {
        lastFailure = mapDioError(error, stackTrace);
      }
      day = day.add(const Duration(days: 1));
    }

    if (collected.isEmpty && fetched == 0 && lastFailure != null) {
      return ResultFailure<JournalSyncReport>(lastFailure);
    }

    final ({int added, int skipped}) merged = await _merge(collected);
    await _store.writeLastSyncedDay(end);

    return Success<JournalSyncReport>(
      JournalSyncReport(
        daysFetched: fetched,
        daysWithoutPlay: withoutPlay,
        partialDays: partial,
        eventsAdded: merged.added,
        eventsSkipped: merged.skipped,
      ),
    );
  }

  @override
  Future<Result<JournalSyncReport>> importFiles(
    List<JournalFileSource> files,
  ) async {
    final List<String> collected = <String>[];
    for (final JournalFileSource file in files) {
      try {
        collected.addAll(await file.readLines().toList());
      } on Object {
        // One unreadable file must not abort a folder import.
        continue;
      }
    }
    final ({int added, int skipped}) merged = await _merge(collected);
    return Success<JournalSyncReport>(
      JournalSyncReport(
        filesRead: files.length,
        eventsAdded: merged.added,
        eventsSkipped: merged.skipped,
      ),
    );
  }

  @override
  Future<Result<List<String>>> suggestedJournalDirectories() =>
      guard(() async => _files.suggestedDirectories());

  @override
  Future<Result<List<JournalFileSource>>> listJournalFiles(String directory) =>
      guard(
        () async {
          final List<JournalFileSource> files =
              await _files.listJournalFiles(directory);
          await _store.writeJournalDirectory(directory);
          return files;
        },
        onError: (Object error, _) => NotFoundFailure(
          message: 'Aucun journal trouvé dans « $directory ».',
          cause: error,
        ),
      );

  @override
  Future<Result<void>> clear() => guard(() async {
        await _store.clear();
        _controller.add(const <JournalEvent>[]);
      });

  /// Adds [incoming] to what is stored, keeping one copy of each event.
  ///
  /// Deduplication is on the parsed event's identity rather than on the raw
  /// string: the same event fetched from the Companion API and from a local
  /// file differs by whitespace and key order.
  Future<({int added, int skipped})> _merge(List<String> incoming) async {
    final List<String> stored = await _store.readLines();
    final Map<String, String> byKey = <String, String>{};
    int skipped = 0;

    for (final String line in stored) {
      final JournalEvent? event = _parser.parseLine(line);
      if (event != null) {
        byKey[event.dedupeKey] = line;
      }
    }
    final int before = byKey.length;

    for (final String line in incoming) {
      final JournalEvent? event = _parser.parseLine(line);
      if (event == null) {
        if (line.trim().isNotEmpty) {
          skipped++;
        }
        continue;
      }
      byKey.putIfAbsent(event.dedupeKey, () => line);
    }

    final List<String> merged = byKey.values.toList();
    await _store.writeLines(merged);
    _controller.add(_parser.parseLines(merged));

    return (added: byKey.length - before, skipped: skipped);
  }

  static String _formatDay(DateTime day) =>
      '${day.year}-${day.month.toString().padLeft(2, '0')}-'
      '${day.day.toString().padLeft(2, '0')}';

  @disposeMethod
  @override
  Future<void> dispose() => _controller.close();
}

/// Splits JSON-lines without pulling in `dart:convert`'s stream machinery for
/// what is already an in-memory string.
class LineSplitterLite {
  const LineSplitterLite();

  List<String> split(String raw) => raw
      .split(RegExp(r'\r?\n'))
      .where((String line) => line.trim().isNotEmpty)
      .toList(growable: false);
}
