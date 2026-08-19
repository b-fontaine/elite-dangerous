import 'package:flutter_test/flutter_test.dart';

import '_world.dart';

/// Usage: And une gravité de {0.21} g
Future<void> uneGraviteDeG(WidgetTester tester, num gravityG) async {
  world.body = world.body.copyWith(surfaceGravityG: gravityG.toDouble());
}
