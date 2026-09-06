import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../../../core/result/result.dart';
import '../../../../core/time/clock.dart';
import '../../domain/entities/route_plan.dart';
import '../../domain/entities/route_request.dart';
import '../../domain/repositories/route_planner_repository.dart';
import '../datasources/spansh_route_api.dart';
import '../models/spansh_route_dto.dart';

/// Queues a route with Spansh, then waits for it.
///
/// The waiting is the whole of this class. Spansh answers `202` and computes in
/// the background; a route is only real once `/api/results/{job}` says so. Two
/// numbers bound that wait, and both are deliberate:
///
/// * **Three minutes, then give up.** Small routes came back in under ten
///   seconds when this was written, but a wide radius with many systems has
///   been reported to take well over two minutes. A commander staring at a
///   spinner needs an end either way, and the job id survives the timeout — a
///   route that finishes after we stopped waiting can still be read back with
///   [results].
/// * **Five seconds between polls, at most.** The first checks are quick
///   because most routes are, and they lengthen so that a slow job does not
///   cost Spansh thirty-six requests. There is no published rate limit here,
///   only courtesy.
@LazySingleton(as: RoutePlannerRepository)
class RoutePlannerRepositoryImpl implements RoutePlannerRepository {
  RoutePlannerRepositoryImpl(
    this._api,
    this._clock, {
    this.sleep = _realSleep,
    this.timeout = const Duration(minutes: 3),
  });

  /// The constructor the dependency graph uses.
  ///
  /// It exists because `injectable` inspects every constructor parameter and
  /// cannot resolve a bare function type — and giving [sleep] a typedef would
  /// only make it try to inject one. Keeping the wiring constructor free of
  /// test seams is simpler than teaching the generator about them.
  @factoryMethod
  factory RoutePlannerRepositoryImpl.wire(SpanshRouteApi api, Clock clock) =>
      RoutePlannerRepositoryImpl(api, clock);

  final SpanshRouteApi _api;
  final Clock _clock;

  /// How the repository waits between polls.
  ///
  /// Public for the same reason [timeout] is: both are the knobs a test turns
  /// to exercise the polling loop in milliseconds instead of minutes. Nothing
  /// in the app passes either.
  final Future<void> Function(Duration) sleep;

  /// How long to keep asking before giving up on a job.
  final Duration timeout;

  /// The name that appears in error messages, so a failed plot does not send
  /// the commander off to check their Frontier session.
  static const String _service = 'Spansh';

  static Future<void> _realSleep(Duration duration) =>
      Future<void>.delayed(duration);

  /// How long to wait before the nth poll. Flat after the fourth.
  static const List<Duration> _backoff = <Duration>[
    Duration(seconds: 1),
    Duration(seconds: 2),
    Duration(seconds: 3),
    Duration(seconds: 5),
  ];

  @override
  bool get isSupported => !kIsWeb;

  @override
  Future<Result<RoutePlan>> plan(RouteRequest request) async {
    if (!isSupported) {
      return const ResultFailure<RoutePlan>(_unsupported);
    }

    return guard<RoutePlan>(
      () async {
        final Map<String, dynamic> form = RouteRequestForm.encode(request);
        final HttpResponse<dynamic> queued =
            switch (request.objective) {
          RouteObjective.exobiology => await _api.plotExobiology(form),
          RouteObjective.riches => await _api.plotRiches(form),
        };

        final SpanshRouteJob job =
            SpanshRouteJob.fromJson(_asJson(queued.data));
        final String? jobId = job.jobId;
        if (jobId == null) {
          throw const FormatException(
            'Spansh n\'a pas ouvert de calcul pour cette route.',
          );
        }

        return _await(jobId, request);
      },
      onError: _failure,
    );
  }

  @override
  Future<Result<RoutePlan>> results(String jobId, RouteRequest request) async {
    if (!isSupported) {
      return const ResultFailure<RoutePlan>(_unsupported);
    }
    return guard<RoutePlan>(
      () => _await(jobId, request),
      onError: _failure,
    );
  }

  /// Polls one job until it carries a route, fails, or runs out of time.
  Future<RoutePlan> _await(String jobId, RouteRequest request) async {
    final DateTime deadline = _clock.now().add(timeout);

    for (int attempt = 0;; attempt++) {
      final HttpResponse<dynamic> response = await _api.results(jobId);
      final Map<String, dynamic> payload = _asJson(response.data);
      final SpanshRouteJob job = SpanshRouteJob.fromJson(payload);

      switch (job.status) {
        case RouteJobStatus.completed:
          final RoutePlan? plan = SpanshRouteDto.fromJson(
            payload,
            jobId: jobId,
            request: request,
            computedAt: _clock.now(),
          );
          if (plan == null) {
            throw const FormatException(
              'Spansh a répondu sans route exploitable. '
              'Élargir le rayon ou abaisser la valeur minimale.',
            );
          }
          return plan;

        case RouteJobStatus.unknown:
          throw const FormatException(
            'Spansh a répondu dans un format inattendu.',
          );

        case RouteJobStatus.queued:
        case RouteJobStatus.started:
          break;
      }

      // Checked after the poll, never before: a job that is already finished
      // must be returned even if the deadline has passed while we waited.
      if (!_clock.now().isBefore(deadline)) {
        throw RouteJobTimeout(jobId);
      }
      await sleep(_backoff[attempt < _backoff.length
          ? attempt
          : _backoff.length - 1]);
    }
  }

  static Map<String, dynamic> _asJson(Object? data) =>
      data is Map<String, dynamic> ? data : const <String, dynamic>{};

  static Failure _failure(Object error, StackTrace stackTrace) {
    if (error is RouteJobTimeout) {
      return NetworkFailure(
        message: 'Spansh calcule encore cette route. '
            'Elle reste consultable plus tard.',
        cause: error,
      );
    }
    if (error is FormatException) {
      return ParsingFailure(message: error.message, cause: error);
    }
    return mapDioError(error, stackTrace, _service);
  }

  static const NetworkFailure _unsupported = NetworkFailure(
    // Spansh serves no CORS headers, so the browser refuses the request before
    // it leaves: there is nothing to retry and nothing to fix.
    message: 'Spansh n\'est pas interrogeable depuis un navigateur.',
  );
}

/// A job that outlived the wait.
///
/// Carries the [jobId] rather than only a message, because that id is what
/// makes the timeout recoverable: the computation continues on Spansh's side
/// and the answer can be read back later.
class RouteJobTimeout implements Exception {
  const RouteJobTimeout(this.jobId);

  final String jobId;

  @override
  String toString() => 'RouteJobTimeout(job: $jobId)';
}
