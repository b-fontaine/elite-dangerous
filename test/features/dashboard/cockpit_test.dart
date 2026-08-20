import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/core/storage/storage_keys.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/dashboard/presentation/pages/career_page.dart';
import 'package:elite_dangerous/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:elite_dangerous/features/dashboard/presentation/pages/engineers_page.dart';
import 'package:elite_dangerous/features/dashboard/presentation/pages/fleet_page.dart';
import 'package:elite_dangerous/features/dashboard/presentation/pages/on_foot_page.dart';
import 'package:elite_dangerous/features/dashboard/presentation/pages/station_page.dart';
import 'package:elite_dangerous/features/exobiology/presentation/widgets/roadmap_step_card.dart';
import 'package:elite_dangerous/features/journal/domain/repositories/journal_repository.dart';
import 'package:elite_dangerous/features/materials/presentation/pages/materials_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fixtures/capi_profile_capture.dart';
import '../../fixtures/path_provider_stub.dart';

/// The three formats the app claims to support.
const Size phone = Size(360, 800);
const Size tablet = Size(768, 1024);
const Size desktop = Size(1440, 900);

/// Tall enough that every sliver of a detail page is built.
/// `find` cannot see a sliver the framework never constructed.
const Size tallDesktop = Size(1440, 3200);

/// A session such as the game writes it at start-up: the half `/profile`
/// cannot supply.
const List<String> sessionJournal = <String>[
  '{"timestamp":"2026-08-19T20:00:00Z","event":"Statistics",'
      '"Exobiology":{"Organic_Data_Profits":2483000000,"First_Logged":61},'
      '"Exploration":{"Systems_Visited":4210,"First_Footfalls":37}}',
  '{"timestamp":"2026-08-19T20:00:01Z","event":"Reputation",'
      '"Empire":92.5,"Federation":-14.0}',
  '{"timestamp":"2026-08-19T20:00:02Z","event":"EngineerProgress",'
      '"Engineers":[{"Engineer":"Felicity Farseer","EngineerID":300100,'
      '"Progress":"Unlocked","Rank":5},'
      '{"Engineer":"Domino Green","Progress":"Known"}]}',
  '{"timestamp":"2026-08-19T20:00:03Z","event":"Loadout",'
      '"Ship":"explorer_nx","Rebuy":2363875,"MaxJumpRange":78.42}',
  '{"timestamp":"2026-08-19T20:00:04Z","event":"ShipLocker",'
      '"Data":[{"Name":"suitschematic","Name_Localised":"Suit Schematic",'
      '"Count":9}]}',
  '{"timestamp":"2026-08-19T20:00:05Z","event":"Powerplay",'
      '"Power":"Pranav Antal","Rank":3,"Merits":1520}',
  '{"timestamp":"2026-08-19T20:10:00Z","event":"FSDJump",'
      '"StarSystem":"Caeritis","Body":"Caeritis A","BodyType":"Star"}',
  '{"timestamp":"2026-08-19T20:20:00Z","event":"ApproachBody",'
      '"StarSystem":"Caeritis","Body":"Caeritis A 3 a"}',
];

/// The same session, ending docked rather than in orbit.
const List<String> dockedJournal = <String>[
  '{"timestamp":"2026-08-19T21:00:00Z","event":"Docked",'
      '"StationName":"Bernoulli Vision","StationType":"Coriolis",'
      '"StarSystem":"Caeritis","DistFromStarLS":812.0,'
      '"StationEconomy_Localised":"Haute technologie",'
      '"LandingPads":{"Small":4,"Medium":4,"Large":9},'
      '"StationServices":["dock","vistagenomics","bartender"]}',
];

