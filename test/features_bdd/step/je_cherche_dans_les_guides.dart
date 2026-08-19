import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: And je cherche {'arc cutter'} dans les guides
Future<void> jeChercheDansLesGuides(WidgetTester tester, String query) async {
  final int before = _cardCount();
  await tester.enterText(find.byType(TextField).first, query);
  await pumpUntil(
    tester,
    () => _cardCount() != before,
    attempts: 200,
    reason: "La recherche « \$query » n'a rien filtré.",
  );
}

/// Guide cards are the tappable panels of the library.
int _cardCount() => find.byType(InkWell).evaluate().length;
