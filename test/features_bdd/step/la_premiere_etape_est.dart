import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: Then la première étape est {'discipline.sell_run'}
Future<void> laPremiereEtapeEst(WidgetTester tester, String stepId) async {
  expect(roadmapStateOf(tester).roadmap.nextStep?.id, stepId);
}
