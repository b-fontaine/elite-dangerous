import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/journal/domain/services/journal_event_parser.dart';
import 'package:elite_dangerous/features/journal/domain/services/micro_resource_names.dart';
import 'package:flutter_test/flutter_test.dart';

/// Frontier writes every inventory line twice: an internal symbol, and a name
/// translated into the language the client runs in. Keying on the translation
/// is what silently breaks the Artemis panel outside English.
void main() {
  group('MicroResourceNames', () {
    test('le symbole gagne sur la traduction du client', () {
      expect(
        MicroResourceNames.canonical('healthmonitor', 'Moniteur de santé'),
        'Health Monitor',
      );
      expect(
        MicroResourceNames.canonical('aerogel', 'Aérogel'),
        'Aerogel',
      );
      expect(
        MicroResourceNames.canonical(
          'manufacturinginstructions',
          'Instructions de fabrication',
        ),
        'Manufacturing Instructions',
      );
    });

    test('un client anglais donne évidemment le même résultat', () {
      expect(
        MicroResourceNames.canonical('suitschematic', 'Suit Schematic'),
        'Suit Schematic',
      );
    });

    test('la table ne réécrit jamais un nom anglais correct', () {
      // Elle prime sur `Name_Localised` : une coquille dans la table
      // remplacerait le bon nom du jeu par un mauvais.
      const Map<String, String> duJeu = <String, String>{
        'suitschematic': 'Suit Schematic',
        'healthmonitor': 'Health Monitor',
        'manufacturinginstructions': 'Manufacturing Instructions',
        'aerogel': 'Aerogel',
        'graphene': 'Graphene',
        'carbonfibreplating': 'Carbon Fibre Plating',
        'titaniumplating': 'Titanium Plating',
        'settlementdefenceplans': 'Settlement Defence Plans',
        'geneticrepairmeds': 'Genetic Repair Meds',
        'financialprojections': 'Financial Projections',
        'surveillanceequipment': 'Surveillance Equipment',
        'opinionpolls': 'Opinion Polls',
        'smearcampaignplans': 'Smear Campaign Plans',
        'insightentertainmentsuite': 'Insight Entertainment Suite',
        'push': 'Push',
      };

      duJeu.forEach((String symbol, String anglais) {
        expect(MicroResourceNames.canonical(symbol, anglais), anglais,
            reason: symbol);
      });
    });

    test('la forme enveloppée \$…_name; est reconnue aussi', () {
      // `ShipLocker` écrit `graphene`, d'autres événements `$graphene_name;`
      // pour exactement le même objet.
      expect(
        MicroResourceNames.canonical(r'$graphene_name;', 'Graphène'),
        'Graphene',
      );
    });

    test('un matériau inconnu garde le nom lisible par le commandant', () {
      // L'application n'a pas d'avis sur tout : une ligne d'inventaire qu'elle
      // ne sait pas nommer vaut mieux affichée dans la langue du joueur que
      // sous sa forme interne.
      expect(
        MicroResourceNames.canonical('chemicalsuperbase', 'Superbase chimique'),
        'Superbase chimique',
      );
    });

    test('sans traduction, le symbole brut reste', () {
      expect(
        MicroResourceNames.canonical('somethingnew', null),
        'somethingnew',
      );
    });

    test('une ligne sans nom du tout ne casse rien', () {
      expect(MicroResourceNames.canonical(null, null), isNull);
      expect(MicroResourceNames.canonical('  ', null), isNull);
    });
  });

  group('ShipLocker sur un client francophone', () {
    const JournalEventParser parser = JournalEventParser();

    test('l\'inventaire est indexé comme la feuille de route le lit', () {
      // Le cas qui rendait le panneau « prochaine amélioration » inopérant :
      // l'inventaire arrivait en français, les coûts de grade sont en anglais.
      final ShipLockerEvent event = parser.parseLine(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"ShipLocker",'
        '"Items":[{"Name":"healthmonitor",'
        '"Name_Localised":"Moniteur de santé","OwnerID":0,"Count":4},'
        '{"Name":"suitschematic",'
        '"Name_Localised":"Schéma de combinaison","OwnerID":0,"Count":2}],'
        '"Components":[{"Name":"aerogel","Name_Localised":"Aérogel",'
        '"OwnerID":0,"Count":9}],'
        '"Consumables":[],'
        '"Data":[{"Name":"manufacturinginstructions",'
        '"Name_Localised":"Instructions de fabrication",'
        '"OwnerID":0,"Count":1}]}',
      )! as ShipLockerEvent;

      expect(event.everything, <String, int>{
        'Health Monitor': 4,
        'Suit Schematic': 2,
        'Aerogel': 9,
        'Manufacturing Instructions': 1,
      });
    });

    test('la forme pointeur reste distinguable d\'un inventaire vide', () {
      // Depuis 4.0.0.400 le jeu écrit un `ShipLocker` sans listes et met le
      // contenu dans `ShipLocker.json` : ne rien savoir n'est pas ne rien
      // avoir.
      final ShipLockerEvent event = parser.parseLine(
        '{"timestamp":"2026-08-19T20:00:00Z","event":"ShipLocker"}',
      )! as ShipLockerEvent;

      expect(event.isEmpty, isTrue);
      expect(event.everything, isEmpty);
    });
  });
}