/// Pumps until the tree stops changing.
///
/// Not `pumpAndSettle`: a loading state shows a `CircularProgressIndicator`,
/// whose animation never ends, and settling would wait for it forever. The
/// `runAsync` half lets the real graph's file and preference reads complete —
/// they resolve outside the fake async zone.
Future<void> settle(
  WidgetTester tester, {
  int frames = 40,
  bool Function()? until,
}) async {
  for (int i = 0; i < frames; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 5)),
    );
    await tester.pump(const Duration(milliseconds: 20));
    if (until != null && until()) {
      return;
    }
  }
}

Future<void> pumpAt(
  WidgetTester tester,
  Widget page,
  Size size, {
  bool Function()? until,
}) async {
  tester.view
    ..physicalSize = size
    ..devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    MaterialApp(theme: EdTheme.build(), home: Scaffold(body: page)),
  );
  await settle(tester, until: until);
}

/// `EdSectionHeader`, `EdCallout`, `EdStatTile` and `EdTag` all upper-case
/// their label — the design system's HUD idiom, transcribed from the guides.
Finder findSection(String title) => find.text(title.toUpperCase());
Finder findCallout(String title) => find.text(title.toUpperCase());
Finder findTile(String label) => find.text(label.toUpperCase());
Finder findTag(String label) => find.text(label.toUpperCase());

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  usePathProviderStub();

  /// Boots the real dependency graph, optionally with the captured profile
  /// already in the cache — which is exactly where the repository reads it
  /// from after a sync, so the pages are exercised against the real payload.
  Future<void> boot({bool withProfile = false}) async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      if (withProfile)
        'flutter.${StorageKeys.commanderProfile}': capiProfileCapture,
    });
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await resetDependencies();
    await configureDependencies();
  }

  setUp(boot);
  tearDown(resetDependencies);

  /// The full picture: a synchronised profile and a played session.
  ///
  /// Run inside [WidgetTester.runAsync] because the journal now lives in a
  /// real file: the import needs the actual event loop, which the fake async
  /// zone a widget test runs in does not turn.
  Future<void> seed(
    WidgetTester tester, {
    List<String> journal = sessionJournal,
  }) async {
    await tester.runAsync(() async {
      await boot(withProfile: true);
      await getIt<JournalRepository>().importFiles(<JournalFileSource>[
        JournalFileSource(
          name: 'Journal.session.log',
          readLines: () => Stream<String>.fromIterable(journal),
        ),
      ]);
    });
  }

  group('poste de pilotage', () {
    testWidgets('montre trois prochaines étapes, dont une seule en avant',
        (WidgetTester tester) async {
      await pumpAt(
        tester,
        const DashboardPage(),
        tallDesktop,
        until: () => find.byType(RoadmapStepCard).evaluate().length >= 3,
      );

      // La feuille de route en produit toujours plus de trois pour un
      // commandant qui débute ; le cockpit en montre exactement trois.
      expect(find.byType(RoadmapStepCard), findsNWidgets(3));

      final List<RoadmapStepCard> cards = tester
          .widgetList<RoadmapStepCard>(find.byType(RoadmapStepCard))
          .toList(growable: false);

      // Seule la première répond à « quoi maintenant » ; crier les trois ne
      // dirait rien.
      expect(cards.first.isHighlighted, isTrue);
      expect(
        cards.skip(1).every((RoadmapStepCard card) => !card.isHighlighted),
        isTrue,
      );
    });

    testWidgets('ouvre une porte vers chacune des pages de détail',
        (WidgetTester tester) async {
      await pumpAt(tester, const DashboardPage(), tallDesktop);

      for (final String card in <String>[
        'Carrière',
        'Flotte',
        'Équipement à pied',
        'Ingénieurs',
        'Matériaux',
      ]) {
        expect(find.text(card), findsOneWidget, reason: card);
      }
    });

    testWidgets('invite à fournir des données quand il n\'y en a aucune',
        (WidgetTester tester) async {
      await pumpAt(tester, const DashboardPage(), tallDesktop);

      expect(find.textContaining('Connecte un compte Frontier'), findsOneWidget);
    });

    testWidgets('situe le commandant : système, corps et station',
        (WidgetTester tester) async {
      await seed(tester);
      await pumpAt(
        tester,
        const DashboardPage(),
        tallDesktop,
        until: () => find.text('Caeritis A 3 a').evaluate().isNotEmpty,
      );

      expect(findTile('Système'), findsOneWidget);
      expect(findTile('Corps'), findsOneWidget);
      expect(findTile('Station'), findsWidgets);
      // Le corps ne vient que du journal : la CAPI ne le connaît pas.
      expect(find.text('Caeritis A 3 a'), findsOneWidget);
    });

    testWidgets('dit que le corps vient du journal quand il manque',
        (WidgetTester tester) async {
      await pumpAt(tester, const DashboardPage(), tallDesktop);

      expect(
        find.textContaining('la CAPI ne le donne pas'),
        findsWidgets,
      );
    });

    for (final (String name, Size size) in <(String, Size)>[
      ('téléphone', phone),
      ('tablette', tablet),
      ('ordinateur', desktop),
    ]) {
      testWidgets('tient sans débordement sur $name',
          (WidgetTester tester) async {
        await seed(tester);
        await pumpAt(tester, const DashboardPage(), size);

        expect(tester.takeException(), isNull);
      });
    }
  });

  group('pages de détail', () {
    testWidgets('carrière : rangs, réputations et allégeance',
        (WidgetTester tester) async {
      await seed(tester);
      await pumpAt(
        tester,
        const CareerPage(),
        tallDesktop,
        until: () => find.textContaining('Pranav Antal').evaluate().isNotEmpty,
      );

      expect(findSection('Rangs pilote'), findsOneWidget);
      expect(findSection('Réputations'), findsOneWidget);
      expect(find.textContaining('Pranav Antal'), findsWidgets);
      // Le +30 % est la raison pour laquelle l'allégeance figure ici.
      expect(find.textContaining('+30 %'), findsOneWidget);
    });

    testWidgets('carrière : dit d\'où viendraient les réputations manquantes',
        (WidgetTester tester) async {
      await pumpAt(tester, const CareerPage(), tallDesktop);

      expect(findCallout('Aucune réputation connue'), findsOneWidget);
      expect(find.textContaining('`Reputation`'), findsOneWidget);
    });

    testWidgets('ingénieurs : distingue débloqué, connu et inconnu',
        (WidgetTester tester) async {
      await seed(tester);
      await pumpAt(
        tester,
        const EngineersPage(),
        tallDesktop,
        until: () => find.text('DÉBLOQUÉ').evaluate().isNotEmpty,
      );

      expect(find.text('DÉBLOQUÉ'), findsWidgets);
      expect(find.text('CONNU'), findsWidgets);
    });

    testWidgets('ingénieurs : sans journal, explique pourquoi c\'est vide',
        (WidgetTester tester) async {
      await pumpAt(tester, const EngineersPage(), tallDesktop);

      expect(findCallout('Aucun ingénieur connu'), findsOneWidget);
      expect(find.textContaining('ne les expose pas'), findsOneWidget);
    });

    testWidgets('matériaux : mesure l\'inventaire contre le prochain grade',
        (WidgetTester tester) async {
      await seed(tester);
      await pumpAt(
        tester,
        const MaterialsPage(),
        tallDesktop,
        // Le nom d'un matériau ne prouve plus rien : le plan de montée en
        // grade le nomme même quand l'inventaire est encore vide. La
        // disparition du « aucun inventaire » est le seul marqueur fiable.
        until: () => findCallout('Aucun inventaire').evaluate().isEmpty,
      );

      // La page ne tient plus sur un écran : le plan de combinaison et les
      // blueprints passent devant l'inventaire, qui reste plus bas.
      final Finder inventaire = findSection('Inventaire à pied (1)');
      await tester.scrollUntilVisible(
        inventaire,
        400,
        scrollable: find.byType(Scrollable).first,
      );

      expect(inventaire, findsOneWidget);
      expect(find.text('Suit Schematic'), findsWidgets);
    });

    testWidgets('à pied : annonce que le grade des armes est indisponible',
        (WidgetTester tester) async {
      await pumpAt(tester, const OnFootPage(), tallDesktop);

      // Frontier envoie « NYI » à la place : mieux vaut le dire que laisser
      // croire à un bug.
      expect(
        findCallout('Le grade des armes n\'est pas disponible'),
        findsNothing,
      );
      expect(findCallout('Aucun loadout'), findsOneWidget);
    });

    testWidgets('flotte : sans vaisseau, oriente vers la synchronisation',
        (WidgetTester tester) async {
      await pumpAt(tester, const FleetPage(), tallDesktop);

      expect(findCallout('Aucun vaisseau connu'), findsOneWidget);
    });

    testWidgets('station : groupe les services par usage',
        (WidgetTester tester) async {
      await seed(tester);
      await pumpAt(
        tester,
        const StationPage(),
        tallDesktop,
        until: () => findTag('Vista Genomics').evaluate().isNotEmpty,
      );

      // Vingt-six clés à plat ne répondent à aucune question ; groupées, si.
      expect(find.text('Exobiologie'), findsOneWidget);
      expect(find.text('À pied'), findsOneWidget);
      expect(findTag('Vista Genomics'), findsWidgets);
      expect(findTag('Barman'), findsWidgets);
    });

    testWidgets('station : montre ce que seul le journal connaît',
        (WidgetTester tester) async {
      await seed(tester, journal: dockedJournal);
      await pumpAt(
        tester,
        const StationPage(),
        tallDesktop,
        until: () => find.text('Coriolis').evaluate().isNotEmpty,
      );

      expect(find.text('Coriolis'), findsWidgets);
      expect(find.text('812 ls'), findsOneWidget);
      expect(find.text('9 L · 4 M · 4 S'), findsOneWidget);
    });

    testWidgets('flotte : groupe l\'équipement et montre les vides',
        (WidgetTester tester) async {
      await seed(tester);
      await pumpAt(
        tester,
        const FleetPage(),
        tallDesktop,
        until: () =>
            find.textContaining('Modules internes optionnels').evaluate()
                .isNotEmpty,
      );

      expect(find.textContaining('Points d\'emport'), findsOneWidget);
      expect(find.textContaining('Points utilitaires'), findsOneWidget);
      expect(find.textContaining('Modules internes principaux'), findsOneWidget);
      // Slot04 est un trou de numérotation, de taille bornée et non affirmée.
      expect(find.text('Slot04 (taille ≤ 6)'), findsOneWidget);
      expect(find.text('TinyHardpoint3'), findsOneWidget);
    });

    testWidgets('flotte : nomme le Nomad au lieu de lander01',
        (WidgetTester tester) async {
      await seed(tester);
      await pumpAt(
        tester,
        const FleetPage(),
        tallDesktop,
        until: () => find.textContaining('Nomad').evaluate().isNotEmpty,
      );

      expect(find.textContaining('Nomad'), findsWidgets);
      expect(find.textContaining('lander01'), findsNothing);
    });

    for (final (String name, Size size) in <(String, Size)>[
      ('téléphone', phone),
      ('ordinateur', desktop),
    ]) {
      testWidgets('les six pages tiennent sur $name',
          (WidgetTester tester) async {
        await seed(tester);
        for (final Widget page in <Widget>[
          const CareerPage(),
          const FleetPage(),
          const OnFootPage(),
          const EngineersPage(),
          const MaterialsPage(),
          const StationPage(),
        ]) {
          await pumpAt(tester, page, size);
          expect(tester.takeException(), isNull, reason: '$page sur $name');
        }
      });
    }
  });
}
