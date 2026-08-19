import 'package:elite_dangerous/features/exobiology/domain/entities/atmosphere_type.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/planet_class.dart';
import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: Given un corps de type {'hmc'} avec une atmosphère {'carbon_dioxide'}
Future<void> unCorpsDeTypeAvecUneAtmosphere(
  WidgetTester tester,
  String planetClass,
  String atmosphere,
) async {
  world.body = world.body.copyWith(
    planetClass: PlanetClass.fromCode(planetClass),
    atmosphere: AtmosphereType.fromCode(atmosphere),
  );
}
