import 'package:elite_dangerous/app/router/app_router.dart';
import 'package:elite_dangerous/app/router/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// `AppRoutes` is the only place widgets read a path from, so a constant that
/// no `GoRoute` declares is a dead end nothing catches until a commander taps
/// it — which is exactly how `/guides/<id>` and the exobiology tabs shipped
/// unreachable.
void main() {
  Set<String> declaredPaths(List<RouteBase> routes, [String prefix = '']) {
    final Set<String> paths = <String>{};
    for (final RouteBase route in routes) {
      switch (route) {
        case final GoRoute go:
          final String full =
              go.path.startsWith('/') ? go.path : '$prefix/${go.path}';
          paths
            ..add(full)
            ..addAll(declaredPaths(go.routes, full == '/' ? '' : full));
        case final StatefulShellRoute shell:
          for (final StatefulShellBranch branch in shell.branches) {
            paths.addAll(declaredPaths(branch.routes, prefix));
          }
        case _:
          paths.addAll(declaredPaths(route.routes, prefix));
      }
    }
    return paths;
  }

  final Set<String> declared = declaredPaths(createAppRouter().configuration.routes);

  test('chaque chemin de AppRoutes est déclaré dans le routeur', () {
    expect(
      declared,
      containsAll(<String>[
        AppRoutes.dashboard,
        AppRoutes.commander,
        AppRoutes.commanderManual,
        AppRoutes.career,
        AppRoutes.fleet,
        AppRoutes.onFoot,
        AppRoutes.engineers,
        AppRoutes.materials,
        AppRoutes.station,
        AppRoutes.exobiology,
        AppRoutes.exobiologyRoadmap,
        AppRoutes.exobiologyFinder,
        AppRoutes.exobiologySpecies,
        AppRoutes.journal,
        AppRoutes.guides,
        AppRoutes.settings,
        AppRoutes.frontierConnection,
        AppRoutes.diagnostics,
      ]),
    );
  });

  test('les chemins paramétrés ont leur route et leur constructeur', () {
    expect(declared, contains('/guides/:guideId'));
    expect(AppRoutes.guideDetail('artemis-suit'), '/guides/artemis-suit');

    expect(declared, contains('/materiaux/:blueprintId'));
    expect(AppRoutes.materialBlueprint('fsd-5'), '/materiaux/fsd-5');
  });
}
