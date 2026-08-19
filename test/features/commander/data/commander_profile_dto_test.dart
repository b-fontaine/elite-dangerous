import 'dart:convert';

import 'package:elite_dangerous/features/commander/data/models/commander_profile_dto.dart';
import 'package:elite_dangerous/features/commander/domain/entities/commander.dart';
import 'package:elite_dangerous/features/commander/domain/entities/rank.dart';
import 'package:elite_dangerous/features/commander/domain/entities/suit_info.dart';
import 'package:flutter_test/flutter_test.dart';

/// A realistic `/profile` payload, including the two shapes Frontier alternates
/// between for `ships` / `suits` / `loadouts`.
const String _profileWithMaps = '''
{
  "commander": {
    "id": 123456,
    "name": "Caspian",
    "credits": 45480912,
    "debt": 0,
    "currentShipId": 12,
    "alive": true,
    "docked": true,
    "onfoot": false,
    "rank": {
      "combat": 0, "trade": 3, "explore": 5, "soldier": 0,
      "exobiologist": 1, "cqc": 0, "empire": 6, "federation": 0,
      "power": 0, "crime": 0, "service": 0
    }
  },
  "lastSystem": { "id": 1, "name": "Cubeo" },
  "lastStarport": { "id": 2, "name": "Bloch Terminal" },
  "ship": {
    "name": "caspian",
    "shipName": "USS ENTERPRISE",
    "shipID": 12,
    "starsystem": { "name": "Cubeo", "systemaddress": 9876 }
  },
  "ships": { "12": { "name": "caspian", "shipName": "USS ENTERPRISE" } },
  "suit": {
    "name": "explorationsuit_class3",
    "locName": "\$ExplorationSuit_Class3_Name;",
    "suitId": 1698364940285172,
    "mods": ["suit_improvedbatterycapacity", "suit_increasedsprintduration"]
  },
  "suits": {
    "0": { "name": "explorationsuit_class3", "suitId": 1, "mods": [] },
    "1": { "name": "utilitysuit_class3", "locName": "Maverick Suit", "suitId": 2, "mods": [] }
  }
}
''';

const String _profileWithLists = '''
{
  "commander": { "name": "Rookie", "credits": 1000, "rank": { "explore": 12, "combat": 42 } },
  "suits": [
    { "name": "flightsuit", "suitId": 1, "mods": [] },
    { "name": "explorationsuit_class1", "suitId": 2, "mods": [] }
  ],
  "ships": [ { "name": "sidewinder", "shipName": "Bug" } ]
}
''';

