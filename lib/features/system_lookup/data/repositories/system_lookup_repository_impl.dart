import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../../../core/result/result.dart';
import '../../../../core/time/clock.dart';
import '../../domain/entities/body_landmarks.dart';
import '../../domain/entities/charted_system.dart';
import '../../domain/repositories/system_lookup_repository.dart';
import '../datasources/spansh_api.dart';
import '../datasources/system_lookup_cache.dart';
import '../models/spansh_body_dto.dart';
import '../models/spansh_system_dto.dart';

/// Asks Spansh, once, and remembers the answer.
@LazySingleton(as: SystemLookupRepository)
class SystemLookupRepositoryImpl implements SystemLookupRepository {
  SystemLookupRepositoryImpl(this._api, this._cache, this._clock);

  final SpanshApi _api;
  final SystemLookupCache _cache;
  final Clock _clock;

  /// The name that appears in error messages, so a failed lookup does not send
  /// the commander off to check their Frontier session.
  static const String _service = 'Spansh';

  @override
  bool get isSupported => !kIsWeb;

  @override
  Future<Result<ChartedSystem>> system(int id64, {bool refresh = false}) async {
    if (!isSupported) {
      return const ResultFailure<ChartedSystem>(_unsupported);
    }

    if (!refresh) {
      final ChartedSystem? cached = await _cache.readSystem(id64);
      if (cached != null && _isFresh(cached.fetchedAt)) {
        return Result<ChartedSystem>.ok(cached);
      }
    }

    return guard<ChartedSystem>(
      () async {
        final HttpResponse<dynamic> response = await _api.dump(id64);
        final ChartedSystem? system = SpanshSystemDto.fromJson(
          _asJson(response.data),
          fetchedAt: _clock.now(),
        );
        if (system == null) {
          throw const FormatException(
            'Réponse Spansh illisible pour ce système.',
          );
        }
        await _cache.writeSystem(system);
        return system;
      },
      onError: _failure,
    );
  }

  @override
  Future<Result<BodyLandmarks>> landmarks(
    int bodyId64, {
    DateTime? signalsUpdatedAt,
    bool refresh = false,
  }) async {
    if (!isSupported) {
      return const ResultFailure<BodyLandmarks>(_unsupported);
    }

    if (!refresh) {
      final BodyLandmarks? cached = await _cache.readLandmarks(bodyId64);
      if (cached != null && _stillValid(cached, signalsUpdatedAt)) {
        return Result<BodyLandmarks>.ok(cached);
      }
    }

    return guard<BodyLandmarks>(
      () async {
        final HttpResponse<dynamic> response = await _api.body(bodyId64);
        final BodyLandmarks? landmarks = SpanshBodyDto.fromJson(
          _asJson(response.data),
          fetchedAt: _clock.now(),
        );
        if (landmarks == null) {
          throw const FormatException('Réponse Spansh illisible pour ce corps.');
        }
        await _cache.writeLandmarks(landmarks);
        return landmarks;
      },
      onError: _failure,
    );
  }

  @override
  Future<ChartedSystem?> cachedSystem(int id64) => _cache.readSystem(id64);

  @override
  Future<void> clearCache() => _cache.clear();

  bool _isFresh(DateTime fetchedAt) =>
      _clock.now().difference(fetchedAt) < SystemLookupCache.systemLifetime;

  /// A cached species list is good for as long as the body's signals have not
  /// moved.
  ///
  /// Deliberately conservative in one direction: when the caller cannot say
  /// what the current `signals_updated_at` is — because the system dump did
  /// not carry one — the cached answer is kept rather than refetched. The
  /// alternative would re-request the same body on every screen build for a
  /// body whose signals nobody has ever updated.
  static bool _stillValid(BodyLandmarks cached, DateTime? signalsUpdatedAt) {
    if (signalsUpdatedAt == null || cached.signalsUpdatedAt == null) {
      return true;
    }
    return !signalsUpdatedAt.isAfter(cached.signalsUpdatedAt!);
  }

  static Map<String, dynamic> _asJson(Object? data) =>
      data is Map<String, dynamic> ? data : const <String, dynamic>{};

  static Failure _failure(Object error, StackTrace stackTrace) {
    if (error is FormatException) {
      return ParsingFailure(
        message: error.message,
        cause: error,
      );
    }
    return mapDioError(error, stackTrace, _service);
  }

  static const NetworkFailure _unsupported = NetworkFailure(
    // Spansh serves no CORS headers, so the browser refuses the request before
    // it leaves: there is nothing to retry and nothing to fix.
    message: 'Spansh n\'est pas interrogeable depuis un navigateur.',
  );
}
