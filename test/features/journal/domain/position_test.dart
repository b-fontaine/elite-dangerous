import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/journal/domain/entities/journal_session_state.dart';
import 'package:elite_dangerous/features/journal/domain/services/journal_event_parser.dart';
import 'package:elite_dangerous/features/journal/domain/services/journal_session_aggregator.dart';
import 'package:flutter_test/flutter_test.dart';

/// Where the commander is. `/profile` names the system and the last station
/// and stops there — it has no notion of a body, and only refreshes on docking.
void main() {
  const JournalEventParser parser = JournalEventParser();
  const JournalSessionAggregator aggregator = JournalSessionAggregator();

  CommanderPosition fold(List<String> lines) =>
      aggregator.aggregate(parser.parseLines(lines)).position;

  test('un saut pose le système et laisse le corps à l\'étoile', () {
    final CommanderPosition position = fold(<String>[
      '{"timestamp":"2026-08-19T20:00:00Z","event":"FSDJump",'
          '"StarSystem":"Caeritis","SystemAddress":2931088689515,'
          '"Body":"Caeritis A","BodyID":1,"BodyType":"Star"}',
    ]);

    expect(position.starSystem, 'Caeritis');
    expect(position.bodyName, 'Caeritis A');
    expect(position.bodyType, 'Star');
    expect(position.activity, 'en vol');
  });

  test('approcher une planète nomme le corps sans perdre le système', () {
    // `ApproachBody` ne répète pas toujours le système : prendre l'événement
    // en bloc effacerait la moitié de la position à chaque ligne.
    final CommanderPosition position = fold(<String>[
      '{"timestamp":"2026-08-19T20:00:00Z","event":"FSDJump",'
          '"StarSystem":"Caeritis","Body":"Caeritis A","BodyType":"Star"}',
      '{"timestamp":"2026-08-19T20:10:00Z","event":"ApproachBody",'
          '"StarSystem":"Caeritis","Body":"Caeritis A 3 a","BodyID":14}',
    ]);

    expect(position.starSystem, 'Caeritis');
    expect(position.bodyName, 'Caeritis A 3 a');
  });

  test('quitter un corps l\'oublie, sans oublier le système', () {
    final CommanderPosition position = fold(<String>[
      '{"timestamp":"2026-08-19T20:10:00Z","event":"ApproachBody",'
          '"StarSystem":"Caeritis","Body":"Caeritis A 3 a"}',
      '{"timestamp":"2026-08-19T20:40:00Z","event":"LeaveBody",'
          '"StarSystem":"Caeritis","Body":"Caeritis A 3 a"}',
    ]);

    expect(position.starSystem, 'Caeritis');
    expect(position.bodyName, isNull);
  });

  test('se poser puis sortir met le commandant à pied sur le corps', () {
    final CommanderPosition position = fold(<String>[
      '{"timestamp":"2026-08-19T20:10:00Z","event":"ApproachBody",'
          '"StarSystem":"Caeritis","Body":"Caeritis A 3 a"}',
      '{"timestamp":"2026-08-19T20:20:00Z","event":"Touchdown",'
          '"StarSystem":"Caeritis","Body":"Caeritis A 3 a"}',
      '{"timestamp":"2026-08-19T20:21:00Z","event":"Disembark",'
          '"StarSystem":"Caeritis","Body":"Caeritis A 3 a"}',
    ]);

    expect(position.bodyName, 'Caeritis A 3 a');
    expect(position.onFoot, isTrue);
    expect(position.activity, 'à pied');
    expect(position.isOnPlanet, isTrue);
  });

  test('s\'amarrer nomme la station et abandonne le corps', () {
    final CommanderPosition position = fold(<String>[
      '{"timestamp":"2026-08-19T20:10:00Z","event":"ApproachBody",'
          '"StarSystem":"Caeritis","Body":"Caeritis A 3 a"}',
      '{"timestamp":"2026-08-19T21:00:00Z","event":"Docked",'
          '"StationName":"Bernoulli Vision","StationType":"Coriolis",'
          '"StarSystem":"Caeritis","DistFromStarLS":812.5}',
    ]);

    // Une station n\'est pas une planète : garder le corps se lirait comme
    // « toujours à la surface ».
    expect(position.stationName, 'Bernoulli Vision');
    expect(position.stationType, 'Coriolis');
    expect(position.bodyName, isNull);
    expect(position.docked, isTrue);
    expect(position.activity, 'amarré');
  });

  test('se désamarrer libère la station', () {
    final CommanderPosition position = fold(<String>[
      '{"timestamp":"2026-08-19T21:00:00Z","event":"Docked",'
          '"StationName":"Bernoulli Vision","StarSystem":"Caeritis"}',
      '{"timestamp":"2026-08-19T21:30:00Z","event":"Undocked",'
          '"StationName":"Bernoulli Vision"}',
    ]);

    expect(position.docked, isFalse);
    expect(position.stationName, isNull);
    expect(position.starSystem, 'Caeritis');
  });

  group('événement Docked', () {
    const String line = '{"timestamp":"2026-08-19T21:00:00Z","event":"Docked",'
        '"StationName":"Bernoulli Vision","StationType":"Coriolis",'
        '"StarSystem":"Caeritis","MarketID":3229849856,'
        '"StationFaction":{"Name":"The SMC Clan"},'
        '"StationGovernment":"\$government_Corporate;",'
        '"StationGovernment_Localised":"Entreprise",'
        '"StationAllegiance":"Independent",'
        '"StationEconomy_Localised":"Haute technologie",'
        '"StationEconomies":['
        '{"Name":"\$economy_HighTech;","Proportion":0.7},'
        '{"Name":"\$economy_Refinery;","Name_Localised":"Raffinerie",'
        '"Proportion":0.3}],'
        '"DistFromStarLS":812.5,'
        '"LandingPads":{"Small":4,"Medium":4,"Large":9},'
        '"StationServices":["dock","vistagenomics","Bartender","Engineer"]}';

    test('porte ce que la Companion API ne donne pas', () {
      final DockedEvent event =
          parser.parseLine(line)! as DockedEvent;

      expect(event.stationType, 'Coriolis');
      expect(event.distanceFromStarLs, 812.5);
      expect(event.economy, 'Haute technologie');
      expect(event.allegiance, 'Independent');
      expect(event.government, 'Entreprise');
      expect(event.largePads, 9);
    });

    test('nomme la deuxième économie, la plus grande après la principale', () {
      final DockedEvent event = parser.parseLine(line)! as DockedEvent;

      expect(event.secondEconomy, 'Raffinerie');
    });

    test('met les services en minuscules pour rejoindre le vocabulaire CAPI',
        () {
      final DockedEvent event = parser.parseLine(line)! as DockedEvent;

      expect(event.services, contains('bartender'));
      expect(event.services, contains('engineer'));
      expect(event.sellsOrganicData, isTrue);
    });
  });
  group('SystemAddress', () {
    CommanderPosition foldAll(List<String> lines) =>
        aggregator.aggregate(parser.parseLines(lines)).position;

    test('le saut retient l\'identifiant du système, pas seulement son nom', () {
      // `SystemAddress` est l'`id64` de tout l'écosystème : Spansh, EDSM et
      // EDDN interrogent sur ce nombre, jamais sur le nom.
      final CommanderPosition position = foldAll(<String>[
        '{"timestamp":"2026-08-19T20:00:00Z","event":"FSDJump",'
            '"StarSystem":"Caeritis","SystemAddress":2931088689515}',
      ]);

      expect(position.starSystem, 'Caeritis');
      expect(position.systemAddress, 2931088689515);
    });

    test('un événement muet sur le système ne l\'efface pas', () {
      // `ApproachBody` ne répète pas toujours `SystemAddress` ; perdre
      // l'identifiant à cet instant reviendrait à ne plus pouvoir interroger
      // quoi que ce soit sur le système où l'on se trouve.
      final CommanderPosition position = foldAll(<String>[
        '{"timestamp":"2026-08-19T20:00:00Z","event":"FSDJump",'
            '"StarSystem":"Caeritis","SystemAddress":2931088689515}',
        '{"timestamp":"2026-08-19T20:10:00Z","event":"ApproachBody",'
            '"Body":"Caeritis A 3 a","BodyID":14}',
      ]);

      expect(position.bodyName, 'Caeritis A 3 a');
      expect(position.systemAddress, 2931088689515);
    });

    test('l\'amarrage et la sortie à pied le conservent aussi', () {
      final CommanderPosition docked = foldAll(<String>[
        '{"timestamp":"2026-08-19T20:00:00Z","event":"FSDJump",'
            '"StarSystem":"Deciat","SystemAddress":6681123623626}',
        '{"timestamp":"2026-08-19T20:30:00Z","event":"Docked",'
            '"StationName":"Farseer Inc","StarSystem":"Deciat"}',
      ]);
      expect(docked.systemAddress, 6681123623626);

      final CommanderPosition onFoot = foldAll(<String>[
        '{"timestamp":"2026-08-19T20:00:00Z","event":"FSDJump",'
            '"StarSystem":"Caeritis","SystemAddress":2931088689515}',
        '{"timestamp":"2026-08-19T20:20:00Z","event":"Touchdown",'
            '"Body":"Caeritis A 3 a"}',
        '{"timestamp":"2026-08-19T20:21:00Z","event":"Disembark",'
            '"Body":"Caeritis A 3 a"}',
      ]);
      expect(onFoot.systemAddress, 2931088689515);
      expect(onFoot.onFoot, isTrue);
    });

    test('un nouveau saut remplace l\'identifiant précédent', () {
      final CommanderPosition position = foldAll(<String>[
        '{"timestamp":"2026-08-19T20:00:00Z","event":"FSDJump",'
            '"StarSystem":"Caeritis","SystemAddress":2931088689515}',
        '{"timestamp":"2026-08-19T21:00:00Z","event":"FSDJump",'
            '"StarSystem":"Deciat","SystemAddress":6681123623626}',
      ]);

      expect(position.starSystem, 'Deciat');
      expect(position.systemAddress, 6681123623626);
    });
  });

  group('sortir du vaisseau ailleurs qu\'au sol', () {
    // `Disembark` sonne comme « poser le pied sur une planète », et c\'est
    // aussi ce que le commandant écrit en sortant dans le concourse d\'un
    // Orbis, à des centaines de milliers de secondes-lumière du moindre sol.
    const String saut = '{"timestamp":"2026-08-19T20:00:00Z","event":"FSDJump",'
        '"StarSystem":"Caeritis","SystemAddress":2931088689515,'
        '"Body":"Caeritis A","BodyType":"Star"}';
    const String amarrage =
        '{"timestamp":"2026-08-19T21:00:00Z","event":"Docked",'
        '"StationName":"Bernoulli Vision","StationType":"Orbis",'
        '"StarSystem":"Caeritis","SystemAddress":2931088689515,'
        '"DistFromStarLS":812.5}';

    test('le concourse d\'une station orbitale n\'est pas une planète', () {
      final CommanderPosition position = fold(<String>[
        saut,
        amarrage,
        '{"timestamp":"2026-08-19T21:05:00Z","event":"Disembark",'
            '"SRV":false,"Taxi":false,"Multicrew":false,"ID":12,'
            '"StarSystem":"Caeritis","SystemAddress":2931088689515,'
            '"Body":"Bernoulli Vision","BodyID":28,'
            '"OnStation":true,"OnPlanet":false,'
            '"StationName":"Bernoulli Vision","StationType":"Orbis"}',
      ]);

      expect(position.onFoot, isTrue);
      expect(position.activity, 'à pied');
      expect(position.isOnPlanet, isFalse);
      expect(position.bodyType, isNot('Planet'));
    });

    test('la station reste nommée quand le commandant en sort', () {
      // Le nom, le type et la distance à l\'étoile ne viennent que de
      // `Docked` : les effacer au premier pas dans le concourse les perd
      // jusqu\'au prochain amarrage.
      final CommanderPosition position = fold(<String>[
        saut,
        amarrage,
        '{"timestamp":"2026-08-19T21:05:00Z","event":"Disembark",'
            '"StarSystem":"Caeritis","Body":"Bernoulli Vision",'
            '"OnStation":true,"OnPlanet":false,'
            '"StationName":"Bernoulli Vision","StationType":"Orbis"}',
      ]);

      expect(position.stationName, 'Bernoulli Vision');
      expect(position.stationType, 'Orbis');
      expect(position.distanceFromStarLs, 812.5);
      expect(position.docked, isTrue);
    });

    test('remonter à bord ramène « amarré », pas « en vol »', () {
      final CommanderPosition position = fold(<String>[
        saut,
        amarrage,
        '{"timestamp":"2026-08-19T21:05:00Z","event":"Disembark",'
            '"StarSystem":"Caeritis","Body":"Bernoulli Vision",'
            '"OnStation":true,"OnPlanet":false,'
            '"StationName":"Bernoulli Vision","StationType":"Orbis"}',
        '{"timestamp":"2026-08-19T21:40:00Z","event":"Embark",'
            '"StarSystem":"Caeritis","Body":"Bernoulli Vision",'
            '"OnStation":true,"OnPlanet":false,'
            '"StationName":"Bernoulli Vision","StationType":"Orbis"}',
      ]);

      expect(position.onFoot, isFalse);
      expect(position.landed, isFalse);
      expect(position.docked, isTrue);
      expect(position.activity, 'amarré');
    });

    test('un port planétaire est les deux à la fois', () {
      // `OnStation` et `OnPlanet` sont vrais ensemble : le commandant marche
      // dans un port, et ce port est bien posé sur un monde.
      final CommanderPosition position = fold(<String>[
        '{"timestamp":"2026-08-19T21:00:00Z","event":"Docked",'
            '"StationName":"Vasquez Landing","StationType":"CraterPort",'
            '"StarSystem":"Nervi"}',
        '{"timestamp":"2026-08-19T21:05:00Z","event":"Disembark",'
            '"StarSystem":"Nervi","Body":"Nervi 2 a","BodyID":17,'
            '"OnStation":true,"OnPlanet":true,'
            '"StationName":"Vasquez Landing","StationType":"CraterPort"}',
      ]);

      expect(position.onFoot, isTrue);
      expect(position.isOnPlanet, isTrue);
      expect(position.bodyName, 'Nervi 2 a');
      expect(position.stationName, 'Vasquez Landing');
      expect(position.docked, isTrue);
    });
  });

  group('le vaisseau qui bouge sans son commandant', () {
    // Depuis Odyssey, l\'assistance de vol à distance pose et reprend le
    // vaisseau pendant que le commandant est à pied. Le journal écrit alors
    // les mêmes `Touchdown` et `Liftoff` qu\'un vol piloté, à un champ près.
    const List<String> aPiedSurUnMonde = <String>[
      '{"timestamp":"2026-08-19T20:00:00Z","event":"FSDJump",'
          '"StarSystem":"Caeritis","SystemAddress":2931088689515}',
      '{"timestamp":"2026-08-19T20:20:00Z","event":"Touchdown",'
          '"PlayerControlled":true,"Taxi":false,"Multicrew":false,'
          '"StarSystem":"Caeritis","Body":"Caeritis A 3 a","BodyID":14,'
          '"OnStation":false,"OnPlanet":true,'
          '"Latitude":-6.61,"Longitude":-46.0}',
      '{"timestamp":"2026-08-19T20:21:00Z","event":"Disembark",'
          '"SRV":false,"Taxi":false,"Multicrew":false,'
          '"StarSystem":"Caeritis","Body":"Caeritis A 3 a","BodyID":14,'
          '"OnStation":false,"OnPlanet":true}',
    ];

    test('congédier le vaisseau ne remet pas le commandant en vol', () {
      final CommanderPosition position = fold(<String>[
        ...aPiedSurUnMonde,
        '{"timestamp":"2026-08-19T20:30:00Z","event":"Liftoff",'
            '"PlayerControlled":false,"Taxi":false,"Multicrew":false,'
            '"StarSystem":"Caeritis","Body":"Caeritis A 3 a","BodyID":14,'
            '"OnStation":false,"OnPlanet":true}',
      ]);

      expect(position.onFoot, isTrue);
      expect(position.landed, isFalse);
      expect(position.activity, 'à pied');
      expect(position.isOnPlanet, isTrue);
    });

    test('le rappeler ne le remet pas dans le cockpit', () {
      final CommanderPosition position = fold(<String>[
        ...aPiedSurUnMonde,
        '{"timestamp":"2026-08-19T20:30:00Z","event":"Liftoff",'
            '"PlayerControlled":false,"StarSystem":"Caeritis",'
            '"Body":"Caeritis A 3 a","OnStation":false,"OnPlanet":true}',
        '{"timestamp":"2026-08-19T20:50:00Z","event":"Touchdown",'
            '"PlayerControlled":false,"Taxi":false,"Multicrew":false,'
            '"StarSystem":"Caeritis","Body":"Caeritis A 3 a","BodyID":14,'
            '"OnStation":false,"OnPlanet":true}',
      ]);

      expect(position.onFoot, isTrue);
      expect(position.landed, isFalse);
      expect(position.activity, 'à pied');
    });

    test('un décollage piloté, lui, remet bien en vol', () {
      // Le contraste qui donne son sens au test précédent : seul
      // `PlayerControlled` sépare les deux lignes.
      final CommanderPosition position = fold(<String>[
        ...aPiedSurUnMonde,
        '{"timestamp":"2026-08-19T20:29:00Z","event":"Embark",'
            '"StarSystem":"Caeritis","Body":"Caeritis A 3 a",'
            '"OnStation":false,"OnPlanet":true}',
        '{"timestamp":"2026-08-19T20:30:00Z","event":"Liftoff",'
            '"PlayerControlled":true,"Taxi":false,"Multicrew":false,'
            '"StarSystem":"Caeritis","Body":"Caeritis A 3 a",'
            '"OnStation":false,"OnPlanet":true,'
            '"Latitude":-6.61,"Longitude":-46.0}',
      ]);

      expect(position.onFoot, isFalse);
      expect(position.landed, isFalse);
      expect(position.activity, 'en vol');
    });

    test('un taxi Apex emporte son passager, sans être piloté par lui', () {
      // `PlayerControlled` est faux aussi dans une navette Apex, où le
      // commandant est pourtant bien assis à bord. Le lire seul rendrait le
      // trajet immobile.
      final CommanderPosition position = fold(<String>[
        '{"timestamp":"2026-08-19T21:00:00Z","event":"Docked",'
            '"StationName":"Bernoulli Vision","StationType":"Orbis",'
            '"StarSystem":"Caeritis"}',
        '{"timestamp":"2026-08-19T21:05:00Z","event":"Disembark",'
            '"StarSystem":"Caeritis","Body":"Bernoulli Vision",'
            '"OnStation":true,"OnPlanet":false,'
            '"StationName":"Bernoulli Vision"}',
        '{"timestamp":"2026-08-19T21:20:00Z","event":"Embark",'
            '"SRV":false,"Taxi":true,"Multicrew":false,'
            '"StarSystem":"Caeritis","Body":"Bernoulli Vision",'
            '"OnStation":true,"OnPlanet":false,'
            '"StationName":"Bernoulli Vision"}',
        '{"timestamp":"2026-08-19T21:21:00Z","event":"Undocked",'
            '"StationName":"Bernoulli Vision","Taxi":true}',
        '{"timestamp":"2026-08-19T21:22:00Z","event":"Liftoff",'
            '"PlayerControlled":false,"Taxi":true,"Multicrew":false,'
            '"StarSystem":"Caeritis","OnStation":false,"OnPlanet":false}',
        '{"timestamp":"2026-08-19T21:45:00Z","event":"Touchdown",'
            '"PlayerControlled":false,"Taxi":true,"Multicrew":false,'
            '"StarSystem":"Nervi","SystemAddress":2865716354233,'
            '"Body":"Nervi 2 a","BodyID":17,'
            '"OnStation":true,"OnPlanet":true}',
      ]);

      expect(position.onFoot, isFalse);
      expect(position.landed, isTrue);
      expect(position.activity, 'posé');
      expect(position.bodyName, 'Nervi 2 a');
      expect(position.starSystem, 'Nervi');
    });
  });

  group('Liftoff et Embark sont lus comme leurs symétriques', () {
    test('les quatre événements donnent les deux types attendus', () {
      // `Touchdown`/`Liftoff` décrivent le vaisseau, `Disembark`/`Embark` le
      // commandant : couper chaque paire en deux est ce qui laissait la
      // moitié des cas sans les champs qui les distinguent.
      expect(
        parser.parseLine('{"timestamp":"2026-08-19T20:00:00Z",'
            '"event":"Liftoff","PlayerControlled":false}'),
        isA<SurfaceContactEvent>()
            .having((SurfaceContactEvent e) => e.isTouchdown, 'isTouchdown',
                isFalse)
            .having((SurfaceContactEvent e) => e.carriesCommander,
                'carriesCommander', isFalse),
      );
      expect(
        parser.parseLine('{"timestamp":"2026-08-19T20:00:00Z",'
            '"event":"Touchdown","Multicrew":true,'
            '"PlayerControlled":false}'),
        isA<SurfaceContactEvent>().having(
            (SurfaceContactEvent e) => e.carriesCommander, 'carriesCommander',
            isTrue),
      );
      expect(
        parser.parseLine('{"timestamp":"2026-08-19T20:00:00Z",'
            '"event":"Embark","OnStation":true,"OnPlanet":false,'
            '"StationName":"Bernoulli Vision"}'),
        isA<EmbarkEvent>()
            .having((EmbarkEvent e) => e.isDisembark, 'isDisembark', isFalse)
            .having((EmbarkEvent e) => e.stationName, 'stationName',
                'Bernoulli Vision'),
      );
      expect(
        parser.parseLine('{"timestamp":"2026-08-19T20:00:00Z",'
            '"event":"Disembark","OnPlanet":true}'),
        isA<EmbarkEvent>()
            .having((EmbarkEvent e) => e.isDisembark, 'isDisembark', isTrue),
      );
    });
  });

}
