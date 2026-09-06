import 'package:flutter_test/flutter_test.dart';

import '_route_screen.dart';

/// Usage: Then la valeur en soute non vendue est {19010800}
Future<void> laValeurEnSouteNonVendueEst(
  WidgetTester tester,
  int expected,
) async {
  expect(routeProgressOf(tester).valueAtRiskCr, expected);
}
