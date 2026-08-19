import 'package:elite_dangerous/features/exobiology/domain/entities/roadmap.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: Then l'étape {'equipment.artemis_grade_2'} n'est plus bloquée
Future<void> letapeNestPlusBloquee(WidgetTester tester, String stepId) async {
  final RoadmapStep step = roadmapStateOf(tester)
      .roadmap
      .steps
      .firstWhere((RoadmapStep step) => step.id == stepId);

  expect(step.status, isNot(RoadmapStatus.blocked));
  expect(step.blockedReasons, isEmpty);
}
