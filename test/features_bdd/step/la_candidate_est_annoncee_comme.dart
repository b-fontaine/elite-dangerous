import 'package:elite_dangerous/features/exobiology/domain/entities/species_match.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: Then la candidate {'Stratum Tectonicas'} est annoncée comme {'Possible'}
Future<void> laCandidateEstAnnonceeComme(
  WidgetTester tester,
  String name,
  String label,
) async {
  final SpeciesMatch match = world.matches
      .firstWhere((SpeciesMatch match) => match.species.name == name);

  expect(match.confidence.label, label);
}
