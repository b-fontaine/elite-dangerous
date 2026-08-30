import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/guides/domain/repositories/guide_repository.dart';
import 'package:elite_dangerous/features/guides/presentation/pages/guides_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/path_provider_stub.dart';

/// The library used to call `Navigator.pushNamed` on an app that has no named
/// routes, so every tap threw instead of opening the guide.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  usePathProviderStub();

  testWidgets('ouvrir un guide remonte son identifiant au routeur',
      (WidgetTester tester) async {
    tester.view
      ..physicalSize = const Size(1440, 900)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    SharedPreferences.setMockInitialValues(<String, Object>{});
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await resetDependencies();
    await configureDependencies();
    // Bundled assets travel over a platform channel the fake clock cannot pump.
    await tester.runAsync(() => getIt<GuideRepository>().listGuides());

    final List<String> opened = <String>[];
    await tester.pumpWidget(
      MaterialApp(
        theme: EdTheme.build(),
        home: Scaffold(body: GuidesPage(onOpenGuide: opened.add)),
      ),
    );
    for (int i = 0; i < 12; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }

    await tester.tap(find.text('Explorer la galaxie'));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(opened, <String>['exploration-exobiologie']);
  });
}
