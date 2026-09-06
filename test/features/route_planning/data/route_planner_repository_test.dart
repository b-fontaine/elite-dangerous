import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/core/time/clock.dart';
import 'package:elite_dangerous/features/route_planning/data/datasources/spansh_route_api.dart';
import 'package:elite_dangerous/features/route_planning/data/repositories/route_planner_repository_impl.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_plan.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/retrofit.dart';

import '../../../fixtures/spansh_route_capture.dart';

const RouteRequest _request = RouteRequest(
  objective: RouteObjective.exobiology,
  fromSystem: 'Sol',
  jumpRangeLy: 50,
  radiusLy: 100,
  maxSystems: 4,
);

/// An API that answers a scripted sequence and counts what it was asked.
///
/// The counts matter as much as the values: plotting a route is the most
/// expensive thing this app asks of a service that publishes no rate limit, so
/// a test that only checked the returned plan would pass while the repository
/// polled thirty times or posted the job twice.
class _FakeRouteApi implements SpanshRouteApi {
  _FakeRouteApi({
    this.queueAnswer = const <String, dynamic>{
      'job': 'JOB-1',
      'status': 'queued',
    },
    List<Map<String, dynamic>>? pollAnswers,
  }) : _pollAnswers = pollAnswers ?? <Map<String, dynamic>>[];

  Map<String, dynamic> queueAnswer;
  final List<Map<String, dynamic>> _pollAnswers;

  DioException? throwing;

  int exobiologyCalls = 0;
  int richesCalls = 0;
  int pollCalls = 0;
  Map<String, dynamic>? lastForm;
  String? lastJobId;

  /// Answers used after the scripted list runs out.
  Map<String, dynamic> trailingAnswer = const <String, dynamic>{
    'status': 'queued',
  };

  @override
  Future<HttpResponse<dynamic>> plotExobiology(Map<String, dynamic> form) async {
    exobiologyCalls++;
    lastForm = form;
    return _answer(queueAnswer);
  }

  @override
  Future<HttpResponse<dynamic>> plotRiches(Map<String, dynamic> form) async {
    richesCalls++;
    lastForm = form;
    return _answer(queueAnswer);
  }

  @override
  Future<HttpResponse<dynamic>> results(String jobId) async {
    lastJobId = jobId;
    final Map<String, dynamic> payload = pollCalls < _pollAnswers.length
        ? _pollAnswers[pollCalls]
        : trailingAnswer;
    pollCalls++;
    return _answer(payload);
  }

  HttpResponse<dynamic> _answer(Map<String, dynamic> payload) {
    if (throwing case final DioException error) {
      throw error;
    }
    final RequestOptions options = RequestOptions(path: '/');
    return HttpResponse<dynamic>(
      payload,
      Response<dynamic>(requestOptions: options, data: payload),
    );
  }
}

/// A clock that only moves when the repository sleeps.
///
/// Ties elapsed time to the code under test rather than to the wall, so the
/// timeout is exercised in milliseconds and always at the same poll.
class _SleepDrivenClock implements Clock {
  DateTime _now = DateTime.utc(2026, 9, 3, 13);

  Duration slept = Duration.zero;

  Future<void> sleep(Duration duration) async {
    slept += duration;
    _now = _now.add(duration);
  }

  @override
  DateTime now() => _now;
}

Map<String, dynamic> get _completedAnswer =>
    jsonDecode(spanshExobiologyRouteCapture) as Map<String, dynamic>;

