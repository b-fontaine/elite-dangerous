import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/species_match.dart';
import 'package:elite_dangerous/features/exobiology/domain/usecases/exobiology_usecases.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: When je demande les espèces possibles
Future<void> jeDemandeLesEspecesPossibles(WidgetTester tester) async {
  final result = await getIt<IdentifySpeciesForBody>()(world.body);
  world.matches = result.valueOrNull ?? const <SpeciesMatch>[];
  expect(result.failureOrNull, isNull);
}
