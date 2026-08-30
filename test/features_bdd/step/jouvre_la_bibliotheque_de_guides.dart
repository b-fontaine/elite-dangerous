import 'package:elite_dangerous/features/guides/presentation/pages/guides_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: When j'ouvre la bibliothèque de guides
Future<void> jouvreLaBibliothequeDeGuides(WidgetTester tester) async {
  // The library only draws tappable cards when the router hands it a way
  // to open a guide, and the search step counts those cards.
  await tester.pumpWidget(wrapPage(GuidesPage(onOpenGuide: (String _) {})));
  await pumpUntil(
    tester,
    () =>
        find.byType(CircularProgressIndicator).evaluate().isEmpty &&
        find.textContaining('Explorer la galaxie').evaluate().isNotEmpty,
    attempts: 200,
    reason: "La bibliothèque n'a affiché aucun guide.",
  );
}
