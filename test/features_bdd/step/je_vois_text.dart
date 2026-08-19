import 'package:flutter_test/flutter_test.dart';

/// Usage: Then je vois {'Acheter l'Artemis Suit'} text
Future<void> jeVoisText(WidgetTester tester, String text) async {
  expect(find.textContaining(text, findRichText: true), findsWidgets);
}
