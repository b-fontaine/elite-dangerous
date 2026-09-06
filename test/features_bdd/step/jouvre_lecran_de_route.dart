import 'package:elite_dangerous/features/route_planning/presentation/pages/routes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: When j'ouvre l'écran de route
Future<void> jouvreLecranDeRoute(WidgetTester tester) async {
  await tester.pumpWidget(wrapPage(const RoutesPage()));
  await pumpUntil(
    tester,
    () => find.byType(CircularProgressIndicator).evaluate().isEmpty,
    attempts: 200,
    reason: "L'écran de route n'a jamais fini de charger.",
  );
}
