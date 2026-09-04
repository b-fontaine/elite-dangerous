import 'package:flutter_test/flutter_test.dart';

import '_route_screen.dart';

/// Usage: Then la route annonce {'0'} espèces analysées sur {'2'}
Future<void> laRouteAnnonceEspecesAnalyseesSur(
  WidgetTester tester,
  String analysed,
  String total,
) async {
  final progress = routeProgressOf(tester);
  expect(progress.speciesAnalysed, int.parse(analysed));
  expect(progress.speciesTotal, int.parse(total));
}
