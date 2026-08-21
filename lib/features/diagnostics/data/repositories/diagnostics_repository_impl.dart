import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/access_token_provider.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../../../core/result/result.dart';
import '../../../../core/storage/key_value_store.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../../../core/time/clock.dart';
import '../../domain/entities/raw_payload.dart';
import '../../domain/repositories/diagnostics_repository.dart';
import '../datasources/diagnostics_api.dart';
import '../services/payload_exporter.dart';

/// Reads the stores by their key rather than through the feature that owns
/// them.
///
/// `CommanderLocalDataSource` and `JournalLocalStore` both hand back something
/// already shaped — an entity, a parsed line list — and shaping is exactly what
/// this feature must not do. `StorageKeys` is the shared contract, and reading
/// it here keeps the coupling to one constant instead of a whole data layer.
@LazySingleton(as: DiagnosticsRepository)
class DiagnosticsRepositoryImpl implements DiagnosticsRepository {
  const DiagnosticsRepositoryImpl(
    this._api,
    this._store,
    this._clock,
    this._tokens,
    this._exporter,
  );

  final DiagnosticsApi _api;
  final KeyValueStore _store;
  final Clock _clock;
  final AccessTokenProvider _tokens;
  final PayloadExporter _exporter;

  static const JsonEncoder _indented = JsonEncoder.withIndent('  ');

  @override
  Future<Result<RawPayload?>> cachedProfile() => guard(
        () async {
          final Map<String, dynamic>? json =
              await _store.readJson(StorageKeys.commanderProfile);
          if (json == null) {
            return null;
          }
          final String? syncedAt =
              await _store.readString(StorageKeys.commanderLastSync);
          return RawPayload(
            title: 'GET /profile',
            body: _indented.convert(json),
            origin: RawPayloadOrigin.localCache,
            format: RawPayloadFormat.json,
            capturedAt: DateTime.tryParse(syncedAt ?? '') ?? _clock.now(),
            note: 'Réindenté depuis le cache : les clés sont celles que '
                'Frontier a envoyées, la mise en forme non.',
          );
        },
        onError: (Object error, _) => CacheFailure(
          message: 'Cache de profil illisible.',
          cause: error,
        ),
      );

  @override
  Future<Result<RawPayload>> fetchProfile() async {
    final Failure? blocked = await _requireSession();
    if (blocked != null) {
      return ResultFailure<RawPayload>(blocked);
    }
    try {
      final HttpResponse<String> response = await _api.profile();
      return Success<RawPayload>(
        RawPayload(
          title: 'GET /profile',
          body: response.data,
          origin: RawPayloadOrigin.companionApi,
          format: RawPayloadFormat.json,
          capturedAt: _clock.now(),
          statusCode: response.response.statusCode,
          note: 'Octets reçus, sans réencodage.',
        ),
      );
    } catch (error, stackTrace) {
      return ResultFailure<RawPayload>(mapDioError(error, stackTrace));
    }
  }

  @override
  Future<Result<RawPayload?>> storedJournal() => guard(
        () async {
          final List<dynamic>? stored =
              await _store.readJsonList(StorageKeys.journalEvents);
          final List<String> lines =
              stored?.whereType<String>().toList(growable: false) ??
                  const <String>[];
          if (lines.isEmpty) {
            return null;
          }
          final String? lastDay =
              await _store.readString(StorageKeys.journalLastSyncedDay);
          return RawPayload(
            title: 'Journal local',
            body: lines.join('\n'),
            origin: RawPayloadOrigin.localCache,
            format: RawPayloadFormat.jsonLines,
            capturedAt: DateTime.tryParse(lastDay ?? '') ?? _clock.now(),
            note: 'Lignes déjà sur l\'appareil, synchronisées ou importées, '
                'dédupliquées.',
          );
        },
        onError: (Object error, _) => CacheFailure(
          message: 'Journal local illisible.',
          cause: error,
        ),
      );

  @override
  Future<Result<RawPayload>> fetchJournalDay(DateTime dayUtc) async {
    final Failure? blocked = await _requireSession();
    if (blocked != null) {
      return ResultFailure<RawPayload>(blocked);
    }
    final DateTime day = DateTime.utc(dayUtc.year, dayUtc.month, dayUtc.day);
    try {
      final HttpResponse<String> response = await _api.journalForDay(
        day.year.toString().padLeft(4, '0'),
        day.month.toString().padLeft(2, '0'),
        day.day.toString().padLeft(2, '0'),
      );
      final int status = response.response.statusCode ?? HttpStatus.ok;
      return Success<RawPayload>(
        RawPayload(
          title: 'GET /journal/${_formatDay(day)}',
          body: status == HttpStatus.noContent ? '' : response.data,
          origin: RawPayloadOrigin.companionApi,
          format: RawPayloadFormat.jsonLines,
          capturedAt: _clock.now(),
          statusCode: status,
          note: switch (status) {
            HttpStatus.noContent => '204 — aucune partie jouée ce jour-là.',
            HttpStatus.partialContent =>
              '206 — Frontier n\'a pas tout rassemblé ; réessaie plus tard '
                  'pour la journée complète.',
            _ => null,
          },
        ),
      );
    } catch (error, stackTrace) {
      return ResultFailure<RawPayload>(mapDioError(error, stackTrace));
    }
  }

  @override
  Future<Result<String>> export(RawPayload payload) => guard(
        () => _exporter.write(payload),
        onError: (Object error, _) => error is UnsupportedError
            ? ValidationFailure(
                message: error.message?.toString() ??
                    'Export en fichier indisponible ici.',
                cause: error,
              )
            : CacheFailure(
                message: 'Écriture du fichier impossible.',
                cause: error,
              ),
      );

  /// Frontier answers `401` without a session, and the call would still burn
  /// the one-query-per-minute budget to say so.
  Future<Failure?> _requireSession() async {
    final String? token = await _tokens.currentAccessToken();
    return token == null || token.isEmpty
        ? const UnauthorizedFailure(
            message: 'Aucune session Frontier : connecte le compte d\'abord.',
          )
        : null;
  }

  static String _formatDay(DateTime day) =>
      '${day.year.toString().padLeft(4, '0')}/'
      '${day.month.toString().padLeft(2, '0')}/'
      '${day.day.toString().padLeft(2, '0')}';
}
