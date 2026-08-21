import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/journal/domain/entities/journal_session_state.dart';
import 'package:elite_dangerous/features/journal/domain/services/journal_event_parser.dart';
import 'package:elite_dangerous/features/journal/domain/services/journal_session_aggregator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const JournalEventParser parser = JournalEventParser();
  const JournalSessionAggregator aggregator = JournalSessionAggregator();

  JournalSessionState fold(List<String> lines) =>
      aggregator.aggregate(parser.parseLines(lines));

  String statistics(String day, int profit) =>
      '{"timestamp":"${day}T20:00:00Z","event":"Statistics",'
      '"Exobiology":{"Organic_Data_Profits":$profit}}';

  group('les instantanés ne s\'additionnent pas', () {
    test('deux Statistics : le plus récent gagne', () {
      // Ce sont des totaux de carrière réécrits à chaque démarrage. Les
      // sommer donnerait un profit de plusieurs milliards inventé.
      final JournalSessionState state = fold(<String>[
        statistics('2026-07-01', 1000000000),
        statistics('2026-08-19', 2483000000),
      ]);

      expect(state.exobiologyProfitCr, 2483000000);
    });

    test('l\'ordre d\'arrivée ne change rien', () {
      final JournalSessionState state = fold(<String>[
        statistics('2026-08-19', 2483000000),
        statistics('2026-07-01', 1000000000),
      ]);

      expect(state.exobiologyProfitCr, 2483000000);
    });
  });

  group('ingénieurs', () {
    test('une mise à jour ponctuelle ne remplace pas toute la liste', () {
      final JournalSessionState state = fold(<String>[
        '{"timestamp":"2026-08-19T20:00:00Z","event":"EngineerProgress",'
        '"Engineers":['
        '{"Engineer":"Felicity Farseer","Progress":"Known"},'
        '{"Engineer":"Elvira Martuuk","Progress":"Unlocked","Rank":2}]}',
        '{"timestamp":"2026-08-19T21:00:00Z","event":"EngineerProgress",'
        '"Engineer":"Felicity Farseer","Progress":"Unlocked","Rank":1}',
      ]);

      expect(state.engineers, hasLength(2));
      expect(state.unlockedEngineerNames,
          containsAll(<String>['Felicity Farseer', 'Elvira Martuuk']));
      expect(
        state.engineers
            .firstWhere((EngineerStanding e) => e.name == 'Felicity Farseer')
            .rank,
        1,
      );
    });

    test('une nouvelle liste complète remplace l\'ancienne', () {
      final JournalSessionState state = fold(<String>[
        '{"timestamp":"2026-08-01T20:00:00Z","event":"EngineerProgress",'
        '"Engineers":[{"Engineer":"Ancien","Progress":"Unlocked"}]}',
        '{"timestamp":"2026-08-19T20:00:00Z","event":"EngineerProgress",'
        '"Engineers":[{"Engineer":"Felicity Farseer","Progress":"Unlocked"}]}',
      ]);

      // Un ingénieur disparu de la liste du jeu ne doit pas survivre.
      expect(state.engineers, hasLength(1));
      expect(state.engineers.single.name, 'Felicity Farseer');
    });
  });

  group('inventaire à pied', () {
    test('un ShipLocker vide n\'efface pas un inventaire connu', () {
      final JournalSessionState state = fold(<String>[
        '{"timestamp":"2026-08-19T20:00:00Z","event":"ShipLocker",'
        '"Data":[{"Name":"suitschematic","Name_Localised":"Suit Schematic",'
        '"Count":7}]}',
        // La forme « pointeur » : le contenu est dans ShipLocker.json.
        '{"timestamp":"2026-08-19T21:00:00Z","event":"ShipLocker"}',
      ]);

      expect(state.onFootInventory['Suit Schematic'], 7);
    });

    test('un ShipLocker réellement vide, lui, remet à zéro', () {
      final JournalSessionState state = fold(<String>[
        '{"timestamp":"2026-08-19T20:00:00Z","event":"ShipLocker",'
        '"Data":[{"Name":"suitschematic","Count":7}]}',
        '{"timestamp":"2026-08-19T21:00:00Z","event":"ShipLocker",'
        '"Items":[],"Components":[],"Consumables":[],"Data":[]}',
      ]);

      expect(state.onFootInventory, isEmpty);
    });
  });

  group('soute', () {
    test('le Meta-Alloy du vaisseau est retenu, pas celui du VRS', () {
      final JournalSessionState state = fold(<String>[
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Cargo","Vessel":"Ship",'
        '"Inventory":[{"Name":"metaalloys","Count":1}]}',
        // Un VRS ne peut pas livrer un Meta-Alloy à un ingénieur.
        '{"timestamp":"2026-08-19T21:00:00Z","event":"Cargo","Vessel":"SRV",'
        '"Inventory":[]}',
      ]);

      expect(state.hasMetaAlloy, isTrue);
    });

    test('vendre le Meta-Alloy le retire', () {
      final JournalSessionState state = fold(<String>[
        '{"timestamp":"2026-08-19T20:00:00Z","event":"Cargo","Vessel":"Ship",'
        '"Inventory":[{"Name":"metaalloys","Count":1}]}',
        '{"timestamp":"2026-08-19T22:00:00Z","event":"Cargo","Vessel":"Ship",'
        '"Inventory":[]}',
      ]);

      expect(state.hasMetaAlloy, isFalse);
    });
  });

  test('rassemble ce qu\'aucune autre source ne donne', () {
    final JournalSessionState state = fold(<String>[
      '{"timestamp":"2026-08-19T20:00:00Z","event":"Loadout",'
      '"Ship":"explorer_nx","Rebuy":2363875,"MaxJumpRange":78.42,'
      '"Modules":[{"Slot":"Slot12_Size1",'
      '"Item":"int_detailedsurfacescanner_tiny"}]}',
      '{"timestamp":"2026-08-19T20:00:01Z","event":"Powerplay",'
      '"Power":"Pranav Antal","Rank":3,"Merits":1520}',
      '{"timestamp":"2026-08-19T20:00:02Z","event":"Reputation",'
      '"Empire":92.5,"Federation":-14.0}',
    ]);

    // Portée de saut et rebuy étaient saisis à la main ; l'allégeance aussi.
    expect(state.jumpRangeLy, 78.42);
    expect(state.rebuyCr, 2363875);
    expect(state.hasDetailedSurfaceScanner, isTrue);
    expect(state.boostsOrganicSales, isTrue);
    expect(state.powerplayMerits, 1520);
    expect(state.reputations['Empire'], 92.5);
    expect(state.observedAt, DateTime.utc(2026, 8, 19, 20, 0, 2));
  });

  test('un journal sans événement de session reste vide', () {
    final JournalSessionState state = fold(<String>[
      '{"timestamp":"2026-08-19T20:00:00Z","event":"ScanOrganic",'
      '"ScanType":"Log","Genus":"g","Species":"s"}',
    ]);

    expect(state.isEmpty, isTrue);
    expect(state.exobiologyProfitCr, isNull);
  });
}
