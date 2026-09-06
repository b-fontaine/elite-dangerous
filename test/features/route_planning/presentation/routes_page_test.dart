import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_plan.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_state_envelope.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/session_pace.dart';
import 'package:elite_dangerous/features/route_planning/domain/repositories/route_bridge.dart';
import 'package:elite_dangerous/features/route_planning/domain/services/route_duration_estimator.dart';
import 'package:elite_dangerous/features/route_planning/domain/usecases/route_tracking_usecases.dart';
import 'package:elite_dangerous/features/route_planning/presentation/bloc/route_tracking_bloc.dart';
import 'package:elite_dangerous/features/route_planning/presentation/pages/routes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '_route_fixtures.dart';

/// What a second screen actually says, which is where the three failures of the
/// bridge have to be told apart.
///
/// A sleeping PC, a PC answering in a shape this version cannot read, and a PC
/// flying nothing send the commander to three different places — the firewall,
/// an update, or the game machine — and a screen that names the wrong one is
/// worse than one that says nothing.
void main() {
  final RoutePlan plan = routePlan();
  final DateTime publishedAt = DateTime.utc(2026, 9, 3, 20, 30);

  late FakeBridge bridge;
  late FakeTrack track;
  late FixedClock clock;

  setUp(() async {
    await getIt.reset();
    bridge = FakeBridge();
    track = FakeTrack(freshProgress(plan));
    clock = FixedClock(publishedAt.add(const Duration(seconds: 12)));
    RouteTrackingBloc.pollInterval = const Duration(seconds: 30);
    getIt.registerFactory<RouteTrackingBloc>(
      () => RouteTrackingBloc(
        FollowRoute(
          bridge,
          track,
          const FakePace(SessionPace(source: PaceSource.measured)),
        ),
        const RouteDurationEstimator(),
        FakeAbandon(),
        clock,
      ),
    );
  });

  tearDown(() async {
    RouteTrackingBloc.pollInterval = const Duration(seconds: 10);
    await getIt.reset();
  });

  Future<void> openRoutes(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: EdTheme.build(),
        home: const RoutesPage(),
      ),
    );
    await tester.pump();
    await tester.pump();
  }

  void pairTo(String host) => bridge.paired = BridgePairing(
        host: host,
        port: 8420,
        token: 'k7m2xq9p',
      );

  testWidgets('a sleeping game machine is named as such',
      (WidgetTester tester) async {
    pairTo('192.168.1.24');
    bridge.answer = const Result<RouteStateEnvelope?>.err(
      NetworkFailure(message: 'la machine de jeu est injoignable'),
    );

    await openRoutes(tester);

    expect(find.text('MACHINE DE JEU INJOIGNABLE'), findsOneWidget);
    expect(find.text('ROUTE ILLISIBLE'), findsNothing);
  });

  testWidgets('a machine on another version is not called unreachable',
      (WidgetTester tester) async {
    // The failure the commander fixes with an update, not with a firewall rule.
    pairTo('192.168.1.24');
    bridge.answer = const Result<RouteStateEnvelope?>.err(
      ParsingFailure(message: 'format que cette version ne sait pas lire'),
    );

    await openRoutes(tester);

    expect(find.text('RÉPONSE ILLISIBLE'), findsOneWidget);
    expect(find.text('MACHINE DE JEU INJOIGNABLE'), findsNothing);
  });

  testWidgets('a stale pairing code is not blamed on the network',
      (WidgetTester tester) async {
    // The commander relaunched the share on the PC; this device still holds the
    // old code. Nothing to fix on the network.
    pairTo('192.168.1.24');
    bridge.answer = const Result<RouteStateEnvelope?>.err(
      UnauthorizedFailure(message: 'Jeton refusé.'),
    );

    await openRoutes(tester);

    expect(find.text('APPAIRAGE À REFAIRE'), findsOneWidget);
    expect(find.text('MACHINE DE JEU INJOIGNABLE'), findsNothing);
  });

  testWidgets('a machine flying nothing gets its own screen, not the composer',
      (WidgetTester tester) async {
    pairTo('192.168.1.24');
    bridge.answer = const Result<RouteStateEnvelope?>.ok(null);

    await openRoutes(tester);

    expect(find.text('AUCUNE ROUTE EN COURS'), findsOneWidget);
    // Composing here would start a route the game machine never hears about.
    expect(find.text('UNE ROUTE POUR CE SOIR'), findsNothing);
  });

  testWidgets('a shared route is captioned and cannot be abandoned',
      (WidgetTester tester) async {
    pairTo('192.168.1.24');
    bridge.answer = Result<RouteStateEnvelope?>.ok(
      RouteStateEnvelope(
        progress: freshProgress(plan),
        pace: const SessionPace(source: PaceSource.measured),
        publishedAt: publishedAt,
      ),
    );

    await openRoutes(tester);

    expect(find.text('192.168.1.24 · données il y a 12 s'), findsOneWidget);
    expect(find.text('Abandonner'), findsNothing);
  });

  testWidgets('the game machine keeps its own controls',
      (WidgetTester tester) async {
    await openRoutes(tester);

    expect(find.text('Abandonner'), findsOneWidget);
    expect(find.text('Lu sur la machine de jeu'), findsNothing);
  });
}
