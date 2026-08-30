import 'package:elite_dangerous/app/router/app_router.dart';
import 'package:elite_dangerous/app/router/app_routes.dart';
import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/exobiology/domain/repositories/exobiology_catalog_repository.dart';
import 'package:elite_dangerous/features/exobiology/presentation/pages/exobiology_home_page.dart';
import 'package:elite_dangerous/features/guides/domain/repositories/guide_repository.dart';
import 'package:elite_dangerous/features/guides/presentation/pages/guide_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fixtures/path_provider_stub.dart';

/// Walks the addresses a link or a button can reach, through the real router.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  usePathProviderStub();

  Future<void> boot(WidgetTester tester) async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await resetDependencies();
    await configureDependencies();
    // Bundled assets travel over a platform channel the fake clock cannot
    // pump; loading them here means the widgets only read the memory cache.
    await tester.runAsync(() async {
      await getIt<GuideRepository>().listGuides();
      await getIt<ExobiologyCatalogRepository>().loadCatalog();
    });
  }

  Future<void> settle(WidgetTester tester, {int frames = 12}) async {
    for (int i = 0; i < frames; i++) {
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 10)),
      );
      await tester.pump(const Duration(milliseconds: 20));
    }
  }

  int openTab(WidgetTester tester) => tester
      .widget<TabBar>(
        find.descendant(
          of: find.byType(ExobiologyHomePage),
          matching: find.byType(TabBar),
        ),
      )
      .controller!
      .index;

  testWidgets('chaque onglet d\'exobiologie a sa propre adresse',
      (WidgetTester tester) async {
    tester.view
      ..physicalSize = const Size(1920, 1080)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await boot(tester);
    final GoRouter router = createAppRouter();
    await tester.pumpWidget(
      MaterialApp.router(theme: EdTheme.build(), routerConfig: router),
    );
    await settle(tester);

    const Map<String, int> tabs = <String, int>{
      AppRoutes.exobiology: 0,
      AppRoutes.exobiologyRoadmap: 1,
      AppRoutes.exobiologyFinder: 2,
      AppRoutes.exobiologySpecies: 3,
    };

    for (final MapEntry<String, int> tab in tabs.entries) {
      router.go(tab.key);
      // Long enough for the branch's page transition to finish.
      await settle(tester, frames: 40);

      expect(tester.takeException(), isNull, reason: tab.key);
      // A tab is a face of the guide, not a page on top of it.
      expect(find.byType(ExobiologyHomePage), findsOneWidget, reason: tab.key);
      expect(openTab(tester), tab.value, reason: tab.key);
    }
  });

  testWidgets('un guide s\'ouvre sur son adresse', (WidgetTester tester) async {
    tester.view
      ..physicalSize = const Size(1440, 900)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await boot(tester);
    final GoRouter router = createAppRouter();
    await tester.pumpWidget(
      MaterialApp.router(theme: EdTheme.build(), routerConfig: router),
    );
    await settle(tester);

    router.go(AppRoutes.guideDetail('artemis-suit'));
    await settle(tester);

    expect(tester.takeException(), isNull);
    expect(find.byType(GuideDetailPage), findsOneWidget);
  });
}
