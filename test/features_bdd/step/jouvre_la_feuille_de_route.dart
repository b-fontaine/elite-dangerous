import 'package:elite_dangerous/features/exobiology/presentation/pages/roadmap_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: When j'ouvre la feuille de route
Future<void> jouvreLaFeuilleDeRoute(WidgetTester tester) async {
  await tester.pumpWidget(wrapPage(const RoadmapPage()));
  await pumpUntil(
    tester,
    () => find.byType(CircularProgressIndicator).evaluate().isEmpty,
    attempts: 200,
    reason: "La feuille de route n'a jamais fini de se calculer.",
  );
}
