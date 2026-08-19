import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/sample_record.dart';
import 'package:elite_dangerous/features/exobiology/domain/repositories/exobiology_progress_repository.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: Given le commandant transporte {60000000} crédits de données non vendues
Future<void> leCommandantTransporteCreditsDeDonneesNonVendues(
  WidgetTester tester,
  int credits,
) async {
  await getIt<ExobiologyProgressRepository>().upsertRecord(
    SampleRecord(
      speciesId: 'stratum_tectonicas',
      speciesName: 'Stratum Tectonicas',
      genusId: 'stratum',
      bodyName: 'Cubeo A 3 c',
      systemName: 'Cubeo',
      samplesTaken: 3,
      estimatedValueCr: credits,
    ),
  );
}
