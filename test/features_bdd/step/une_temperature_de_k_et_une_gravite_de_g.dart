import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: And une température de {190} K et une gravité de {0.21} g
Future<void> uneTemperatureDeKEtUneGraviteDeG(
  WidgetTester tester,
  num temperatureK,
  num gravityG,
) async {
  world.body = world.body.copyWith(
    surfaceTemperatureK: temperatureK.toDouble(),
    surfaceGravityG: gravityG.toDouble(),
  );
}
