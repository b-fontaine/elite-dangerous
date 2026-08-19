import 'dart:convert';

import 'package:elite_dangerous/core/format/credits.dart';
import 'package:elite_dangerous/features/commander/domain/entities/rank.dart';
import 'package:elite_dangerous/features/diagnostics/domain/entities/payload_inspection.dart';
import 'package:elite_dangerous/features/diagnostics/domain/services/payload_inspector.dart';
import 'package:flutter_test/flutter_test.dart';

/// A `/profile` shaped like the ones Frontier actually returns: a fleet keyed
/// by ship id, a `modules` block on the flown ship only, and the on-foot
/// `loadouts` that appear in no Frontier document.
const String _profileWithFleet = '''
{
  "commander": {
    "id": 123456,
    "name": "Caspian",
    "credits": 45480912,
    "debt": 0,
    "currentShipId": 12,
    "docked": true,
    "onfoot": false,
    "rank": {
      "combat": 0, "trade": 3, "explore": 5, "soldier": 2,
      "exobiologist": 1, "cqc": 0, "empire": 6, "federation": 0
    },
    "capabilities": { "Horizons": true, "Odyssey": true }
  },
  "lastSystem": { "id": 1, "name": "Cubeo" },
  "lastStarport": {
    "id": 2,
    "name": "Bloch Terminal",
    "services": { "outfitting": "ok", "shipyard": "ok", "engineer": "ok" }
  },
  "ship": {
    "id": 12,
    "name": "krait_light",
    "shipName": "Vista",
    "value": { "hull": 40000000, "modules": 60000000, "cargo": 0, "total": 100000000, "unloaned": 100000000 },
    "modules": {
      "PowerPlant": {
        "module": { "id": 1, "name": "Int_Powerplant_Size6_Class5", "value": 1000 },
        "engineer": { "engineerName": "Felicity Farseer", "recipeLevel": 5 }
      },
      "FrameShiftDrive": {
        "module": { "id": 2, "name": "Int_Hyperdrive_Size5_Class5", "value": 2000 }
      }
    }
  },
  "ships": {
    "12": { "id": 12, "name": "krait_light", "shipName": "Vista",
            "value": { "hull": 40000000, "modules": 60000000, "total": 100000000 },
            "modules": { "PowerPlant": {} } },
    "31": { "id": 31, "name": "anaconda", "shipName": "Le Boeuf",
            "value": { "hull": 140000000, "modules": 200000000, "total": 340000000 },
            "starsystem": { "name": "Deciat" }, "station": { "name": "Garay Terminal" } }
  },
  "suit": { "name": "explorationsuit_class3", "suitId": 1, "mods": ["suit_increasedsprintduration"] },
  "suits": {
    "0": { "name": "explorationsuit_class3", "suitId": 1, "mods": [] },
    "1": { "name": "utilitysuit_class3", "suitId": 2, "mods": [] }
  },
  "loadout": {
    "name": "Exobio",
    "slots": {
      "PrimaryWeapon1": { "name": "wpn_m_assaultrifle_laser_fauto", "locName": "TK Aphelion",
                          "weaponrackId": 99, "class": 4, "mods": ["wpn_magazinesize"] },
      "SecondaryWeapon": { "name": "wpn_s_pistol_plasma_charged", "locName": "Manticore Tormentor",
                           "weaponrackId": 98, "class": 2, "mods": [] }
    }
  },
  "loadouts": {
    "0": {
      "name": "Exobio",
      "slots": {
        "PrimaryWeapon1": { "name": "wpn_m_assaultrifle_laser_fauto", "class": 4, "mods": [] }
      }
    }
  }
}
''';

/// The same account without Odyssey, and with a single ship.
const String _profileBare = '''
{
  "commander": { "name": "Rookie", "credits": 1000, "currentShipId": 0,
                 "rank": { "explore": 1, "combat": 0 } },
  "ship": { "id": 0, "name": "sidewinder" },
  "ships": [ { "id": 0, "name": "sidewinder", "shipName": "Bug" } ]
}
''';

