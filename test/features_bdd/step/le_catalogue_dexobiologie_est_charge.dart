import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/features/exobiology/domain/repositories/exobiology_catalog_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: Given le catalogue d'exobiologie est chargé
Future<void> leCatalogueDexobiologieEstCharge(WidgetTester tester) async {
  await bootApplication(tester);
  final result = await getIt<ExobiologyCatalogRepository>().loadCatalog();
  expect(
    result.valueOrNull?.species,
    isNotEmpty,
    reason: 'Le catalogue embarqué doit être chargeable.',
  );
}
