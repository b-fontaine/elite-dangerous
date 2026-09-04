import 'package:flutter_test/flutter_test.dart';

import '_route_screen.dart';

/// Usage: Then la route annonce {'0'} sauts faits sur {'4'}
Future<void> laRouteAnnonceSautsFaitsSur(
  WidgetTester tester,
  String done,
  String total,
) async {
  final progress = routeProgressOf(tester);
  expect(
    progress.jumpsDone,
    int.parse(done),
    reason: 'Sauts déjà faits',
  );
  expect(
    progress.plan.totalJumps,
    int.parse(total),
    reason: 'Sauts au total — le départ ne compte pas',
  );
}
