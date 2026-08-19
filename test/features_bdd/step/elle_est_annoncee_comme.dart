import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: And elle est annoncée comme {'Probable'}
Future<void> elleEstAnnonceeComme(WidgetTester tester, String label) async {
  expect(world.matches.first.confidence.label, label);
}
