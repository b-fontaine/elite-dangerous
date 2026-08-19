import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: Given l'application est lancée avec un commandant vierge
Future<void> lapplicationEstLanceeAvecUnCommandantVierge(
  WidgetTester tester,
) async {
  await bootApplication(tester);
}
