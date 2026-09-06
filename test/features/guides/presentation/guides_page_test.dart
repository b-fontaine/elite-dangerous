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

    // Scrolled to rather than tapped where it used to be: the library now opens
    // on the application shelf, and the field manuals sit below it.
    await tester.ensureVisible(find.text('Explorer la galaxie'));
    await tester.pump();
    await tester.tap(find.text('Explorer la galaxie'));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(opened, <String>['exploration-exobiologie']);
  });

  testWidgets('la bibliothèque range les guides sur deux étagères',
      (WidgetTester tester) async {
    tester.view
      ..physicalSize = const Size(1440, 2400)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    SharedPreferences.setMockInitialValues(<String, Object>{});
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await resetDependencies();
    await configureDependencies();
    await tester.runAsync(() => getIt<GuideRepository>().listGuides());

    await tester.pumpWidget(
      MaterialApp(
        theme: EdTheme.build(),
        home: const Scaffold(body: GuidesPage()),
      ),
    );
    for (int i = 0; i < 12; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }

    // Two questions, two headings: how to drive the application, and how to
    // play. A reader has only one of them at a time.
    expect(find.text('UTILISER L\'APPLICATION'), findsOneWidget);
    expect(find.text('MANUELS DE TERRAIN'), findsOneWidget);

    // And a search that only matches one shelf draws only that one. "appairage"
    // belongs to the application manuals alone — "artemis" would not do, since
    // the how-tos mention the suit too.
    await tester.enterText(find.byType(TextField), 'appairage');
    for (int i = 0; i < 12; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }

    expect(find.text('UTILISER L\'APPLICATION'), findsOneWidget);
    expect(find.text('MANUELS DE TERRAIN'), findsNothing);
  });
}
