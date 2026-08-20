import 'dart:convert';
import 'dart:io';

import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/core/format/credits.dart';
import 'package:elite_dangerous/core/storage/storage_keys.dart';
import 'package:elite_dangerous/features/exobiology/presentation/pages/field_dashboard_page.dart';
import 'package:elite_dangerous/features/journal/domain/entities/game_status.dart';
import 'package:elite_dangerous/features/journal/domain/repositories/journal_repository.dart';
import 'package:elite_dangerous/features/journal/domain/repositories/live_journal_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/path_provider_stub.dart';

/// The screen a commander reads while flying, wired to the real dependency
/// graph and to real files on disk — because everything it claims comes from
/// files, and a stub would prove nothing about the part that can break.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  usePathProviderStub();

  /// A commander who honked a system, mapped a moon with two organisms on it,
  /// analysed one of them, and has not sold anything yet.
  const List<String> journal = <String>[
    '{"timestamp":"2026-08-20T12:00:00Z","event":"Location",'
        '"StarSystem":"Hyades Sector DR-V c2-23",'
        '"SystemAddress":2871051298721,"Docked":false}',
    '{"timestamp":"2026-08-20T12:01:00Z","event":"FSSDiscoveryScan",'
        '"SystemName":"Hyades Sector DR-V c2-23",'
        '"SystemAddress":2871051298721,"BodyCount":12,"NonBodyCount":2,'
        '"Progress":0.1}',
    '{"timestamp":"2026-08-20T12:02:00Z","event":"Scan","ScanType":"Detailed",'
        '"BodyName":"Hyades Sector DR-V c2-23 A 5","BodyID":5,'
        '"SystemAddress":2871051298721,"StarSystem":"Hyades Sector DR-V c2-23",'
        '"PlanetClass":"High metal content body","Landable":true,'
        '"SurfaceGravity":1.6,"SurfaceTemperature":320.0,'
        '"DistanceFromArrivalLS":880.0,"WasDiscovered":false,'
        '"WasMapped":false}',
    '{"timestamp":"2026-08-20T12:03:00Z","event":"SAASignalsFound",'
        '"BodyName":"Hyades Sector DR-V c2-23 A 5","BodyID":5,'
        '"SystemAddress":2871051298721,'
        '"Signals":[{"Type":"\$SAA_SignalType_Biological;","Count":2}],'
        r'"Genuses":[{"Genus":"$Codex_Ent_Stratum_Genus_Name;",'
        '"Genus_Localised":"Stratum"}]}',
    '{"timestamp":"2026-08-20T12:10:00Z","event":"ScanOrganic",'
        '"ScanType":"Analyse","Genus":"\$Codex_Ent_Stratum_Genus_Name;",'
        '"Species":"\$Codex_Ent_Stratum_02_Name;",'
        '"Species_Localised":"Stratum Tectonicas",'
        '"SystemAddress":2871051298721,"Body":5}',
  ];

  late Directory saveFolder;

  Future<void> boot({String? journalFolder}) async {
    // Construite avant d'être passée : en élément de collection, l'analyse
    // exige la forme `?valeur`, que le formateur du projet ne sait pas lire.
    final Map<String, Object> preferences = <String, Object>{};
    if (journalFolder != null) {
      preferences['flutter.${StorageKeys.journalLocalFolder}'] = journalFolder;
    }
    SharedPreferences.setMockInitialValues(preferences);
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await resetDependencies();
    await configureDependencies();
  }

  Future<void> importJournal(WidgetTester tester) => tester.runAsync(
        () => getIt<JournalRepository>().importFiles(<JournalFileSource>[
          JournalFileSource(
            name: 'Journal.2026-08-20T120000.01.log',
            readLines: () => Stream<String>.fromIterable(journal),
          ),
        ]),
      );

  setUp(() async {
    // `rootBundle` mémorise le *Future* d'un asset, pas sa valeur : sans ce
    // vidage, le catalogue du deuxième test attend une zone morte.
    rootBundle.clear();
    saveFolder = await Directory.systemTemp.createTemp('dashboard_test');
  });

  tearDown(() async {
    await resetDependencies();
    if (saveFolder.existsSync()) {
      await saveFolder.delete(recursive: true);
    }
  });

  /// Runs [body] as though the app were on a desktop.
  ///
  /// The override has to be undone *inside* the test body: `flutter_test`
  /// checks that no foundation debug variable outlived the test, and it checks
  /// before the tear-downs run.
  /// Also stops the poller before returning: the live repository arms a
  /// ten-second `Timer.periodic`, and `flutter_test` refuses to end a test
  /// with a timer still pending. Disposing the repository outright rather than
  /// relying on the tree's teardown to cancel the last subscription — that
  /// chain is asynchronous, and a test that depends on it passes or fails by
  /// timing.
  Future<void> onDesktop(
    WidgetTester tester,
    Future<void> Function() body,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    try {
      await body();
    } finally {
      await tester.runAsync(() => getIt<LiveJournalRepository>().dispose());
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      debugDefaultTargetPlatformOverride = null;
    }
  }

  void writeStatus(Map<String, dynamic> extra) =>
      File('${saveFolder.path}/Status.json').writeAsStringSync(
        jsonEncode(<String, dynamic>{
          'timestamp': '2026-08-20T12:29:00Z',
          'event': 'Status',
          ...extra,
        }),
      );

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
  }) async {
    tester.view
      ..physicalSize = const Size(1440, 3600)
      ..devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: FieldDashboardPage())),
    );
    await settle(tester, until);
  }

  testWidgets('sans bureau, la page dit pourquoi et depuis quand', (
    WidgetTester tester,
  ) async {
    // La plateforme par défaut d'un test widget est Android : exactement le
    // cas à dégrader.
    await boot();

    // Les composants du design system rendent leurs titres en capitales.
    await open(
      tester,
      until: () => find.text('SUIVI INDISPONIBLE').evaluate().isNotEmpty,
    );

    expect(find.textContaining('Au 20 août 2026'), findsOneWidget);
    expect(
      find.textContaining('l\'ordinateur où tourne Elite Dangerous'),
      findsOneWidget,
    );
  });

  testWidgets('avec le jeu ouvert, elle situe le commandant', (
    WidgetTester tester,
  ) async {
    await onDesktop(tester, () async {
      writeStatus(<String, dynamic>{
        'Flags':
            StatusFlag.landed | StatusFlag.hasLatLong | StatusFlag.inMainShip,
        'Flags2': 0,
        'BodyName': 'Hyades Sector DR-V c2-23 A 5',
        'Latitude': 50.5426,
        'Longitude': 137.4150,
        'Gravity': 1.63,
        'Temperature': 320.0,
      });
      await boot(journalFolder: saveFolder.path);
      await importJournal(tester);

      await open(
        tester,
        until: () => find.text('POSITION').evaluate().isNotEmpty,
      );

      // Le corps vient de Status.json, que le journal ne peut pas donner tant
      // que rien ne s'est produit.
      expect(find.text('Hyades Sector DR-V c2-23 A 5'), findsWidgets);
      expect(find.text('50.5426 · 137.4150'), findsOneWidget);
      expect(find.textContaining('Hyades Sector DR-V c2-23'), findsWidgets);
      expect(find.text('1.63 g'), findsOneWidget);
    });
  });

  testWidgets('elle dit ce qui reste à échantillonner ici', (
    WidgetTester tester,
  ) async {
    await onDesktop(tester, () async {
      writeStatus(<String, dynamic>{
        'Flags': StatusFlag.landed | StatusFlag.inMainShip,
        'BodyName': 'Hyades Sector DR-V c2-23 A 5',
      });
      await boot(journalFolder: saveFolder.path);
      await importJournal(tester);

      await open(
        tester,
        until: () => find.textContaining('ICI —').evaluate().isNotEmpty,
      );

      // Deux signaux, un analysé : il en reste un.
      expect(
        find.textContaining('2 signal(aux) · 1 analysé(s) · 1 restant(s)'),
        findsOneWidget,
      );
      expect(find.textContaining('Genres relevés : Stratum'), findsOneWidget);
      // Le dénominateur du balayage d'arrivée.
      expect(find.textContaining('1 corps scanné(s) sur 12'), findsOneWidget);
    });
  });

  testWidgets('elle chiffre ce qu\'une mort effacerait', (
    WidgetTester tester,
  ) async {
    await onDesktop(tester, () async {
      writeStatus(<String, dynamic>{'Flags': StatusFlag.landed});
      await boot(journalFolder: saveFolder.path);
      await importJournal(tester);

      await open(
        tester,
        until: () =>
            find.text('DONNÉES NON VENDUES').evaluate().isNotEmpty &&
            find
                .textContaining(formatCreditsExact(19010800))
                .evaluate()
                .isNotEmpty,
      );

      expect(find.text('UNE MORT EFFACE TOUT'), findsOneWidget);
      expect(find.textContaining('1 organisme(s) complet(s)'), findsOneWidget);
      expect(find.text('Stratum Tectonicas'), findsWidgets);
    });
  });

  for (final (String name, Size size) in <(String, Size)>[
    ('téléphone', const Size(360, 800)),
    ('ordinateur', const Size(1440, 900)),
  ]) {
    testWidgets('elle tient sur $name', (WidgetTester tester) async {
      // Le tableau de bord est le seul écran lu en jeu, souvent sur un second
      // écran étroit : un débordement y est un défaut, pas une coquetterie.
      await onDesktop(tester, () async {
        writeStatus(<String, dynamic>{
          'Flags': StatusFlag.landed | StatusFlag.hasLatLong,
          'BodyName': 'Hyades Sector DR-V c2-23 A 5',
          'Latitude': 50.5426,
          'Longitude': 137.4150,
          'Altitude': 12450.0,
          'Gravity': 1.63,
          'Temperature': 320.0,
        });
        await boot(journalFolder: saveFolder.path);
        await importJournal(tester);

        tester.view
          ..physicalSize = size
          ..devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: FieldDashboardPage())),
        );
        await settle(
          tester,
          () => find.text('TERRAIN').evaluate().isNotEmpty,
        );

        // Les slivers hors écran ne sont pas construits : sans défilement, un
        // débordement en bas de page ne serait jamais mis en page, donc jamais
        // vu. On descend jusqu'au bout.
        for (int i = 0; i < 12; i++) {
          expect(tester.takeException(), isNull, reason: 'sur $name');
          await tester.drag(
            find.byType(CustomScrollView),
            const Offset(0, -400),
          );
          await tester.pump();
        }
        expect(tester.takeException(), isNull, reason: 'sur $name');
      });
    });
  }
}
