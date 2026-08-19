import 'package:elite_dangerous/features/exobiology/presentation/bloc/roadmap_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: When je marque l'étape {'equipment.artemis_suit'} comme faite
Future<void> jeMarqueLetapeCommeFaite(
  WidgetTester tester,
  String stepId,
) async {
  roadmapBlocOf(tester).add(
    RoadmapStepCompletionToggled(stepId: stepId, completed: true),
  );
  await settle(tester);
}
