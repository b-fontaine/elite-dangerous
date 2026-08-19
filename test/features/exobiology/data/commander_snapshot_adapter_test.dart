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

/// Importing a flight log must change what the roadmap tells the commander to
/// do. This is the whole point of the import: an app that reads the journal but
/// keeps advising a beginner's first steps would be worthless.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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
}
