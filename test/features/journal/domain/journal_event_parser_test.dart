import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/journal/domain/services/journal_event_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const JournalEventParser parser = JournalEventParser();

  group('ScanOrganic', () {
    const String line = '{ "timestamp":"2026-08-17T21:04:11Z", '
        '"event":"ScanOrganic", "ScanType":"Analyse", '
        '"Genus":"\$Codex_Ent_Stratum_Genus_Name;", '
        '"Genus_Localised":"Stratum", '
        '"Species":"\$Codex_Ent_Stratum_07_Name;", '
        '"Species_Localised":"Stratum Tectonicas", '
        '"Variant":"\$Codex_Ent_Stratum_07_F_Name;", '
        '"Variant_Localised":"Stratum Tectonicas - Green", '
        '"SystemAddress":1213084977515, "Body":24 }';

    test('parses the third sample as completing the organism', () {
      final ScanOrganicEvent event = parser.parseLine(line)! as ScanOrganicEvent;

      expect(event.scanType, OrganicScanType.analyse);
      expect(event.completesOrganism, isTrue);
      expect(event.displayName, 'Stratum Tectonicas');
      expect(event.genusLocalised, 'Stratum');
      expect(event.variantLocalised, 'Stratum Tectonicas - Green');
      expect(event.systemAddress, 1213084977515);
      expect(event.bodyId, 24);
    });

    test('a Log scan does not complete the organism', () {
      final ScanOrganicEvent event = parser
          .parseLine(line.replaceAll('"Analyse"', '"Log"'))! as ScanOrganicEvent;

      expect(event.scanType, OrganicScanType.log);
      expect(event.completesOrganism, isFalse);
    });
  });

  group('SellOrganicData', () {
    const String line = '{ "timestamp":"2026-08-17T22:10:00Z", '
        '"event":"SellOrganicData", "MarketID":3229756928, "BioData":[ '
        '{ "Genus":"\$Codex_Ent_Stratum_Genus_Name;", '
        '"Species":"\$Codex_Ent_Stratum_07_Name;", '
        '"Species_Localised":"Stratum Tectonicas", '
        '"Variant":"\$Codex_Ent_Stratum_07_F_Name;", '
        '"Value":19010800, "Bonus":76043200 }, '
        '{ "Genus":"\$Codex_Ent_Bacterial_Genus_Name;", '
        '"Species":"\$Codex_Ent_Bacterial_01_Name;", '
        '"Species_Localised":"Bacterium Aurasus", '
        '"Value":1000000, "Bonus":0 } ] }';

    test('sums the payout including the First Logged bonus', () {
      final SellOrganicDataEvent event =
          parser.parseLine(line)! as SellOrganicDataEvent;

      expect(event.entries, hasLength(2));
      expect(event.totalCr, 19010800 + 76043200 + 1000000);
      expect(event.marketId, 3229756928);
    });

    test('flags only the entries that carried a bonus', () {
      final SellOrganicDataEvent event =
          parser.parseLine(line)! as SellOrganicDataEvent;

      expect(event.firstLoggedCount, 1);
      expect(event.entries.first.isFirstLogged, isTrue);
      expect(event.entries.last.isFirstLogged, isFalse);
    });

    test('the bonus is four times the base, for five times in total', () {
      final SellOrganicDataEvent event =
          parser.parseLine(line)! as SellOrganicDataEvent;
      final SoldBioData stratum = event.entries.first;

      expect(stratum.bonusCr, stratum.valueCr * 4);
      expect(stratum.totalCr, stratum.valueCr * 5);
    });
  });

  group('body signals', () {
    test('reads the biological count from FSSBodySignals', () {
      const String line = '{ "timestamp":"2026-08-17T20:00:00Z", '
          '"event":"FSSBodySignals", "BodyName":"Cubeo A 3 c", "BodyID":24, '
          '"SystemAddress":1213084977515, "Signals":[ '
          '{ "Type":"\$SAA_SignalType_Biological;", '
          '"Type_Localised":"Biologique", "Count":1 }, '
          '{ "Type":"\$SAA_SignalType_Geological;", "Count":3 } ] }';

      final BodySignalsEvent event = parser.parseLine(line)! as BodySignalsEvent;

      expect(event.biologicalCount, 1);
      expect(event.bodyName, 'Cubeo A 3 c');
      expect(event.fromDetailedScan, isFalse);
    });

    test('SAASignalsFound is marked as coming from the DSS', () {
      const String line = '{ "timestamp":"2026-08-17T20:05:00Z", '
          '"event":"SAASignalsFound", "BodyName":"Cubeo A 3 c", '
          '"Signals":[ { "Type":"\$SAA_SignalType_Biological;", "Count":2 } ] }';

      final BodySignalsEvent event = parser.parseLine(line)! as BodySignalsEvent;

      expect(event.biologicalCount, 2);
      expect(event.fromDetailedScan, isTrue);
    });

    test('a body with no biological signal yields zero, not null', () {
      const String line = '{ "timestamp":"2026-08-17T20:05:00Z", '
          '"event":"FSSBodySignals", "BodyName":"X", "Signals":[ '
          '{ "Type":"\$SAA_SignalType_Geological;", "Count":3 } ] }';

      expect(
        (parser.parseLine(line)! as BodySignalsEvent).biologicalCount,
        0,
      );
    });
  });

  group('Scan', () {
    const String line = '{ "timestamp":"2026-08-17T19:00:00Z", "event":"Scan", '
        '"ScanType":"Detailed", "BodyName":"Cubeo A 3 c", "BodyID":24, '
        '"StarSystem":"Cubeo", "DistanceFromArrivalLS":640.5, '
        '"PlanetClass":"High metal content body", '
        '"Atmosphere":"thin carbon dioxide atmosphere", '
        '"Volcanism":"minor silicate vapour geysers volcanism", '
        '"SurfaceGravity":2.0594, "SurfaceTemperature":190.3, '
        '"SurfacePressure":600.0, "Landable":true }';

    test('converts the surface gravity from m/s² to g', () {
      final BodyScanEvent event = parser.parseLine(line)! as BodyScanEvent;

      expect(event.surfaceGravityG, closeTo(2.0594 / 9.80665, 0.0001));
      expect(event.surfaceGravityG, lessThan(0.27));
    });

    test('keeps the raw planet class and atmosphere for the matcher', () {
      final BodyScanEvent event = parser.parseLine(line)! as BodyScanEvent;

      expect(event.planetClass, 'High metal content body');
      expect(event.atmosphere, 'thin carbon dioxide atmosphere');
      expect(event.surfaceTemperatureK, 190.3);
      expect(event.distanceFromArrivalLs, 640.5);
      expect(event.landable, isTrue);
    });
  });

  group('ranks and session', () {
    test('reads the CamelCase ladder keys of the Rank event', () {
      const String line = '{ "timestamp":"2026-08-17T18:00:00Z", '
          '"event":"Rank", "Combat":0, "Trade":3, "Explore":5, "Soldier":0, '
          '"Exobiologist":1, "Empire":6, "Federation":0, "CQC":0 }';

      final RankEvent event = parser.parseLine(line)! as RankEvent;

      expect(event.values['Explore'], 5);
      expect(event.values['Exobiologist'], 1);
      expect(event.isProgress, isFalse);
    });

    test('Progress carries percentages, not levels', () {
      const String line = '{ "timestamp":"2026-08-17T18:00:00Z", '
          '"event":"Progress", "Explore":74, "Exobiologist":12 }';

      final RankEvent event = parser.parseLine(line)! as RankEvent;

      expect(event.isProgress, isTrue);
      expect(event.values['Explore'], 74);
    });

    test('reads LoadGame', () {
      const String line = '{ "timestamp":"2026-08-17T17:00:00Z", '
          '"event":"LoadGame", "FID":"F123456", "Commander":"Caspian", '
          '"Horizons":true, "Odyssey":true, "Ship":"caspian", '
          '"ShipName":"USS ENTERPRISE", "Credits":45480912, "Loan":0 }';

      final LoadGameEvent event = parser.parseLine(line)! as LoadGameEvent;

      expect(event.commander, 'Caspian');
      expect(event.creditsCr, 45480912);
      expect(event.odyssey, isTrue);
      expect(event.fid, 'F123456');
    });
  });

  group('suits', () {
    test('derives the grade from the suit symbol', () {
      const String line = '{ "timestamp":"2026-08-17T17:05:00Z", '
          '"event":"SuitLoadout", "SuitID":1698364940285172, '
          '"SuitName":"explorationsuit_class3", '
          '"SuitName_Localised":"\$ExplorationSuit_Class3_Name;", '
          '"SuitMods":["suit_improvedbatterycapacity"], '
          '"LoadoutID":4293000000, "LoadoutName":"Exobio", "Modules":[] }';

      final SuitEvent event = parser.parseLine(line)! as SuitEvent;

      expect(event.suitSymbol, 'explorationsuit_class3');
      expect(event.grade, 3);
      expect(event.modIds, contains('suit_improvedbatterycapacity'));
    });

    test('UpgradeSuit reports the new grade explicitly', () {
      const String line = '{ "timestamp":"2026-08-17T17:06:00Z", '
          '"event":"UpgradeSuit", "Name":"explorationsuit_class1", '
          '"SuitID":1, "Class":2 }';

      final SuitEvent event = parser.parseLine(line)! as SuitEvent;

      expect(event.grade, 2);
    });
  });

  group('robustness', () {
    test('an unmodelled event is kept, not dropped', () {
      const String line =
          '{ "timestamp":"2026-08-17T17:00:00Z", "event":"Music", '
          '"MusicTrack":"Exploration" }';

      final JournalEvent event = parser.parseLine(line)!;

      expect(event, isA<UnknownJournalEvent>());
      expect(event.name, 'Music');
    });

    test('a blank line yields null', () {
      expect(parser.parseLine('   '), isNull);
      expect(parser.parseLine(''), isNull);
    });

    test('a corrupted line yields null instead of throwing', () {
      expect(parser.parseLine('{ "timestamp": "2026-'), isNull);
      expect(parser.parseLine('not json at all'), isNull);
    });

    test('a line without a timestamp or an event is rejected', () {
      expect(parser.parseLine('{ "event":"Scan" }'), isNull);
      expect(
        parser.parseLine('{ "timestamp":"2026-08-17T17:00:00Z" }'),
        isNull,
      );
    });

    test('parseLines skips the unreadable and keeps the rest', () {
      final List<JournalEvent> events = parser.parseLines(<String>[
        '{ "timestamp":"2026-08-17T17:00:00Z", "event":"Music" }',
        'garbage',
        '',
        '{ "timestamp":"2026-08-17T18:00:00Z", "event":"Progress", "Explore":1 }',
      ]);

      expect(events, hasLength(2));
      expect(events.last, isA<RankEvent>());
    });

    test('dedupe keys separate two organisms scanned in the same second', () {
      final List<JournalEvent> events = parser.parseLines(<String>[
        '{ "timestamp":"2026-08-17T17:00:00Z", "event":"ScanOrganic", '
            '"ScanType":"Log", "Genus":"g", "Species":"Stratum Tectonicas" }',
        '{ "timestamp":"2026-08-17T17:00:00Z", "event":"ScanOrganic", '
            '"ScanType":"Log", "Genus":"g", "Species":"Bacterium Aurasus" }',
      ]);

      expect(events.first.dedupeKey, isNot(events.last.dedupeKey));
    });
  });
}
