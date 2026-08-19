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
}
