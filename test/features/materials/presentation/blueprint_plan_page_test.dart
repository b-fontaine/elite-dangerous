import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/core/storage/storage_keys.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/journal/domain/repositories/journal_repository.dart';
import 'package:elite_dangerous/features/materials/presentation/pages/blueprint_plan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/capi_profile_capture.dart';
import '../../../fixtures/path_provider_stub.dart';

/// The screen that answers the question the app could not: *why can I not get
/// the FSD range materials, and what do I do about it?*
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  usePathProviderStub();

  /// The commander who asked: a few of the cheap materials, two of the one
  /// that gates the whole blueprint.
  const List<String> journal = <String>[
    '{"timestamp":"2026-08-19T20:00:00Z","event":"Materials",'
        '"Raw":[{"Name":"phosphorus","Count":40},'
        '{"Name":"manganese","Count":12}],'
        '"Manufactured":[{"Name":"chemicalprocessors",'
        '"Name_Localised":"Processeurs chimiques","Count":6}],'
        '"Encoded":[{"Name":"dataminedwake",'
        '"Name_Localised":"Sillage exploité","Count":2}]}',
  ];

  /// Boots the real dependency graph. In `setUp`, like every other page test
  /// here: resolving the graph inside `runAsync` works the first time and then
  /// leaves the asset bundle unable to answer, which strands the screen on its
  /// loading state.
  Future<void> boot() async {
    // The dossier is only "known" once a profile is cached: without one the
    // scope hands the page an empty commander and the journal never lands.
    SharedPreferences.setMockInitialValues(<String, Object>{
      'flutter.${StorageKeys.commanderProfile}': capiProfileCapture,
    });
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await resetDependencies();
    await configureDependencies();
  }

  /// The journal lives in a real file, so importing it needs the actual event
  /// loop rather than the fake async zone a widget test runs in.
  Future<void> importJournal(WidgetTester tester) => tester.runAsync(
        () => getIt<JournalRepository>().importFiles(<JournalFileSource>[
          JournalFileSource(
            name: 'Journal.session.log',
            readLines: () => Stream<String>.fromIterable(journal),
          ),
        ]),
      );

  setUp(() async {
    // `rootBundle` mémorise le *Future* d'un asset, pas sa valeur. Celui du
    // premier test appartient à une zone qui n'existe plus au deuxième, et
    // l'attendre y laisse l'écran sur son état de chargement pour toujours.
    rootBundle.clear();
    await boot();
  });
  tearDown(resetDependencies);

  /// Pumps until [until] holds. Not `pumpAndSettle`: the loading state spins a
  /// `CircularProgressIndicator` that never finishes.
  Future<void> settle(WidgetTester tester, bool Function() until) async {
    for (int i = 0; i < 80; i++) {
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 5)),
      );
      await tester.pump(const Duration(milliseconds: 20));
      if (until()) {
        return;
      }
    }
    fail('L\'écran n\'a jamais atteint l\'état attendu.');
  }

  Future<void> open(
    WidgetTester tester, {
    required bool Function() until,
    String id = 'fsd_increased_range',
  }) async {
    await importJournal(tester);
    tester.view
      ..physicalSize = const Size(1440, 3200)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        theme: EdTheme.build(),
        home: Scaffold(body: BlueprintPlanPage(blueprintId: id)),
      ),
    );
    await settle(tester, until);
  }

  /// Scrolls the page until [finder] matches, then asserts it does.
  ///
  /// A sliver below the viewport is never built, and `find` cannot see what
  /// was never laid out — this page is far longer than one screen.
  Future<void> expectVisible(WidgetTester tester, Finder finder) async {
    if (finder.evaluate().isEmpty) {
      await tester.scrollUntilVisible(
        finder,
        600,
        scrollable: find.byType(Scrollable).first,
      );
    }
    expect(finder, findsWidgets);
  }

  /// The plan measured against the journal: 41 units from scratch, 27 once the
  /// imported inventory is counted.
  bool measured() => find.textContaining('Il manque 27').evaluate().isNotEmpty;

  testWidgets('dit ce qui bloque avant de dire ce qui manque',
      (WidgetTester tester) async {
    await open(tester, until: measured);

    // La cause, pas le symptôme : sans scanner de sillage, aucune quantité de
    // prospection ne complètera ce blueprint.
    expect(find.text('CE QUI BLOQUE'), findsOneWidget);
    expect(find.textContaining('Frame Shift Wake Scanner'), findsWidgets);
  });

  testWidgets('compte l\'inventaire dans la langue du jeu, pas du client',
      (WidgetTester tester) async {
    await open(tester, until: measured);

    // Le journal a écrit « Sillage exploité » et « Processeurs chimiques » ;
    // la recette parle en symboles internes. Les deux doivent se rejoindre,
    // et se rejoindre en anglais.
    await expectVisible(tester, find.text('Datamined Wake Exceptions'));
    await expectVisible(tester, find.text('2 / 5'));
    await expectVisible(tester, find.text('Chemical Processors'));
    await expectVisible(tester, find.text('6 / 5'));
  });

  testWidgets('propose de descendre un surplus chez le trader',
      (WidgetTester tester) async {
    await open(tester, until: measured);

    // Un Chemical Processors est en trop : il peut descendre d'un grade.
    await expectVisible(tester, find.text('À ÉCHANGER CHEZ LE TRADER'));
  });

  testWidgets('groupe les sources par famille au lieu de les répéter',
      (WidgetTester tester) async {
    await open(tester, until: measured);

    // Les quatre Wake Scans du blueprint viennent tous du même module :
    // l'expliquer quatre fois enterrerait la ligne qui, elle, diffère.
    await expectVisible(tester, find.text('OÙ TROUVER CE QUI MANQUE'));
    await expectVisible(tester, find.text('WAKE SCANS · ENCODÉ'));
    expect(find.text('WAKE SCANS · ENCODÉ'), findsOneWidget);
  });

  testWidgets('nomme les trois ingénieurs et leur plafond',
      (WidgetTester tester) async {
    await open(tester, until: measured);

    await expectVisible(tester, find.text('Felicity Farseer'));
    expect(find.text('Elvira Martuuk'), findsOneWidget);
    expect(find.text('Mel Brandon'), findsOneWidget);
    expect(find.text('jusqu\'au grade 5'), findsNWidgets(3));
  });

  testWidgets('mesure aussi les effets expérimentaux contre l\'inventaire',
      (WidgetTester tester) async {
    await open(tester, until: measured);

    // Mass Manager et Deep Charge coûtent exactement les mêmes matériaux ; le
    // choix se fait donc sur l'effet, pas sur le prix, et l'écran doit le
    // rendre visible plutôt que de laisser comparer deux listes identiques.
    // `EdSubHeader` met son titre en capitales, comme tout le HUD.
    await expectVisible(tester, find.text('MASS MANAGER'));
    await expectVisible(tester, find.text('DEEP CHARGE'));
    // Les 5 Atypical Disrupted Wake Echoes de la recette, comptés contre les
    // zéro que le commandant possède — et non listés à sec.
    expect(find.text('0 / 5'), findsWidgets);
  });

  testWidgets('un blueprint absent le dit au lieu de rester vide',
      (WidgetTester tester) async {
    await open(
      tester,
      id: 'inexistant',
      until: () => find.byType(EdEmptyView).evaluate().isNotEmpty,
    );

    expect(find.byType(EdEmptyView), findsOneWidget);
    expect(find.textContaining('base embarquée'), findsOneWidget);
  });
}
