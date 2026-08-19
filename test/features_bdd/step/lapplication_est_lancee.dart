import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: Given l'application est lancée
Future<void> lapplicationEstLancee(WidgetTester tester) async {
  await bootApplication(tester);
}
