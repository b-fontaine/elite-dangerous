import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/journal/domain/services/journal_event_parser.dart';
import 'package:flutter_test/flutter_test.dart';

/// The events Frontier rewrites at every session start, which is what makes a
/// single recent day enough to know the commander's present state.
void main() {
  const JournalEventParser parser = JournalEventParser();

  T parse<T extends JournalEvent>(String line) {
    final JournalEvent? event = parser.parseLine(line);
    expect(event, isA<T>(), reason: line);
    return event! as T;
  }

  group('Statistics', () {
    const String line = '{"timestamp":"2026-08-19T20:00:00Z",'
        '"event":"Statistics",'
        '"Bank_Account":{"Current_Wealth":358344972,"Owned_Ship_Count":8,'
        '"Suits_Owned":4,"Weapons_Owned":5},'
        '"Exploration":{"Systems_Visited":4210,"Exploration_Profits":812000000,'
        '"Planets_Scanned_To_Level_3":1902,"First_Footfalls":37,'
        '"Total_Hyperspace_Jumps":9120,"Time_Played":1440000},'
        '"Exobiology":{"Organic_Data_Profits":2483000000,'
        '"First_Logged_Profits":1200000000,"First_Logged":61,'
        '"Organic_Species_Encountered":94,"Organic_Variant_Encountered":210,'
        '"Organic_Systems":180,"Organic_Planets":260},'
        '"Crafting":{"Count_Of_Used_Engineers":3,"Suit_Mods_Applied":2}}';

    test('donne le profit exobio de carrière, sans l\'inférer', () {
      final StatisticsEvent event = parse<StatisticsEvent>(line);

      // Le chiffre exact que compte l'échelle Exobiologist, énoncé par le jeu
      // plutôt que déduit des ventes que l'app a pu importer.
      expect(event.organicDataProfitCr, 2483000000);
      expect(event.firstLoggedCount, 61);
      expect(event.organicSpeciesEncountered, 94);
    });

    test('lit aussi l\'exploration et le compte en banque', () {
      final StatisticsEvent event = parse<StatisticsEvent>(line);

      expect(event.systemsVisited, 4210);
      expect(event.firstFootfalls, 37);
      expect(event.timePlayedSeconds, 1440000);
      expect(event.currentWealthCr, 358344972);
      expect(event.ownedShipCount, 8);
      expect(event.engineersUsed, 3);
    });

    test('conserve les sections que cette version ne sait pas lire', () {
      final StatisticsEvent event = parse<StatisticsEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Statistics",'
        '"Section_Inconnue":{"Une_Cle":7}}',
      );

      // Une ligne stockée se reparse gratuitement quand l'app apprend à la
      // lire ; la jeter serait irréversible.
      expect(event.value('Section_Inconnue', 'Une_Cle'), 7);
    });

    test('une section absente répond null, jamais zéro', () {
      final StatisticsEvent event = parse<StatisticsEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Statistics"}',
      );

      expect(event.organicDataProfitCr, isNull);
    });
  });

  group('Reputation', () {
    test('lit les quatre puissances sur -100 à +100', () {
      final ReputationEvent event = parse<ReputationEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Reputation",'
        '"Empire":92.5,"Federation":-14.0,"Alliance":0.0,"Independent":31.2}',
      );

      expect(event['Empire'], 92.5);
      expect(event['Federation'], -14.0);
      expect(event.values, hasLength(4));
    });
  });

  group('EngineerProgress', () {
    test('lit la liste complète écrite au démarrage', () {
      final EngineerProgressEvent event = parse<EngineerProgressEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"EngineerProgress",'
        '"Engineers":['
        '{"Engineer":"Felicity Farseer","EngineerID":300100,'
        '"Progress":"Unlocked","RankProgress":40,"Rank":3},'
        '{"Engineer":"Elvira Martuuk","EngineerID":300160,"Progress":"Known"},'
        '{"Engineer":"Domino Green","EngineerID":400001,"Progress":"Invited"}]}',
      );

      expect(event.isFullRoster, isTrue);
      expect(event.engineers, hasLength(3));
      expect(event.unlocked, hasLength(1));

      final EngineerStanding farseer = event.unlocked.single;
      expect(farseer.name, 'Felicity Farseer');
      expect(farseer.rank, 3);
      expect(farseer.rankProgressPercent, 40);
      expect(farseer.stage, EngineerUnlockStage.unlocked);
    });

    test('lit la mise à jour d\'un seul ingénieur en cours de session', () {
      final EngineerProgressEvent event = parse<EngineerProgressEvent>(
        '{"timestamp":"2026-08-19T21:00:00Z","event":"EngineerProgress",'
        '"Engineer":"Felicity Farseer","EngineerID":300100,'
        '"Progress":"Unlocked","Rank":4}',
      );

      expect(event.isFullRoster, isFalse);
      expect(event.engineers.single.rank, 4);
    });

    test('un stade inconnu ne fait pas échouer la ligne', () {
      final EngineerProgressEvent event = parse<EngineerProgressEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"EngineerProgress",'
        '"Engineers":[{"Engineer":"Nouveau","Progress":"Quelque chose"}]}',
      );

      expect(event.engineers.single.stage, EngineerUnlockStage.unknown);
    });
  });

  group('Loadout', () {
    const String line = '{"timestamp":"2026-08-19T20:00:00Z","event":"Loadout",'
        '"Ship":"explorer_nx","ShipID":18,"ShipName":"USS ENTERPRISE",'
        '"ShipIdent":"TAI-CE","HullValue":44000000,"ModulesValue":3277492,'
        '"HullHealth":1.0,"UnladenMass":420.5,"CargoCapacity":16,'
        '"MaxJumpRange":78.42,"Rebuy":2363875,"Hot":false,'
        '"FuelCapacity":{"Main":32.0,"Reserve":0.63},'
        '"Modules":['
        '{"Slot":"Slot12_Size1","Item":"int_detailedsurfacescanner_tiny",'
        '"On":true,"Priority":2},'
        '{"Slot":"Slot01_Size7","Item":"int_fuelscoop_size7_class5",'
        '"On":true,"Priority":2}]}';

    test('donne le rebuy exact, que la CAPI ne peut pas fournir', () {
      final ShipLoadoutEvent event = parse<ShipLoadoutEvent>(line);

      // `/profile` renvoie `hull: 0` sur les coques récentes ; c'est ici, et
      // seulement ici, que le vrai coût d'une mort est énoncé.
      expect(event.rebuyCr, 2363875);
      expect(event.hullValueCr, 44000000);
    });

    test('donne la portée de saut, aujourd\'hui saisie à la main', () {
      final ShipLoadoutEvent event = parse<ShipLoadoutEvent>(line);

      expect(event.maxJumpRangeLy, 78.42);
      expect(event.fuelCapacity, 32.0);
      expect(event.cargoCapacity, 16);
    });

    test('répond aux questions d\'équipement sans modéliser chaque module', () {
      final ShipLoadoutEvent event = parse<ShipLoadoutEvent>(line);

      expect(event.hasDetailedSurfaceScanner, isTrue);
      expect(event.hasFuelScoop, isTrue);
      expect(event.hasGuardianFsdBooster, isFalse);
    });
  });

  group('ShipLocker', () {
    test('lit l\'inventaire à pied par son nom localisé', () {
      final ShipLockerEvent event = parse<ShipLockerEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"ShipLocker",'
        '"Items":[{"Name":"healthmonitor","Name_Localised":"Health Monitor",'
        '"OwnerID":0,"Count":12}],'
        '"Components":[{"Name":"graphene","Name_Localised":"Graphene",'
        '"OwnerID":0,"Count":30}],'
        '"Consumables":[{"Name":"energycell","Name_Localised":"Energy Cell",'
        '"OwnerID":0,"Count":4}],'
        '"Data":[{"Name":"suitschematic","Name_Localised":"Suit Schematic",'
        '"OwnerID":0,"Count":7}]}',
      );

      expect(event.isEmpty, isFalse);
      // Les noms lisibles sont ceux que le commandant voit chez un barman.
      expect(event.everything['Suit Schematic'], 7);
      expect(event.everything['Health Monitor'], 12);
      expect(event.everything['Graphene'], 30);
    });

    test('additionne un même objet réparti sur plusieurs entrées', () {
      final ShipLockerEvent event = parse<ShipLockerEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"ShipLocker",'
        '"Items":[{"Name":"healthmonitor","Name_Localised":"Health Monitor",'
        '"OwnerID":0,"Count":10},'
        '{"Name":"healthmonitor","Name_Localised":"Health Monitor",'
        '"OwnerID":42,"MissionID":7,"Count":3}]}',
      );

      // `ShipLocker` sépare ce qui appartient à une mission ; écraser au lieu
      // d'additionner perdrait la moitié du stock.
      expect(event.items['Health Monitor'], 13);
    });

    test('distingue « rien en soute » de « pas encore dit »', () {
      final ShipLockerEvent pointer = parse<ShipLockerEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"ShipLocker"}',
      );
      final ShipLockerEvent empty = parse<ShipLockerEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"ShipLocker",'
        '"Items":[],"Components":[],"Consumables":[],"Data":[]}',
      );

      expect(pointer.isEmpty, isTrue);
      expect(empty.isEmpty, isFalse);
      expect(empty.everything, isEmpty);
    });
  });

  group('Powerplay', () {
    test('repère l\'allégeance qui majore les ventes organiques', () {
      final PowerplayEvent antal = parse<PowerplayEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Powerplay",'
        '"Power":"Pranav Antal","Rank":3,"Merits":1520,"TimePledged":9600000}',
      );
      final PowerplayEvent other = parse<PowerplayEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Powerplay",'
        '"Power":"Aisling Duval","Rank":1,"Merits":10}',
      );

      expect(antal.boostsOrganicSales, isTrue);
      expect(antal.merits, 1520);
      expect(other.boostsOrganicSales, isFalse);
    });
  });

  group('Cargo', () {
    test('repère le Meta-Alloy qui débloque Felicity Farseer', () {
      final CargoEvent carrying = parse<CargoEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Cargo","Vessel":"Ship",'
        '"Count":5,"Inventory":[{"Name":"metaalloys","Count":1,"Stolen":0},'
        '{"Name":"tritium","Count":4,"Stolen":0}]}',
      );
      final CargoEvent without = parse<CargoEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Cargo","Vessel":"Ship",'
        '"Count":0,"Inventory":[]}',
      );

      expect(carrying.hasMetaAlloy, isTrue);
      expect(carrying.inventory['tritium'], 4);
      expect(without.hasMetaAlloy, isFalse);
    });
  });

  group('StoredShips', () {
    test('lit la flotte et son prix de transfert', () {
      final StoredShipsEvent event = parse<StoredShipsEvent>(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"StoredShips",'
        '"StationName":"Medupe City","StarSystem":"Cubeo",'
        '"ShipsHere":[{"ShipID":2,"ShipType":"empire_trader","Name":"USS VOYAGER",'
        '"Value":72136756,"Hot":false}],'
        '"ShipsRemote":[{"ShipID":10,"ShipType":"asp","StarSystem":"Deciat",'
        '"TransferPrice":48000,"Value":20738730,"Hot":false}]}',
      );

      expect(event.all, hasLength(2));
      expect(event.here.single.name, 'USS VOYAGER');
      expect(event.remote.single.transferPriceCr, 48000);
      expect(event.stationName, 'Medupe City');
    });
  });

  test('les vingt-trois événements annoncés sont tous modélisés', () {
    for (final String name in JournalEventParser.supportedEvents) {
      expect(
        parser.parseLine(
          '{"timestamp":"2026-08-19T20:00:00Z","event":"$name"}',
        ),
        isNot(isA<UnknownJournalEvent>()),
        reason: name,
      );
    }
  });
}
