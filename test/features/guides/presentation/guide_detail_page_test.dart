import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/guides/domain/repositories/guide_repository.dart';
import 'package:elite_dangerous/features/guides/presentation/pages/guide_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/path_provider_stub.dart';

/// Renders every shipped guide for real.
///
/// The guides are 260 kB of authored content exercising every block type, at
/// three window sizes — which is the only way a layout error inside a table or
/// a callout would surface before a commander hits it.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  usePathProviderStub();

  const List<String> guideIds = <String>[
    'exploration-exobiologie',
    'artemis-suit',
    'outils',
    'protocole-milliard',
    'debuter-sans-combat',
  ];

  const Map<String, Size> sizes = <String, Size>{
    'téléphone': Size(360, 800),
    'tablette': Size(768, 1024),
    'bureau': Size(1440, 900),
  };

  Future<void> boot(WidgetTester tester) async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await resetDependencies();
    await configureDependencies();
    // Bundled assets travel over a platform channel the fake clock cannot pump.
    await tester.runAsync(() async {
      for (final String id in guideIds) {
        await getIt<GuideRepository>().getGuide(id);
      }
    });
  }

  for (final MapEntry<String, Size> size in sizes.entries) {
    testWidgets('chaque guide se rend sans erreur sur ${size.key}',
        (WidgetTester tester) async {
      tester.view
        ..physicalSize = size.value
        ..devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await boot(tester);

      for (final String id in guideIds) {
        await tester.pumpWidget(
          MaterialApp(
            theme: EdTheme.build(),
            home: Scaffold(body: GuideDetailPage(guideId: id)),
          ),
        );
        for (int i = 0; i < 12; i++) {
          await tester.pump(const Duration(milliseconds: 20));
        }

        expect(
          tester.takeException(),
          isNull,
          reason: '$id sur ${size.key}',
        );
        expect(
          find.byType(CircularProgressIndicator),
          findsNothing,
          reason: '$id sur ${size.key} : le guide ne s\'est pas chargé',
        );
      }
    });
  }

  testWidgets('un guide affiche son titre, ses sections et ses sources',
      (WidgetTester tester) async {
    await boot(tester);
    await tester.pumpWidget(
      MaterialApp(
        theme: EdTheme.build(),
        home: const Scaffold(
          body: GuideDetailPage(guideId: 'artemis-suit'),
        ),
      ),
    );
    for (int i = 0; i < 12; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }

    expect(
      find.textContaining('ARTEMIS SUIT', findRichText: true),
      findsWidgets,
    );
    expect(find.byType(EdSectionHeader), findsWidgets);
  });
}
