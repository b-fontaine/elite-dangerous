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

    test('supportedEvents lists exactly what parseLine models', () {
      // The set is declared by hand because a `switch` cannot be enumerated,
      // and the diagnostics screen states publicly what the app reads. A
      // drifting list would make it lie.
      for (final String name in JournalEventParser.supportedEvents) {
        final JournalEvent? event = parser.parseLine(
          '{ "timestamp":"2026-08-17T17:00:00Z", "event":"$name" }',
        );
        expect(
          event,
          isNot(isA<UnknownJournalEvent>()),
          reason: '$name est annoncé comme pris en charge',
        );
      }
    });

    test('an event outside supportedEvents falls through to Unknown', () {
      // `Music` is written constantly and carries nothing worth modelling; it
      // stands in for the fifteen-odd event names the app deliberately keeps
      // without reading.
      final JournalEvent? event = parser.parseLine(
        '{ "timestamp":"2026-08-17T17:00:00Z", "event":"Music" }',
      );

      expect(JournalEventParser.supportedEvents, isNot(contains('Music')));
      expect(event, isA<UnknownJournalEvent>());
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

  group('SAASignalsFound', () {
    // Depuis Odyssey Update 13 (juillet 2022), le DSS ne dit plus seulement
    // combien de signaux biologiques un corps porte : il nomme les genres.
    const String line = '{"timestamp":"2026-08-19T20:00:00Z",'
        '"event":"SAASignalsFound","BodyName":"Caeritis A 3 a",'
        '"SystemAddress":2931088689515,"BodyID":14,'
        '"Signals":[{"Type":"\$SAA_SignalType_Biological;",'
        '"Type_Localised":"Biologique","Count":2},'
        '{"Type":"\$SAA_SignalType_Geological;",'
        '"Type_Localised":"Géologique","Count":3}],'
        '"Genuses":[{"Genus":"\$Codex_Ent_Bacterial_Genus_Name;",'
        '"Genus_Localised":"Bacterium"},'
        '{"Genus":"\$Codex_Ent_Stratum_Genus_Name;",'
        '"Genus_Localised":"Stratum"}]}';

    test('le DSS nomme les genres présents', () {
      final BodySignalsEvent event =
          parser.parseLine(line)! as BodySignalsEvent;

      expect(event.biologicalCount, 2);
      expect(event.fromDetailedScan, isTrue);
      expect(event.identifiesGenuses, isTrue);
      expect(
        event.genuses.map((DetectedGenus g) => g.displayName),
        <String>['Bacterium', 'Stratum'],
      );
    });

    test('le jeton brut est conservé pour la traduction', () {
      // Le journal nomme un genre par un jeton interne ; le rapprocher du
      // catalogue est le travail d'`ExobiologyReferenceData`, pas du parseur.
      final BodySignalsEvent event =
          parser.parseLine(line)! as BodySignalsEvent;

      expect(
        event.genuses.map((DetectedGenus g) => g.lookupKey),
        <String>[
          r'$codex_ent_bacterial_genus_name;',
          r'$codex_ent_stratum_genus_name;',
        ],
      );
    });

    test('sans Genus_Localised, le jeton sert de nom affichable', () {
      // Les noms de genre sont latins : Frontier omet la traduction quand elle
      // répéterait le jeton, et c'est fréquent.
      final BodySignalsEvent event = parser.parseLine(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"SAASignalsFound",'
        '"BodyName":"Caeritis A 3 a","Signals":[],'
        '"Genuses":[{"Genus":"\$Codex_Ent_Tussocks_Genus_Name;"}]}',
      )! as BodySignalsEvent;

      expect(event.genuses.single.lookupKey,
          r'$codex_ent_tussocks_genus_name;');
      expect(event.genuses.single.displayName,
          r'$Codex_Ent_Tussocks_Genus_Name;');
    });

    test('les organiques sans genre passent aussi', () {
      // Bark Mounds, Brain Trees, Anemones s'écrivent sans le segment
      // `_Genus` : \$Codex_Ent_Cone_Name;.
      final BodySignalsEvent event = parser.parseLine(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"SAASignalsFound",'
        '"BodyName":"X","Signals":[],'
        '"Genuses":[{"Genus":"\$Codex_Ent_Cone_Name;",'
        '"Genus_Localised":"Bark Mounds"}]}',
      )! as BodySignalsEvent;

      expect(event.genuses.single.lookupKey, r'$codex_ent_cone_name;');
      expect(event.genuses.single.displayName, 'Bark Mounds');
    });

    test('le FSS compte les signaux sans nommer les genres', () {
      // C'est la distinction qui structure l'écran : le FSS donne un nombre,
      // le DSS donne la liste. Entre les deux, il faut prédire.
      final BodySignalsEvent event = parser.parseLine(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"FSSBodySignals",'
        '"BodyName":"Caeritis A 3 a","BodyID":14,'
        '"SystemAddress":2931088689515,'
        '"Signals":[{"Type":"\$SAA_SignalType_Biological;","Count":1}]}',
      )! as BodySignalsEvent;

      expect(event.biologicalCount, 1);
      expect(event.fromDetailedScan, isFalse);
      expect(event.identifiesGenuses, isFalse);
      expect(event.genuses, isEmpty);
    });

    test('les signaux d\'anneau ne sont pas des signaux de surface', () {
      // Le même événement, sur un anneau, écrit des noms de minerais sans
      // préfixe — et parfois sans Type_Localised du tout.
      final BodySignalsEvent event = parser.parseLine(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"SAASignalsFound",'
        '"BodyName":"Hermitage 4 A Ring","Signals":['
        '{"Type":"LowTemperatureDiamond",'
        '"Type_Localised":"Low Temperature Diamonds","Count":1},'
        '{"Type":"Alexandrite","Count":1}]}',
      )! as BodySignalsEvent;

      expect(event.biologicalCount, isZero);
      expect(event.genuses, isEmpty);
    });
  });

  group('Died et Resurrect', () {
    test('un rachat après destruction annonce la perte', () {
      final ResurrectEvent event = parser.parseLine(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Resurrect",'
        '"Option":"recover","Cost":120000,"Bankrupt":false}',
      )! as ResurrectEvent;

      expect(event.option, 'recover');
      expect(event.costCr, 120000);
      expect(event.bankrupt, isFalse);
      expect(event.losesUnsoldData, isTrue);
    });

    test('le rachat payé et le Sidewinder gratuit comptent comme une perte',
        () {
      // Les deux issues de l'écran de rachat, donc le chemin de mort le plus
      // courant. Payer l'assurance reconstruit la coque, jamais la soute.
      for (final String option in <String>['rebuy', 'free']) {
        final ResurrectEvent event = parser.parseLine(
          '{"timestamp":"2026-08-19T20:00:00Z","event":"Resurrect",'
          '"Option":"$option","Cost":36479,"Bankrupt":false}',
        )! as ResurrectEvent;

        expect(event.losesUnsoldData, isTrue, reason: 'option « $option »');
      }
    });

    test('une option inconnue ne déclenche pas le filet de secours', () {
      for (final String option in <String>['handin', '', 'quelquechose']) {
        final ResurrectEvent event = parser.parseLine(
          '{"timestamp":"2026-08-19T20:00:00Z","event":"Resurrect",'
          '"Option":"$option"}',
        )! as ResurrectEvent;

        expect(event.losesUnsoldData, isFalse, reason: 'option « $option »');
      }
    });

    test('la casse de l\'option n\'a pas à être devinée', () {
      final ResurrectEvent event = parser.parseLine(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Resurrect",'
        '"Option":"Escape"}',
      )! as ResurrectEvent;

      expect(event.losesUnsoldData, isTrue);
    });

    test('la mort retient qui l\'a causée', () {
      final DiedEvent event = parser.parseLine(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Died",'
        '"KillerName":"Cmdr Nemesis","KillerShip":"anaconda"}',
      )! as DiedEvent;

      expect(event.killerName, 'Cmdr Nemesis');
      expect(event.killerShip, 'anaconda');
    });
  });

  group('découverte et cartographie', () {
    test('le balayage d\'arrivée donne le nombre de corps', () {
      final DiscoveryScanEvent event = parser.parseLine(
        '{"timestamp":"2026-08-20T12:00:00Z","event":"FSSDiscoveryScan",'
        '"Progress":0.328,"BodyCount":12,"NonBodyCount":3,'
        '"SystemName":"Hyades Sector DR-V c2-23",'
        '"SystemAddress":2871051298721}',
      )! as DiscoveryScanEvent;

      expect(event.bodyCount, 12);
      expect(event.nonBodyCount, 3);
      expect(event.progress, closeTo(0.328, 0.001));
      expect(event.systemAddress, 2871051298721);
    });

    test('FSSAllBodiesFound dit que le système est fini', () {
      final AllBodiesFoundEvent event = parser.parseLine(
        '{"timestamp":"2026-08-20T12:05:00Z","event":"FSSAllBodiesFound",'
        '"SystemName":"Hyades Sector DR-V c2-23",'
        '"SystemAddress":2871051298721,"Count":12}',
      )! as AllBodiesFoundEvent;

      expect(event.count, 12);
      expect(event.systemName, 'Hyades Sector DR-V c2-23');
    });

    test('SAAScanComplete retient les sondes et la cible d\'efficacité', () {
      final SurfaceMappedEvent event = parser.parseLine(
        '{"timestamp":"2026-08-20T12:10:00Z","event":"SAAScanComplete",'
        '"BodyName":"Hyades Sector DR-V c2-23 A 5",'
        '"SystemAddress":2871051298721,'
        '"BodyID":5,"ProbesUsed":4,"EfficiencyTarget":6}',
      )! as SurfaceMappedEvent;

      expect(event.bodyName, 'Hyades Sector DR-V c2-23 A 5');
      expect(event.probesUsed, 4);
      expect(event.wasEfficient, isTrue);
    });

    test('dépasser la cible d\'efficacité se voit', () {
      final SurfaceMappedEvent event = parser.parseLine(
        '{"timestamp":"2026-08-20T12:10:00Z","event":"SAAScanComplete",'
        '"BodyName":"A 5","BodyID":5,"ProbesUsed":9,"EfficiencyTarget":6}',
      )! as SurfaceMappedEvent;

      expect(event.wasEfficient, isFalse);
    });

    test('un Scan retient son type et à qui revient la découverte', () {
      final BodyScanEvent event = parser.parseLine(
        '{"timestamp":"2026-08-20T12:02:00Z","event":"Scan",'
        '"ScanType":"Detailed","BodyName":"A 5","BodyID":5,'
        '"SystemAddress":2871051298721,'
        '"StarSystem":"Hyades Sector DR-V c2-23",'
        '"WasDiscovered":false,"WasMapped":false,"Landable":true,'
        '"PlanetClass":"High metal content body"}',
      )! as BodyScanEvent;

      expect(event.isDetailed, isTrue);
      expect(event.systemAddress, 2871051298721);
      expect(event.wasDiscovered, isFalse);
      expect(event.wasMapped, isFalse);
    });

    test('un vieux Scan sans ces champs est réputé déjà découvert', () {
      // L'inverse serait pire : annoncer une prime de première découverte que
      // le commandant ne touchera pas.
      final BodyScanEvent event = parser.parseLine(
        '{"timestamp":"2018-01-01T12:00:00Z","event":"Scan",'
        '"BodyName":"A 5","StarSystem":"Sol"}',
      )! as BodyScanEvent;

      expect(event.wasDiscovered, isTrue);
      expect(event.wasMapped, isTrue);
      expect(event.isDetailed, isFalse);
    });
  });
}
