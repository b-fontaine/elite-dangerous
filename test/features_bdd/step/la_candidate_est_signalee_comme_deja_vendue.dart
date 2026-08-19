import 'package:elite_dangerous/features/exobiology/domain/entities/species_match.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: Then la candidate {'Stratum Tectonicas'} est signalée comme déjà vendue
Future<void> laCandidateEstSignaleeCommeDejaVendue(
  WidgetTester tester,
  String name,
) async {
  final SpeciesMatch match = world.matches
      .firstWhere((SpeciesMatch match) => match.species.name == name);

  expect(
    match.alreadySoldHere,
    isTrue,
    reason: 'Le jeu refuse un nouveau prélèvement : il faut le signaler.',
  );
}
