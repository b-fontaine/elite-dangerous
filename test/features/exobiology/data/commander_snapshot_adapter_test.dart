import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/commander_snapshot.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/roadmap.dart';
import 'package:elite_dangerous/features/exobiology/domain/repositories/commander_snapshot_source.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/exobiology_roadmap_engine.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/roadmap_step_ids.dart';
import 'package:elite_dangerous/features/journal/domain/repositories/journal_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/path_provider_stub.dart';

/// Importing a flight log must change what the roadmap tells the commander to
/// do. This is the whole point of the import: an app that reads the journal but
/// keeps advising a beginner's first steps would be worthless.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  usePathProviderStub();

  const ExobiologyRoadmapEngine engine = ExobiologyRoadmapEngine();

  /// A real day of play: three samples completing a Stratum Tectonicas, then a
  /// sale with the First Logged bonus, then a second organism left in the hold.
  const List<String> journalLines = <String>[
    '{"timestamp":"2026-08-17T20:00:00Z","event":"ScanOrganic",'
        '"ScanType":"Analyse","Genus":"g","Species":"s",'
        '"Species_Localised":"Stratum Tectonicas","SystemAddress":1,"Body":24}',
    '{"timestamp":"2026-08-17T21:00:00Z","event":"SellOrganicData",'
        '"BioData":[{"Genus":"g","Species":"s",'
        '"Species_Localised":"Stratum Tectonicas",'
        '"Value":19010800,"Bonus":76043200}]}',
    '{"timestamp":"2026-08-17T22:00:00Z","event":"ScanOrganic",'
        '"ScanType":"Analyse","Genus":"g","Species":"s2",'
        '"Species_Localised":"Osseus Discus","SystemAddress":1,"Body":25}',
  ];

  Future<void> boot() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await resetDependencies();
    await configureDependencies();
  }

  Future<void> importJournal() async {
    await getIt<JournalRepository>().importFiles(<JournalFileSource>[
      JournalFileSource(
        name: 'Journal.test.log',
        readLines: () => Stream<String>.fromIterable(journalLines),
      ),
    ]);
  }

  setUp(boot);
  tearDown(resetDependencies);

  test('without a journal the snapshot is empty', () async {
    final CommanderSnapshot snapshot =
        (await getIt<CommanderSnapshotSource>().current()).valueOrNull!;

    expect(snapshot.exobiologyProfitCr, 0);
    expect(snapshot.unsoldOrganicDataCr, 0);
    expect(snapshot.distinctSpeciesSold, 0);
  });

  test('an imported sale feeds the career profit, bonus included', () async {
    await importJournal();

    final CommanderSnapshot snapshot =
        (await getIt<CommanderSnapshotSource>().current()).valueOrNull!;

    expect(snapshot.exobiologyProfitCr, 19010800 + 76043200);
    expect(snapshot.distinctSpeciesSold, 1);
    expect(snapshot.lastSaleAt, isNotNull);
  });

  test('an unsold organism is priced from the catalogue', () async {
    await importJournal();

    final CommanderSnapshot snapshot =
        (await getIt<CommanderSnapshotSource>().current()).valueOrNull!;

    // Osseus Discus is complete but unsold: 12 934 900 Cr at risk.
    expect(snapshot.unsoldOrganicDataCr, 12934900);
  });

  test('the roadmap reacts: selling becomes the top priority', () async {
    await importJournal();

    final CommanderSnapshot snapshot =
        (await getIt<CommanderSnapshotSource>().current()).valueOrNull!;
    final Roadmap roadmap = engine.build(snapshot);

    expect(roadmap.nextStep?.id, RoadmapStepIds.sellRun);
    expect(roadmap.nextStep?.summary, contains('12,9 M Cr'));
  });

  test('the roadmap reacts: the Exobiologist rank moves', () async {
    final Roadmap before =
        engine.build((await getIt<CommanderSnapshotSource>().current()).valueOrNull!);
    await importJournal();
    final Roadmap after =
        engine.build((await getIt<CommanderSnapshotSource>().current()).valueOrNull!);

    expect(before.rank.cumulativeProfitCr, 0);
    expect(after.rank.cumulativeProfitCr, greaterThan(90000000));
    expect(after.rank.rank.index, greaterThan(before.rank.rank.index));
  });

  test('importing the same journal twice does not double the profit', () async {
    await importJournal();
    final int once =
        (await getIt<CommanderSnapshotSource>().current()).valueOrNull!
            .exobiologyProfitCr;
    await importJournal();
    final int twice =
        (await getIt<CommanderSnapshotSource>().current()).valueOrNull!
            .exobiologyProfitCr;

    expect(twice, once);
  });

  test('a journal change pushes a new snapshot to observers', () async {
    final List<CommanderSnapshot> seen = <CommanderSnapshot>[];
    final sub = getIt<CommanderSnapshotSource>().watch().listen(seen.add);
    await Future<void>.delayed(const Duration(milliseconds: 60));

    await importJournal();
    await Future<void>.delayed(const Duration(milliseconds: 120));

    expect(
      seen.map((CommanderSnapshot s) => s.exobiologyProfitCr),
      contains(19010800 + 76043200),
    );
    await sub.cancel();
  });

  group('ce que le journal remplit désormais à la place du commandant', () {
    /// Une journée telle que le jeu l'écrit au démarrage d'une session.
    const List<String> sessionLines = <String>[
      '{"timestamp":"2026-08-19T20:00:00Z","event":"Statistics",'
          '"Exobiology":{"Organic_Data_Profits":2483000000}}',
      '{"timestamp":"2026-08-19T20:00:01Z","event":"EngineerProgress",'
          '"Engineers":[{"Engineer":"Felicity Farseer","EngineerID":300100,'
          '"Progress":"Unlocked","Rank":5}]}',
      '{"timestamp":"2026-08-19T20:00:02Z","event":"ShipLocker",'
          '"Data":[{"Name":"suitschematic","Name_Localised":"Suit Schematic",'
          '"Count":9}]}',
      '{"timestamp":"2026-08-19T20:00:03Z","event":"Loadout",'
          '"Ship":"explorer_nx","Rebuy":2363875,"MaxJumpRange":78.42,'
          '"Modules":[{"Slot":"Slot12_Size1",'
          '"Item":"int_detailedsurfacescanner_tiny"}]}',
      '{"timestamp":"2026-08-19T20:00:04Z","event":"Powerplay",'
          '"Power":"Pranav Antal","Rank":3,"Merits":1520}',
      '{"timestamp":"2026-08-19T20:00:05Z","event":"Cargo","Vessel":"Ship",'
          '"Inventory":[{"Name":"metaalloys","Count":1}]}',
    ];

    Future<CommanderSnapshot> importSession() async {
      await getIt<JournalRepository>().importFiles(<JournalFileSource>[
        JournalFileSource(
          name: 'Journal.session.log',
          readLines: () => Stream<String>.fromIterable(sessionLines),
        ),
      ]);
      return (await getIt<CommanderSnapshotSource>().current()).valueOrNull!;
    }

    test('la portée de saut cesse d\'être une saisie manuelle', () async {
      final CommanderSnapshot snapshot = await importSession();

      expect(snapshot.jumpRangeLy, 78.42);
    });

    test('les matériaux à pied sont comptés par le jeu', () async {
      final CommanderSnapshot snapshot = await importSession();

      expect(snapshot.suitMaterials['Suit Schematic'], 9);
      expect(snapshot.missingMaterial('Suit Schematic', 12), 3);
    });

    test('un ingénieur débloqué est reconnu par son nom', () async {
      final CommanderSnapshot snapshot = await importSession();

      // Le journal nomme les ingénieurs, la feuille de route les indexe par
      // identifiant : le rapprochement se fait sur le nom exact du jeu.
      expect(snapshot.unlockedShipEngineerIds, contains('felicity_farseer'));
      expect(snapshot.meetsFarseerRankRequirement, isFalse);
    });

    test('le Meta-Alloy en soute est vu sans case à cocher', () async {
      final CommanderSnapshot snapshot = await importSession();

      expect(snapshot.hasMetaAlloy, isTrue);
    });

    test('l\'allégeance Powerplay et sa majoration sont détectées', () async {
      final CommanderSnapshot snapshot = await importSession();

      expect(snapshot.pledgedPower, 'Pranav Antal');
      expect(snapshot.hasExobiologySalesBonus, isTrue);
    });

    test('le détecteur de surface est lu dans l\'équipement', () async {
      final CommanderSnapshot snapshot = await importSession();

      expect(snapshot.hasDetailedSurfaceScanner, isTrue);
    });

    test('le total de carrière du jeu prime sur ce que l\'app a importé',
        () async {
      // L'app ne peut avoir importé qu'une partie de l'historique : ses
      // chiffres sont des minorants, celui de `Statistics` est le vrai.
      await importJournal();
      final CommanderSnapshot snapshot = await importSession();

      expect(snapshot.exobiologyProfitCr, 2483000000);
      expect(snapshot.exobiologistRank.rank.name, isNotEmpty);
    });
  });

}
