import 'package:elite_dangerous/features/exobiology/domain/entities/roadmap.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: Then l'étape {'equipment.artemis_suit'} est marquée {'À faire'}
Future<void> letapeEstMarquee(
  WidgetTester tester,
  String stepId,
  String expectedStatus,
) async {
  final RoadmapStep step = roadmapStateOf(tester)
      .roadmap
      .steps
      .firstWhere((RoadmapStep step) => step.id == stepId);

  expect(step.status.label, expectedStatus);
}
