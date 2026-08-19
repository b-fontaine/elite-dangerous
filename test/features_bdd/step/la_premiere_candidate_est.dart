import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: Then la première candidate est {'Stratum Tectonicas'}
Future<void> laPremiereCandidateEst(WidgetTester tester, String name) async {
  expect(world.matches, isNotEmpty);
  expect(world.matches.first.species.name, name);
}
