import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/access_token_provider.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../../../core/result/result.dart';
import '../../../../core/stream/initial_then.dart';
import '../../../../core/time/clock.dart';
import '../../domain/entities/commander.dart';
import '../../domain/entities/manual_commander_overrides.dart';
import '../../domain/repositories/commander_repository.dart';
import '../datasources/commander_api.dart';
import '../datasources/commander_local_data_source.dart';
import '../models/commander_profile_dto.dart';

@LazySingleton(as: CommanderRepository)
class CommanderRepositoryImpl implements CommanderRepository {
  CommanderRepositoryImpl(this._api, this._local, this._clock, this._tokens);

  final CommanderApi _api;
  final CommanderLocalDataSource _local;
  final Clock _clock;
  final AccessTokenProvider _tokens;

  final StreamController<Commander> _controller =
      StreamController<Commander>.broadcast();

  @override
  Stream<Commander> watchProfile() => initialThen<Commander>(
        () async =>
            (await getProfile()).getOrElse((_) => const Commander.unknown()),
        _controller.stream,
      );

  /// Reading never publishes on [watchProfile].
  ///
  /// A query that broadcasts turns every observer into a feedback loop: the
  /// exobiology snapshot listens to this stream, and recomputing a snapshot
  /// reads the profile — which would emit again, forever.
  @override
  Future<Result<Commander>> getProfile({bool forceRefresh = false}) async {
    final ManualCommanderOverrides overrides = await _local.readOverrides();

    if (!forceRefresh) {
      final Commander? cached = await _readCached(overrides);
      if (cached != null) {
        return Success<Commander>(cached);
      }
    }

    // Without a Frontier session there is nothing to ask the Companion API
    // for. Calling anyway would burn the one-query-per-minute budget on a
    // guaranteed 401, and drag the caller through the retry backoff for it.
    final String? token = await _tokens.currentAccessToken();
    if (token == null || token.isEmpty) {
      return Success<Commander>(
        await _readCached(overrides) ??
            const Commander.unknown().mergedWith(overrides),
      );
    }

    try {
      final HttpResponse<dynamic> response = await _api.profile();
      final Object? payload = response.data;
      if (payload is! Map<String, dynamic>) {
        throw const FormatException(
          'Réponse /profile inattendue : ce n\'est pas un objet JSON.',
        );
      }
      final Map<String, dynamic> json = payload;
      await _local.writeCachedProfile(json);
      final DateTime now = _clock.now();
      await _local.writeLastSync(now);

      final Commander commander = CommanderProfileDto.fromJson(json)
          .toEntity(source: CommanderDataSource.companionApi, syncedAt: now)
          .mergedWith(overrides);
      // A successful round-trip is new information: this one does publish.
      _controller.add(commander);
      return Success<Commander>(commander);
    } catch (error, stackTrace) {
      final Failure failure = mapDioError(error, stackTrace);
      // A rate limit, a maintenance window or a dead connection must not wipe
      // the screen: the last known profile is still the best answer we have.
      final Commander? cached = await _readCached(overrides);
      if (cached != null) {
        return Success<Commander>(cached);
      }
      if (!overrides.isEmpty) {
        return Success<Commander>(
          const Commander.unknown().mergedWith(overrides),
        );
      }
      return ResultFailure<Commander>(failure);
    }
  }

  @override
  Future<Result<ManualCommanderOverrides>> getOverrides() =>
      guard(_local.readOverrides);

  @override
  Future<Result<void>> saveOverrides(ManualCommanderOverrides overrides) async {
    final Result<void> result = await guard(
      () => _local.writeOverrides(overrides),
      onError: (Object error, _) => CacheFailure(
        message: 'Impossible d\'enregistrer ta saisie.',
        cause: error,
      ),
    );
    if (result.isSuccess) {
      final Commander? cached = await _readCached(overrides);
      _controller.add(
        cached ?? const Commander.unknown().mergedWith(overrides),
      );
    }
    return result;
  }

  @override
  Future<Result<void>> clearCache() async {
    final Result<void> result = await guard(_local.clear);
    final ManualCommanderOverrides overrides = await _local.readOverrides();
    _controller.add(const Commander.unknown().mergedWith(overrides));
    return result;
  }

  Future<Commander?> _readCached(ManualCommanderOverrides overrides) async {
    final Map<String, dynamic>? json = await _local.readCachedProfile();
    if (json == null) {
      return null;
    }
    return CommanderProfileDto.fromJson(json)
        .toEntity(
          source: CommanderDataSource.cache,
          syncedAt: await _local.readLastSync(),
        )
        .mergedWith(overrides);
  }

  @disposeMethod
  @override
  Future<void> dispose() => _controller.close();
}
