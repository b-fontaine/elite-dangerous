import 'package:flutter_test/flutter_test.dart';

/// Usage: Then je ne vois pas {'Ta boîte à outils'} text
Future<void> jeNeVoisPasText(WidgetTester tester, String text) async {
  expect(find.textContaining(text, findRichText: true), findsNothing);
}
