import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/sample_record.dart';
import 'package:elite_dangerous/features/exobiology/domain/repositories/exobiology_progress_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: And l'espèce {'stratum_tectonicas'} a déjà été vendue depuis ce corps
Future<void> lespeceADejaEteVendueDepuisCeCorps(
  WidgetTester tester,
  String speciesId,
) async {
  await getIt<ExobiologyProgressRepository>().upsertRecord(
    SampleRecord(
      speciesId: speciesId,
      speciesName: speciesId,
      genusId: '',
      bodyName: world.body.name,
      systemName: world.body.systemName ?? '',
      samplesTaken: 3,
      soldAt: DateTime.utc(2026, 8, 17),
      soldValueCr: 19010800,
    ),
  );
}