void main() {
  Commander parse(String json) => CommanderProfileDto.fromJson(
        jsonDecode(json) as Map<String, dynamic>,
      ).toEntity(source: CommanderDataSource.companionApi);

  group('CommanderProfileDto', () {
    test('reads the commander identity and balance', () {
      final Commander commander = parse(_profileWithMaps);

      expect(commander.name, 'Caspian');
      expect(commander.credits, 45480912);
      expect(commander.currentSystem, 'Cubeo');
      expect(commander.currentStation, 'Bloch Terminal');
      expect(commander.shipName, 'USS ENTERPRISE');
      expect(commander.shipType, 'caspian');
      expect(commander.docked, isTrue);
      expect(commander.onFoot, isFalse);
    });

    test('maps the lowercase CAPI rank keys onto the ladders', () {
      final Commander commander = parse(_profileWithMaps);

      expect(commander.rankLevel(RankType.explore), 5);
      expect(commander.rank(RankType.explore)?.name, 'Pathfinder');
      expect(commander.rank(RankType.exobiologist)?.name,
          'Mostly Directionless');
      expect(commander.rank(RankType.combat)?.name, 'Harmless');
      expect(commander.rank(RankType.empire)?.name, 'Lord');
    });

    test('ignores rank keys the app does not model', () {
      final Commander commander = parse(_profileWithMaps);

      expect(commander.ranks.keys, isNot(contains(null)));
      expect(commander.ranks, hasLength(RankType.values.length));
    });

    test('reads suits when Frontier sends a Map', () {
      final Commander commander = parse(_profileWithMaps);

      expect(commander.suits, hasLength(2));
      expect(commander.artemis?.grade, 3);
      expect(commander.ownsMaverick, isTrue);
    });

    test('reads suits when Frontier sends a List', () {
      final Commander commander = parse(_profileWithLists);

      expect(commander.suits, hasLength(2));
      expect(commander.artemis?.grade, 1);
      expect(commander.ownsMaverick, isFalse);
    });

    test('normalises the broken localisation key Frontier returns', () {
      final Commander commander = parse(_profileWithMaps);

      expect(commander.currentSuit?.displayName, isNot(startsWith(r'$')));
      expect(commander.currentSuit?.displayName, contains('Artemis'));
    });

    test('keeps the installed modification symbols', () {
      final Commander commander = parse(_profileWithMaps);

      expect(
        commander.currentSuit?.modIds,
        containsAll(<String>[
          'suit_improvedbatterycapacity',
          'suit_increasedsprintduration',
        ]),
      );
    });

    test('reads the Elite tiers that sit above the base ladder', () {
      final Commander commander = parse(_profileWithLists);

      // Nine names (Aimless…Elite) then Elite I to V: level 12 is Elite IV.
      expect(commander.rank(RankType.explore)?.name, 'Elite IV');
    });

    test('a level past every known tier degrades instead of throwing', () {
      final Commander commander = parse(_profileWithLists);

      expect(commander.rank(RankType.combat)?.name, 'Rang 42');
    });

    test('superpower ladders stop at their last name, with no Elite tiers', () {
      expect(RankType.empire.hasEliteTiers, isFalse);
      expect(RankType.empire.nameFor(14), 'King');
      expect(RankType.empire.nameFor(15), 'Rang 15');
    });

    test('an almost empty payload does not throw', () {
      expect(
        () => CommanderProfileDto.fromJson(const <String, dynamic>{})
            .toEntity(source: CommanderDataSource.companionApi),
        returnsNormally,
      );
    });
  });

  group('normaliseCollection', () {
    test('accepts a List', () {
      expect(
        CommanderProfileDto.normaliseCollection(<dynamic>[
          <String, dynamic>{'a': 1},
        ]),
        hasLength(1),
      );
    });

    test('accepts a Map keyed by index', () {
      expect(
        CommanderProfileDto.normaliseCollection(<String, dynamic>{
          '0': <String, dynamic>{'a': 1},
          '7': <String, dynamic>{'a': 2},
        }),
        hasLength(2),
      );
    });

    test('returns empty for anything else', () {
      expect(CommanderProfileDto.normaliseCollection(null), isEmpty);
      expect(CommanderProfileDto.normaliseCollection('nope'), isEmpty);
    });
  });

  group('SuitInfo parsing', () {
    test('derives kind and grade from the symbol', () {
      final SuitInfo suit = SuitInfo.fromSymbol('explorationsuit_class4');

      expect(suit.kind, SuitKind.artemis);
      expect(suit.grade, 4);
      expect(suit.canBeModified, isTrue);
      expect(suit.modificationSlots, 3);
    });

    test('a flight suit has no class suffix and cannot be modified', () {
      final SuitInfo suit = SuitInfo.fromSymbol('flightsuit');

      expect(suit.kind, SuitKind.flight);
      expect(suit.grade, 0);
      expect(suit.canBeModified, isFalse);
    });

    test('parses the broken localisation key form', () {
      final SuitInfo suit = SuitInfo.fromSymbol(r'$TacticalSuit_Class3_Name;');

      expect(suit.kind, SuitKind.dominator);
      expect(suit.grade, 3);
      expect(suit.symbol, 'tacticalsuit_class3');
    });

    test('prefers a real locName when Frontier provides one', () {
      final SuitInfo suit = SuitInfo.fromSymbol(
        'utilitysuit_class3',
        locName: 'Maverick Suit',
      );

      expect(suit.displayName, 'Maverick Suit');
    });

    test('falls back to a readable name when locName is the raw key', () {
      final SuitInfo suit = SuitInfo.fromSymbol(
        'explorationsuit_class2',
        locName: r'$ExplorationSuit_Class2_Name;',
      );

      expect(suit.displayName, 'Artemis Suit — grade 2');
    });

    test('an unknown suit symbol degrades instead of throwing', () {
      final SuitInfo suit = SuitInfo.fromSymbol('mysterysuit_class9');

      expect(suit.kind, SuitKind.unknown);
      expect(suit.grade, 9);
    });
  });
}
