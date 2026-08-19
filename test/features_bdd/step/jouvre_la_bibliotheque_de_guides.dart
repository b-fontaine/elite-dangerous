import 'package:elite_dangerous/features/guides/presentation/pages/guides_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: When j'ouvre la bibliothèque de guides
Future<void> jouvreLaBibliothequeDeGuides(WidgetTester tester) async {
  await tester.pumpWidget(wrapPage(const GuidesPage()));
  await pumpUntil(
    tester,
    () =>
        find.byType(CircularProgressIndicator).evaluate().isEmpty &&
        find.textContaining('Explorer la galaxie').evaluate().isNotEmpty,
    attempts: 200,
    reason: "La bibliothèque n'a affiché aucun guide.",
  );
}