void main() {
  final PayloadInspector inspector = PayloadInspector(
    parsedJournalEvents: const <String>{
      'ScanOrganic',
      'SellOrganicData',
      'SuitLoadout',
    },
    modelledRankKeys: <String>{
      for (final RankType type in RankType.values) type.capiKey,
    },
  );

  Map<String, dynamic> decode(String json) =>
      jsonDecode(json) as Map<String, dynamic>;

  InspectionFinding findingFor(ProfileInspection inspection, String subject) =>
      inspection.findings.firstWhere(
        (InspectionFinding finding) => finding.subject == subject,
      );

  group('inspectProfile', () {
    test('lists the top-level keys, sorted', () {
      final ProfileInspection inspection =
          inspector.inspectProfile(decode(_profileWithFleet));

      expect(
        inspection.topLevelKeys,
        containsAll(<String>['commander', 'ship', 'ships', 'suits', 'loadouts']),
      );
      expect(
        inspection.topLevelKeys,
        orderedEquals(<String>[...inspection.topLevelKeys]..sort()),
      );
    });

    test('reads a fleet sent as an object keyed by ship id', () {
      final InspectionFinding fleet = findingFor(
        inspector.inspectProfile(decode(_profileWithFleet)),
        'Flotte',
      );

      expect(fleet.verdict, InspectionVerdict.present);
      expect(fleet.detail, contains('2 vaisseau'));
      expect(fleet.detail, contains('objet indexé'));
    });

    test(
      'answers the stored-ship equipment question against the flown ship',
      () {
        // The flown ship carries `modules`; the stored Anaconda does not.
        // That is precisely the case the community reference gets wrong.
        final InspectionFinding finding = findingFor(
          inspector.inspectProfile(decode(_profileWithFleet)),
          'Équipement des vaisseaux stockés',
        );

        expect(finding.isOpenQuestion, isTrue);
        expect(finding.verdict, InspectionVerdict.absent);
        expect(finding.detail, contains('0 / 1'));
      },
    );

    test('refuses to conclude when the commander owns a single ship', () {
      final InspectionFinding finding = findingFor(
        inspector.inspectProfile(decode(_profileBare)),
        'Équipement des vaisseaux stockés',
      );

      expect(finding.verdict, InspectionVerdict.unknown);
      expect(finding.detail, contains('impossible de trancher'));
    });

    test('counts the flown ship modules and the engineered ones', () {
      final InspectionFinding finding = findingFor(
        inspector.inspectProfile(decode(_profileWithFleet)),
        'Modules du vaisseau piloté',
      );

      expect(finding.verdict, InspectionVerdict.present);
      expect(finding.detail, contains('2 emplacement'));
      expect(finding.detail, contains('2 fonctionnel'));
      expect(finding.detail, contains('1 porte(nt) un bloc `engineer`'));
    });

    test('derives the rebuy from hull plus modules, not from the total', () {
      final InspectionFinding finding = findingFor(
        inspector.inspectProfile(decode(_profileWithFleet)),
        'Valeur et rebuy',
      );

      // 5 % of 100 000 000 — the cargo the `total` may include is excluded on
      // purpose: the game does not insure it.
      expect(finding.detail, contains(formatCreditsExact(5000000)));
      expect(finding.detail, contains(formatCreditsExact(100000000)));
    });

    test('answers the on-foot loadout question, grades included', () {
      final InspectionFinding finding = findingFor(
        inspector.inspectProfile(decode(_profileWithFleet)),
        'Loadouts à pied (armes et grades)',
      );

      expect(finding.isOpenQuestion, isTrue);
      expect(finding.verdict, InspectionVerdict.present);
      // Two loadouts — `loadouts` plus the current `loadout` — and three
      // weapon slots between them, all carrying `class`.
      expect(finding.detail, contains('2 loadout'));
      expect(finding.detail, contains('3 arme'));
      expect(finding.detail, contains('présents sur toutes'));
    });

    test('reports the absence of loadouts rather than inventing one', () {
      final InspectionFinding finding = findingFor(
        inspector.inspectProfile(decode(_profileBare)),
        'Loadouts à pied (armes et grades)',
      );

      expect(finding.verdict, InspectionVerdict.absent);
      expect(finding.detail, contains('SuitLoadout'));
    });

    test('flags the Odyssey rank ladders when they are missing', () {
      final InspectionFinding full = findingFor(
        inspector.inspectProfile(decode(_profileWithFleet)),
        'Rangs',
      );
      final InspectionFinding bare = findingFor(
        inspector.inspectProfile(decode(_profileBare)),
        'Rangs',
      );

      expect(full.verdict, InspectionVerdict.present);
      expect(bare.verdict, InspectionVerdict.partial);
      expect(bare.detail, contains('exobiologist'));
    });

    test('an unreadable capture yields findings, never an exception', () {
      final ProfileInspection inspection =
          inspector.inspectProfile(<String, dynamic>{});

      expect(inspection.topLevelKeys, isEmpty);
      expect(inspection.findings, isNotEmpty);
      expect(inspection.openQuestions, hasLength(2));
    });
  });

  group('inspectJournal', () {
    const List<String> lines = <String>[
      '{"timestamp":"2026-08-18T20:00:00Z","event":"LoadGame","Commander":"Caspian"}',
      '{"timestamp":"2026-08-18T20:00:01Z","event":"Statistics","Exobiology":{"Organic_Data_Profits":812000000}}',
      '{"timestamp":"2026-08-18T20:00:02Z","event":"EngineerProgress","Engineers":[]}',
      '{"timestamp":"2026-08-18T21:30:00Z","event":"ScanOrganic","ScanType":"Log"}',
      '{"timestamp":"2026-08-18T21:31:00Z","event":"ScanOrganic","ScanType":"Sample"}',
      '{"timestamp":"2026-08-19T09:00:00Z","event":"SuitLoadout","SuitName":"explorationsuit_class3"}',
      'moitié de ligne écrite pendant un crash',
      '{"timestamp":"2026-08-19T09:00:00Z"}',
      '',
    ];

    test('tallies every event type, most frequent first', () {
      final JournalInspection inspection = inspector.inspectJournal(lines);

      expect(inspection.lineCount, 8);
      expect(inspection.unreadableLines, 2);
      expect(inspection.tallies.first.name, 'ScanOrganic');
      expect(inspection.tallies.first.count, 2);
      expect(inspection.eventTypeCount, 5);
    });

    test('spans the capture from its first timestamp to its last', () {
      final JournalInspection inspection = inspector.inspectJournal(lines);

      expect(inspection.firstAt, DateTime.utc(2026, 8, 18, 20));
      expect(inspection.lastAt, DateTime.utc(2026, 8, 19, 9));
    });

    test('says which events the app reads, and which only partially', () {
      final JournalInspection inspection = inspector.inspectJournal(lines);
      JournalEventTally tally(String name) => inspection.tallies
          .firstWhere((JournalEventTally item) => item.name == name);

      expect(tally('ScanOrganic').isParsed, isTrue);
      expect(tally('ScanOrganic').isPlanned, isFalse);
      expect(tally('Statistics').isParsed, isFalse);
      expect(tally('Statistics').isPlanned, isTrue);
      // Read for the suit, ignored for the weapons it carries.
      expect(tally('SuitLoadout').isPartiallyRead, isTrue);
    });

    test('keeps a planned event that never appeared, at zero', () {
      final JournalInspection inspection = inspector.inspectJournal(lines);

      final List<String> missing = inspection.missing
          .map((JournalEventTally tally) => tally.name)
          .toList(growable: false);

      expect(missing, contains('ShipLocker'));
      expect(missing, contains('Reputation'));
      expect(missing, isNot(contains('Statistics')));
      expect(
        inspection.tallies
            .firstWhere((JournalEventTally tally) => tally.name == 'ShipLocker')
            .count,
        0,
      );
    });

    test('an empty capture is a valid answer', () {
      final JournalInspection inspection =
          inspector.inspectJournal(const <String>[]);

      expect(inspection.lineCount, 0);
      expect(inspection.eventTypeCount, 0);
      expect(inspection.missing, hasLength(
        PayloadInspector.defaultPlannedJournalEvents.length,
      ));
    });
  });
}