void main() {
  late _FakeRouteApi api;
  late _SleepDrivenClock clock;

  RoutePlannerRepositoryImpl build({Duration? timeout}) =>
      RoutePlannerRepositoryImpl(
        api,
        clock,
        sleep: clock.sleep,
        timeout: timeout ?? const Duration(minutes: 3),
      );

  setUp(() {
    clock = _SleepDrivenClock();
    api = _FakeRouteApi();
  });

  group('plan', () {
    test('queues the job, then polls until the route is there', () async {
      api = _FakeRouteApi(
        pollAnswers: <Map<String, dynamic>>[
          <String, dynamic>{'status': 'queued'},
          <String, dynamic>{'state': 'started'},
          _completedAnswer,
        ],
      );

      final Result<RoutePlan> result = await build().plan(_request);

      expect(result.isSuccess, isTrue);
      expect(api.exobiologyCalls, 1);
      expect(api.pollCalls, 3);
      expect(api.lastJobId, 'JOB-1');

      final RoutePlan plan = result.valueOrNull!;
      expect(plan.jobId, 'JOB-1');
      expect(plan.waypoints, hasLength(3));
      expect(plan.totalJumps, 4);
      expect(plan.distinctSpecies, isNotEmpty);
    });

    test('stops polling the moment the job is done', () async {
      api = _FakeRouteApi(
        pollAnswers: <Map<String, dynamic>>[_completedAnswer],
      );

      await build().plan(_request);

      expect(api.pollCalls, 1);
      expect(clock.slept, Duration.zero, reason: 'no wait before the answer');
    });

    test('backs off between polls instead of hammering Spansh', () async {
      api = _FakeRouteApi(
        pollAnswers: <Map<String, dynamic>>[
          <String, dynamic>{'status': 'queued'},
          <String, dynamic>{'status': 'queued'},
          <String, dynamic>{'status': 'queued'},
          _completedAnswer,
        ],
      );

      await build().plan(_request);

      // 1s + 2s + 3s: increasing, not a fixed drumbeat.
      expect(clock.slept, const Duration(seconds: 6));
    });

    test('sends the form to the plotter the objective names', () async {
      api = _FakeRouteApi(
        pollAnswers: <Map<String, dynamic>>[_completedAnswer],
      );

      await build().plan(
        _request.copyWith(objective: RouteObjective.riches),
      );

      expect(api.richesCalls, 1);
      expect(api.exobiologyCalls, 0);
      expect(api.lastForm!['from'], 'Sol');
      expect(api.lastForm!['use_mapping_value'], '1');
    });

    test('fails when Spansh opens no job', () async {
      api = _FakeRouteApi(queueAnswer: const <String, dynamic>{'error': 'nope'});

      final Result<RoutePlan> result = await build().plan(_request);

      expect(result.failureOrNull, isA<ParsingFailure>());
      expect(api.pollCalls, 0, reason: 'nothing to poll without a job id');
    });

    test('gives up on an unrecognised state instead of polling it out',
        () async {
      // An undocumented contract will change one day. Waiting three minutes to
      // discover it is the wrong way to find out.
      api = _FakeRouteApi(
        pollAnswers: <Map<String, dynamic>>[
          <String, dynamic>{'status': 'something new'},
        ],
      );

      final Result<RoutePlan> result = await build().plan(_request);

      expect(result.failureOrNull, isA<ParsingFailure>());
      expect(api.pollCalls, 1);
    });

    test('fails when a finished job carries no usable route', () async {
      api = _FakeRouteApi(
        pollAnswers: <Map<String, dynamic>>[
          <String, dynamic>{'status': 'ok', 'result': <dynamic>[]},
        ],
      );

      final Result<RoutePlan> result = await build().plan(_request);

      final Failure failure = result.failureOrNull!;
      expect(failure, isA<ParsingFailure>());
      // The message has to suggest the fix: an empty route almost always means
      // the filters were too tight, not that Spansh is broken.
      expect(failure.message, contains('rayon'));
    });

    test('stops waiting after the timeout, and says the job survives',
        () async {
      api = _FakeRouteApi(); // never completes

      final Result<RoutePlan> result =
          await build(timeout: const Duration(seconds: 10)).plan(_request);

      final Failure failure = result.failureOrNull!;
      expect(failure, isA<NetworkFailure>());
      expect(failure.message, contains('consultable'));
      expect(clock.slept, greaterThanOrEqualTo(const Duration(seconds: 10)));
      // Bounded: a runaway loop would show up here as hundreds of calls.
      expect(api.pollCalls, lessThan(10));
    });

    test('maps a transport error onto a network failure', () async {
      api = _FakeRouteApi()
        ..throwing = DioException.connectionError(
          requestOptions: RequestOptions(path: '/'),
          reason: 'offline',
        );

      final Result<RoutePlan> result = await build().plan(_request);

      expect(result.isFailure, isTrue);
      expect(result.failureOrNull, isA<NetworkFailure>());
    });
  });

  group('results', () {
    test('re-reads a finished job without posting it again', () async {
      api = _FakeRouteApi(
        pollAnswers: <Map<String, dynamic>>[_completedAnswer],
      );

      final Result<RoutePlan> result =
          await build().results('JOB-42', _request);

      expect(result.isSuccess, isTrue);
      expect(api.exobiologyCalls, 0);
      expect(api.richesCalls, 0);
      expect(api.pollCalls, 1);
      expect(api.lastJobId, 'JOB-42');
      expect(result.valueOrNull!.jobId, 'JOB-42');
    });

    test('keeps the request that produced the job', () async {
      api = _FakeRouteApi(
        pollAnswers: <Map<String, dynamic>>[_completedAnswer],
      );

      final Result<RoutePlan> result =
          await build().results('JOB-42', _request);

      expect(result.valueOrNull!.request, _request);
    });
  });
}
