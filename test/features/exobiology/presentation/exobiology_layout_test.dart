import 'package:elite_dangerous/app/router/app_router.dart';
import 'package:elite_dangerous/app/router/app_routes.dart';
import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/exobiology/domain/repositories/exobiology_catalog_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/path_provider_stub.dart';

/// The plan and the species table are the two densest screens of the app, and
/// the navigation rail takes a bite out of the width they get. Both are read
/// on a phone in the middle of a session, so a card that overflows its column
/// hides exactly the figure the commander opened the page for.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  usePathProviderStub();

  /// The three formats the app claims to support, through the real shell.
  const Map<String, Size> sizes = <String, Size>{
    'téléphone': Size(360, 800),
    'tablette': Size(768, 1024),
    'ordinateur': Size(1440, 900),
    'grand écran': Size(1920, 1080),
  };

  const Map<String, String> pages = <String, String>{
    'le plan': AppRoutes.exobiologyRoadmap,
    'le catalogue': AppRoutes.exobiologySpecies,
  };

  Future<void> settle(WidgetTester tester, {int frames = 40}) async {
    for (int i = 0; i < frames; i++) {
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 10)),
      );
      await tester.pump(const Duration(milliseconds: 20));
    }
  }

  for (final MapEntry<String, Size> size in sizes.entries) {
    testWidgets('exobiologie tient sans débordement sur ${size.key}',
        (WidgetTester tester) async {
      tester.view
        ..physicalSize = size.value
        ..devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      SharedPreferences.setMockInitialValues(<String, Object>{});
      FlutterSecureStorage.setMockInitialValues(<String, String>{});
      await resetDependencies();
      await configureDependencies();
      // Bundled assets travel over a platform channel the fake clock cannot
      // pump; loading them here means the widgets only read the memory cache.
      await tester.runAsync(
        () => getIt<ExobiologyCatalogRepository>().loadCatalog(),
      );

      final GoRouter router = createAppRouter();
      await tester.pumpWidget(
        MaterialApp.router(theme: EdTheme.build(), routerConfig: router),
      );
      await settle(tester);

      for (final MapEntry<String, String> page in pages.entries) {
        router.go(page.value);
        await settle(tester);

        expect(
          tester.takeException(),
          isNull,
          reason: '${page.key} sur ${size.key}',
        );
      }
    });
  }
}
