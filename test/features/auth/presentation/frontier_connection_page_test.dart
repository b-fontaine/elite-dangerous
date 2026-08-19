import 'package:elite_dangerous/core/config/build_config.dart';
import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/auth/presentation/pages/frontier_connection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeBuildConfig implements BuildConfig {
  const _FakeBuildConfig(this.frontierClientId);

  @override
  final String frontierClientId;
}

/// The client id this build would ship with. A test that ever finds it on
/// screen has found the leak this page is meant not to have.
const String _compiled = 'BUILD-1234-5678-9012';

/// Pumps until the tree settles. Reading the client id crosses two platform
/// channels (keychain, preferences), which only complete outside the fake
/// async zone.
Future<void> _settle(WidgetTester tester, {int frames = 12}) async {
  for (int i = 0; i < frames; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 10)),
    );
    await tester.pump(const Duration(milliseconds: 20));
  }
}

Future<void> _pumpPage(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: EdTheme.build(),
      home: const Scaffold(body: FrontierConnectionPage()),
    ),
  );
  await _settle(tester);
}

TextField _clientIdField(WidgetTester tester) =>
    tester.widget<TextField>(find.byType(TextField).first);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await configureDependencies();
    // Stands in for a build made with a `.env`.
    await getIt.unregister<BuildConfig>();
    getIt.registerLazySingleton<BuildConfig>(
      () => const _FakeBuildConfig(_compiled),
    );
  });

  tearDown(resetDependencies);

  testWidgets('the client id compiled into the build never reaches the screen',
      (WidgetTester tester) async {
    await _pumpPage(tester);

    expect(_clientIdField(tester).controller!.text, isEmpty);
    expect(find.textContaining(_compiled), findsNothing);
  });

  testWidgets('the client id field is masked', (WidgetTester tester) async {
    await _pumpPage(tester);

    expect(_clientIdField(tester).obscureText, isTrue);
  });

  testWidgets('what the commander types can be revealed to be checked',
      (WidgetTester tester) async {
    await _pumpPage(tester);

    await tester.enterText(find.byType(TextField).first, 'TYPED-1111');
    // The form sits far down a scroll view — well past the 800x600 of test
    // surface — and a tap on what is off screen lands on nothing. Focusing the
    // field scrolls towards it on its own, so let that animation land before
    // asking for the rest of the way.
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byTooltip('Afficher'));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Afficher'));
    await tester.pump();

    expect(_clientIdField(tester).obscureText, isFalse);
    expect(_clientIdField(tester).controller!.text, 'TYPED-1111');
  });

  testWidgets('the field says the build default is in use, without showing it',
      (WidgetTester tester) async {
    await _pumpPage(tester);

    expect(find.textContaining('Ce build embarque déjà un client_id'),
        findsOneWidget);
  });
}
