import 'package:elite_dangerous/features/exobiology/presentation/bloc/roadmap_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: When je filtre la feuille de route sur {'Bloqué'}
Future<void> jeFiltreLaFeuilleDeRouteSur(
  WidgetTester tester,
  String label,
) async {
  final RoadmapFilter filter = RoadmapFilter.values
      .firstWhere((RoadmapFilter filter) => filter.label == label);

  roadmapBlocOf(tester).add(RoadmapFilterChanged(filter));
  await settle(tester);
}
