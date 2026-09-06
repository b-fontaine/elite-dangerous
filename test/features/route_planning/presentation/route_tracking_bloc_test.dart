import 'dart:async';

import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_plan.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_state_envelope.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/session_pace.dart';
import 'package:elite_dangerous/features/route_planning/domain/repositories/route_bridge.dart';
import 'package:elite_dangerous/features/route_planning/domain/services/route_duration_estimator.dart';
import 'package:elite_dangerous/features/route_planning/domain/usecases/route_tracking_usecases.dart';
import 'package:elite_dangerous/features/route_planning/presentation/bloc/route_tracking_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '_route_fixtures.dart';

void main() {
  final RoutePlan plan = routePlan();
  final DateTime publishedAt = DateTime.utc(2026, 9, 3, 20, 30);

  late FakeBridge bridge;
  late FakeTrack track;
  late FixedClock clock;
  late FakeAbandon abandon;

  RouteTrackingBloc build() => RouteTrackingBloc(
        FollowRoute(
          bridge,
          track,
          const FakePace(SessionPace(source: PaceSource.measured)),
        ),
        const RouteDurationEstimator(),
        abandon,
        clock,
      );

  setUp(() {
    // Shortened so the tests below can watch two or three polls go by without
    // spending half a minute doing it. Nothing in the app writes this.
    RouteTrackingBloc.pollInterval = const Duration(milliseconds: 20);
    bridge = FakeBridge();
    track = FakeTrack(freshProgress(plan));
    clock = FixedClock(publishedAt.add(const Duration(seconds: 12)));
    abandon = FakeAbandon();
  });

  tearDown(() => RouteTrackingBloc.pollInterval = const Duration(seconds: 10));

  group('on the game machine', () {
    test('reads the journal and never asks the bridge', () async {
      final RouteTrackingBloc bloc = build();

      bloc.add(const RouteTrackingStarted());
      await bloc.stream.firstWhere((RouteTrackingState s) => !s.isLoading);

      expect(bloc.state.hasRoute, isTrue);
      expect(bloc.state.source, RouteSource.local);
      expect(bloc.state.isShared, isFalse);
      expect(bloc.state.age, isNull);
      expect(track.calls, 1);
      expect(bridge.reads, 0);
      // Composing and abandoning belong to the machine that holds the route.
      expect(bloc.state.canEditRoute, isTrue);

      await bloc.close();
    });

    test('an empty journal is no route, not a failure', () async {
      track.progress = null;
      final RouteTrackingBloc bloc = build();

      bloc.add(const RouteTrackingStarted());
      await bloc.stream.firstWhere((RouteTrackingState s) => !s.isLoading);

      expect(bloc.state.hasRoute, isFalse);
      expect(bloc.state.failure, isNull);
      expect(bloc.state.isShared, isFalse);

      await bloc.close();
    });
  });

  group('on a second screen', () {
    setUp(() {
      bridge.paired = const BridgePairing(
        host: '192.168.1.24',
        port: 8420,
        token: 'k7m2xq9p',
      );
    });

    test('shows the game machine\'s route, and how old it is', () async {
      bridge.answer = Result<RouteStateEnvelope?>.ok(
        RouteStateEnvelope(
          progress: freshProgress(plan),
          pace: const SessionPace(source: PaceSource.measured),
          publishedAt: publishedAt,
        ),
      );
      final RouteTrackingBloc bloc = build();

      bloc.add(const RouteTrackingStarted());
      await bloc.stream.firstWhere((RouteTrackingState s) => !s.isLoading);

      expect(bloc.state.hasRoute, isTrue);
      expect(bloc.state.isShared, isTrue);
      expect(bloc.state.host, '192.168.1.24');
      expect(bloc.state.age, const Duration(seconds: 12));
      expect(bloc.state.publishedAt, publishedAt);
      // The phone has no journal of its own, and must not pretend otherwise.
      expect(track.calls, 0);
      expect(bloc.state.canEditRoute, isFalse);

      await bloc.close();
    });

    test('a sleeping game machine reads as unreachable, not as no route',
        () async {
      bridge.answer = const Result<RouteStateEnvelope?>.err(
        NetworkFailure(message: 'la machine de jeu est injoignable'),
      );
      track.progress = freshProgress(plan);
      final RouteTrackingBloc bloc = build();

      bloc.add(const RouteTrackingStarted());
      await bloc.stream.firstWhere((RouteTrackingState s) => !s.isLoading);

      expect(bloc.state.failure, isNotNull);
      expect(bloc.state.hasRoute, isFalse);
      // The source survives the failure: without it the screen would blame the
      // route rather than the network, and would offer to compose a new one.
      expect(bloc.state.isShared, isTrue);
      expect(bloc.state.host, '192.168.1.24');
      // And it never quietly falls back to whatever this device last imported.
      expect(track.calls, 0);

      await bloc.close();
    });

    test('a reachable machine flying nothing is not a failure', () async {
      bridge.answer = const Result<RouteStateEnvelope?>.ok(null);
      final RouteTrackingBloc bloc = build();

      bloc.add(const RouteTrackingStarted());
      await bloc.stream.firstWhere((RouteTrackingState s) => !s.isLoading);

      expect(bloc.state.hasRoute, isFalse);
      expect(bloc.state.failure, isNull);
      expect(bloc.state.isShared, isTrue);
      expect(bloc.state.age, isNull);

      await bloc.close();
    });

    test('a clock a few seconds ahead never ages the route backwards',
        () async {
      clock.instant = publishedAt.subtract(const Duration(seconds: 3));
      bridge.answer = Result<RouteStateEnvelope?>.ok(
        RouteStateEnvelope(
          progress: freshProgress(plan),
          pace: const SessionPace(),
          publishedAt: publishedAt,
        ),
      );
      final RouteTrackingBloc bloc = build();

      bloc.add(const RouteTrackingStarted());
      await bloc.stream.firstWhere((RouteTrackingState s) => !s.isLoading);

      expect(bloc.state.age, Duration.zero);

      await bloc.close();
    });

    test('re-reads the game machine on a timer while the screen is open',
        () async {
      bridge.answer = Result<RouteStateEnvelope?>.ok(
        RouteStateEnvelope(
          progress: freshProgress(plan),
          pace: const SessionPace(),
          publishedAt: publishedAt,
        ),
      );
      final RouteTrackingBloc bloc = build();

      bloc.add(const RouteTrackingStarted());
      await bloc.stream.firstWhere((RouteTrackingState s) => !s.isLoading);
      expect(bloc.isPolling, isTrue);

      // Counted rather than awaited: an unchanged route emits no new state —
      // `bloc` drops equal ones — so the reads are the only visible proof the
      // timer does more than exist.
      await Future<void>.delayed(RouteTrackingBloc.pollInterval * 3);
      expect(bridge.reads, greaterThanOrEqualTo(2));

      await bloc.close();
      expect(bloc.isPolling, isFalse);
    });

    test('a silent poll never puts the spinner back over the error',
        () async {
      // The screen a commander stares at when the PC is asleep: without the
      // silent flag, every poll would swap "Machine de jeu injoignable" for
      // "Lecture de la route…" and take the retry button away mid-tap.
      bridge.answer = const Result<RouteStateEnvelope?>.err(
        NetworkFailure(message: 'injoignable'),
      );
      final RouteTrackingBloc bloc = build();
      final List<bool> loadings = <bool>[];
      final StreamSubscription<RouteTrackingState> watching = bloc.stream
          .listen((RouteTrackingState s) => loadings.add(s.isLoading));

      bloc.add(const RouteTrackingStarted());
      await bloc.stream.firstWhere((RouteTrackingState s) => !s.isLoading);
      final int seenAtFirstAnswer = loadings.length;

      await Future<void>.delayed(RouteTrackingBloc.pollInterval * 3);
      expect(bridge.reads, greaterThanOrEqualTo(2));
      expect(loadings.skip(seenAtFirstAnswer), everyElement(isFalse));

      // A refresh the commander asked for does show it, because they are
      // waiting for it.
      bloc.add(const RouteTrackingRefreshed());
      await bloc.stream.firstWhere((RouteTrackingState s) => s.isLoading);

      await watching.cancel();
      await bloc.close();
    });

    test('keeps showing the route when one read drops', () async {
      bridge.answer = Result<RouteStateEnvelope?>.ok(
        RouteStateEnvelope(
          progress: freshProgress(plan),
          pace: const SessionPace(),
          publishedAt: publishedAt,
        ),
      );
      final RouteTrackingBloc bloc = build();

      bloc.add(const RouteTrackingStarted());
      await bloc.stream.firstWhere((RouteTrackingState s) => s.hasRoute);

      // A wifi hiccup, mid-flight.
      clock.instant = publishedAt.add(const Duration(minutes: 2));
      bridge.answer = const Result<RouteStateEnvelope?>.err(
        NetworkFailure(message: 'injoignable'),
      );
      bloc.add(const RouteTrackingRefreshed(silent: true));
      await bloc.stream.firstWhere((RouteTrackingState s) => s.isStale);

      // The figures were true when they arrived; the caption says how long ago.
      expect(bloc.state.hasRoute, isTrue);
      expect(bloc.state.age, const Duration(minutes: 2));
      expect(bloc.state.isUnreachable, isTrue);

      await bloc.close();
    });

    test('backs off instead of hammering a machine that is off', () async {
      bridge.answer = const Result<RouteStateEnvelope?>.err(
        NetworkFailure(message: 'injoignable'),
      );
      final RouteTrackingBloc bloc = build();

      bloc.add(const RouteTrackingStarted());
      await bloc.stream.firstWhere((RouteTrackingState s) => !s.isLoading);

      // Reads keep coming, but further and further apart: a phone left on the
      // desk overnight must not open a socket every ten seconds until morning.
      final int early = bridge.reads;
      await Future<void>.delayed(RouteTrackingBloc.pollInterval * 6);
      final int late = bridge.reads;

      expect(late, greaterThan(early));
      expect(
        late - early,
        lessThan(6),
        reason: 'un hôte mort doit être interrogé de moins en moins souvent',
      );

      await bloc.close();
    });

    test('a slow read that lands after unpairing is thrown away', () async {
      // The race the commander would otherwise have to leave the screen to
      // escape: a poll waiting on a four-second timeout, answering after the
      // pairing it belongs to is gone.
      final Completer<void> slow = Completer<void>();
      bridge
        ..hold = slow
        ..answer = const Result<RouteStateEnvelope?>.err(
          NetworkFailure(message: 'injoignable'),
        );
      final RouteTrackingBloc bloc = build();

      bloc.add(const RouteTrackingStarted());
      await Future<void>.value();

      // The commander forgets the pairing while that read is still in flight.
      await bridge.unpair();
      bridge.hold = null;
      bloc.add(const RouteTrackingRefreshed());
      await bloc.stream.firstWhere((RouteTrackingState s) => !s.isShared);

      // Only now does the stale read answer.
      slow.complete();
      await Future<void>.delayed(const Duration(milliseconds: 20));

      expect(bloc.state.source, RouteSource.local);
      expect(bloc.state.host, isNull);
      expect(
        bloc.isPolling,
        isFalse,
        reason: 'une lecture périmée ne doit pas relancer le minuteur',
      );

      await bloc.close();
    });

    test('a read that lands after the screen is closed leaves no timer',
        () async {
      final Completer<void> slow = Completer<void>();
      bridge.hold = slow;
      final RouteTrackingBloc bloc = build();

      bloc.add(const RouteTrackingStarted());
      await Future<void>.value();

      // `close()` does not wait for a handler in flight.
      await bloc.close();
      slow.complete();
      await Future<void>.delayed(const Duration(milliseconds: 20));

      expect(
        bloc.isPolling,
        isFalse,
        reason: 'un minuteur créé après la fermeture ne serait plus détenu',
      );
    });
  });

  test('the game machine polls nothing: its journal is read on demand',
      () async {
    final RouteTrackingBloc bloc = build();

    bloc.add(const RouteTrackingStarted());
    await bloc.stream.firstWhere((RouteTrackingState s) => !s.isLoading);

    // A timer here would re-read the disk behind the commander's back on the
    // one machine where the live journal watcher already does it.
    expect(bloc.isPolling, isFalse);
    expect(track.calls, 1);

    await bloc.close();
  });
}
