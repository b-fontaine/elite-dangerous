import 'package:elite_dangerous/features/exobiology/domain/entities/commander_snapshot.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/roadmap.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/exobiology_reference_data.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/exobiology_roadmap_engine.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/roadmap_rule.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/exobiology_fixtures.dart';

void main() {
  const ExobiologyRoadmapEngine engine = ExobiologyRoadmapEngine();

  RoadmapStep? stepOf(Roadmap roadmap, String id) =>
      roadmap.steps.where((RoadmapStep s) => s.id == id).firstOrNull;

  group('the very first thing to do', () {
    test('a commander without an Artemis is told to buy one first', () {
      final Roadmap roadmap = engine.build(rookieCommander);

      expect(roadmap.nextStep?.id, 'equipment.artemis_suit');
      expect(roadmap.currentPhase, RoadmapPhase.equipement);
    });

    test('everything that depends on the suit is blocked, not hidden', () {
      final Roadmap roadmap = engine.build(rookieCommander);

      final RoadmapStep? gradeTwo = stepOf(roadmap, 'equipment.artemis_grade_2');
      expect(gradeTwo?.status, RoadmapStatus.blocked);
      expect(gradeTwo?.blockedReasons, isNotEmpty);
    });

    test('suit modifications are not even proposed without an Artemis', () {
      final Roadmap roadmap = engine.build(rookieCommander);

      expect(
        stepOf(roadmap, 'engineering.improved_battery_capacity'),
        isNull,
      );
    });
  });

  group('once the Artemis is owned', () {
    test('a grade 1 suit makes grade 2 the top equipment step', () {
      final Roadmap roadmap = engine.build(equippedCommander(suitGrade: 1));

      expect(stepOf(roadmap, 'equipment.artemis_suit')?.status,
          RoadmapStatus.done);
      expect(stepOf(roadmap, 'equipment.artemis_grade_2')?.status,
          RoadmapStatus.available);
    });

    test('modifications are blocked on a grade 1 suit with a stated reason',
        () {
      final Roadmap roadmap = engine.build(equippedCommander(suitGrade: 1));
      final RoadmapStep? battery =
          stepOf(roadmap, 'engineering.improved_battery_capacity');

      expect(battery?.status, RoadmapStatus.blocked);
      expect(
        battery?.blockedReasons.join(' '),
        contains('grade 2'),
      );
    });

    test('Improved Battery Capacity outranks the other modifications', () {
      final Roadmap roadmap = engine.build(equippedCommander());

      final int battery =
          stepOf(roadmap, 'engineering.improved_battery_capacity')!.priority;
      final int backpack =
          stepOf(roadmap, 'engineering.extra_backpack_capacity')!.priority;
      final int tool = stepOf(
        roadmap,
        'engineering.reduced_tool_battery_consumption',
      )!
          .priority;

      expect(battery, greaterThan(backpack));
      expect(backpack, greaterThan(tool));
    });

    test('a modification with no free slot is blocked on the slot, not money',
        () {
      final Roadmap roadmap = engine.build(
        equippedCommander(
          installedMods: <String>{ExobiologyReferenceData.modExtraBackpack},
        ),
      );

      final RoadmapStep battery =
          stepOf(roadmap, 'engineering.improved_battery_capacity')!;
      expect(battery.status, RoadmapStatus.blocked);
      expect(battery.blockedReasons.join(' '), contains('emplacement'));
    });

    test('an installed modification is marked done', () {
      final Roadmap roadmap = engine.build(
        equippedCommander(
          suitGrade: 3,
          installedMods: <String>{ExobiologyReferenceData.modImprovedBattery},
        ),
      );

      expect(
        stepOf(roadmap, 'engineering.improved_battery_capacity')?.status,
        RoadmapStatus.done,
      );
    });

    test('an insufficient balance is reported as a blocking reason', () {
      final Roadmap roadmap =
          engine.build(equippedCommander(creditBalance: 1000));

      expect(
        stepOf(roadmap, 'engineering.improved_battery_capacity')
            ?.blockedReasons
            .join(' '),
        contains('Cr'),
      );
    });
  });

  group('material planning', () {
    test('reports exactly what is missing to reach grade 3', () {
      final CommanderSnapshot snapshot = equippedCommander(suitGrade: 2)
          .copyWith(suitMaterials: const <String, int>{'Aerogel': 1});

      final RoadmapStep materials =
          stepOf(engine.build(snapshot), 'materials.artemis_upgrade')!;

      expect(materials.status, RoadmapStatus.inProgress);
      expect(materials.summary, contains('2 Suit Schematic'));
      expect(materials.summary, contains('4 Aerogel'));
    });

    test('is complete once every material is held', () {
      final RoadmapStep materials = stepOf(
        engine.build(equippedCommander(suitGrade: 2)),
        'materials.artemis_upgrade',
      )!;

      expect(materials.status, RoadmapStatus.available);
      expect(materials.progress, 1);
    });

    test('disappears once the target grade is reached', () {
      expect(
        stepOf(
          engine.build(equippedCommander(suitGrade: 3)),
          'materials.artemis_upgrade',
        ),
        isNull,
      );
    });
  });

  group('selling discipline', () {
    test('is absent when nothing is at risk', () {
      expect(
        stepOf(engine.build(equippedCommander()), 'discipline.sell_run'),
        isNull,
      );
    });

    test('outranks every other step as soon as data is unsold', () {
      final Roadmap roadmap = engine.build(
        equippedCommander().copyWith(unsoldOrganicDataCr: 12000000),
      );

      expect(roadmap.nextStep?.id, 'discipline.sell_run');
    });

    test('escalates further past the risk threshold', () {
      final int low = stepOf(
        engine.build(
          equippedCommander().copyWith(unsoldOrganicDataCr: 1000000),
        ),
        'discipline.sell_run',
      )!
          .priority;
      final int high = stepOf(
        engine.build(
          equippedCommander().copyWith(
            unsoldOrganicDataCr:
                ExobiologyReferenceData.atRiskDataThresholdCr + 1,
          ),
        ),
        'discipline.sell_run',
      )!
          .priority;

      expect(high, greaterThan(low));
    });
  });

  group('engineering and expedition gating', () {
    test('Farseer is blocked below Explorer rank Scout', () {
      final Roadmap roadmap = engine.build(
        equippedCommander().copyWith(explorerRank: 1),
      );

      final RoadmapStep farseer = stepOf(roadmap, 'unlock.felicity_farseer')!;
      expect(farseer.status, RoadmapStatus.blocked);
      expect(farseer.blockedReasons.join(' '), contains('Scout'));
    });

    test('Mass Manager waits for the G5 blueprint', () {
      final Roadmap roadmap = engine.build(equippedCommander());

      expect(
        stepOf(roadmap, 'engineering.mass_manager')?.status,
        RoadmapStatus.blocked,
      );
    });

    test('a deep-space expedition is blocked before the bubble loop', () {
      final RoadmapStep expedition = stepOf(
        engine.build(equippedCommander()),
        'expedition.first_logged',
      )!;

      expect(expedition.status, RoadmapStatus.blocked);
      expect(expedition.blockedReasons.join(' '), contains('Bulle'));
    });

    test('the expedition unlocks once the bubble loop and G5 are done', () {
      final Roadmap roadmap = engine.build(
        equippedCommander(exobiologyProfitCr: 120000000).copyWith(
          hasFsdIncreasedRangeG5: true,
          unlockedShipEngineerIds: <String>{
            ExobiologyReferenceData.felicityFarseer,
          },
        ),
      );

      expect(
        stepOf(roadmap, 'expedition.first_logged')?.status,
        RoadmapStatus.available,
      );
    });
  });

  group('ship advice', () {
    test('a Mandalay owner is never told to buy a Mandalay', () {
      expect(
        stepOf(engine.build(equippedCommander()), 'equipment.exobiology_ship'),
        isNull,
      );
    });

    test('a Caspian owner is left alone too', () {
      expect(
        stepOf(engine.build(caspianCommander), 'equipment.exobiology_ship'),
        isNull,
      );
    });

    test('a commander in a Sidewinder is pointed at the Mandalay', () {
      final Roadmap roadmap = engine.build(
        equippedCommander().copyWith(shipName: 'Sidewinder'),
      );

      expect(
        stepOf(roadmap, 'equipment.exobiology_ship')?.status,
        RoadmapStatus.available,
      );
    });
  });

  group('commander overrides', () {
    test('a step ticked off by hand is treated as done', () {
      final Roadmap roadmap = engine.build(
        rookieCommander.copyWith(
          completedRoadmapStepIds: <String>{'equipment.artemis_suit'},
        ),
      );

      expect(stepOf(roadmap, 'equipment.artemis_suit')?.status,
          RoadmapStatus.done);
    });

    test('completing a prerequisite by hand unblocks its dependents', () {
      final Roadmap roadmap = engine.build(
        rookieCommander.copyWith(
          completedRoadmapStepIds: <String>{'equipment.artemis_suit'},
        ),
      );

      expect(
        stepOf(roadmap, 'equipment.artemis_grade_2')?.status,
        isNot(RoadmapStatus.blocked),
      );
    });

    test('a dismissed step is kept but never proposed', () {
      final Roadmap roadmap = engine.build(
        rookieCommander.copyWith(
          dismissedRoadmapStepIds: <String>{'equipment.artemis_suit'},
        ),
      );

      expect(stepOf(roadmap, 'equipment.artemis_suit')?.status,
          RoadmapStatus.dismissed);
      expect(roadmap.actionable.map((RoadmapStep s) => s.id),
          isNot(contains('equipment.artemis_suit')));
    });
  });

  group('roadmap invariants', () {
    test('every rule produces a unique step id', () {
      final Roadmap roadmap = engine.build(equippedCommander());
      final List<String> ids =
          roadmap.steps.map((RoadmapStep s) => s.id).toList();

      expect(ids.toSet().length, ids.length);
    });

    test('actionable steps come first and are sorted by descending priority',
        () {
      final Roadmap roadmap = engine.build(
        equippedCommander().copyWith(unsoldOrganicDataCr: 5000000),
      );

      final List<RoadmapStep> actionable = roadmap.actionable;
      for (int i = 1; i < actionable.length; i++) {
        expect(
          actionable[i - 1].priority,
          greaterThanOrEqualTo(actionable[i].priority),
        );
      }
      final int firstBlocked = roadmap.steps
          .indexWhere((RoadmapStep s) => s.status == RoadmapStatus.blocked);
      final int lastActionable = roadmap.steps
          .lastIndexWhere((RoadmapStep s) => s.status.isActionable);
      expect(lastActionable, lessThan(firstBlocked));
    });

    test('every step carries a rationale and at least one reference', () {
      for (final RoadmapStep step in engine.build(equippedCommander()).steps) {
        expect(step.rationale, isNotEmpty, reason: step.id);
        expect(step.references, isNotEmpty, reason: step.id);
      }
    });

    test('the headline always answers "what do I do next?"', () {
      expect(engine.build(rookieCommander).headline, isNotEmpty);
      expect(engine.build(equippedCommander()).headline, isNotEmpty);
    });

    test('the engine is deterministic', () {
      expect(
        engine.build(equippedCommander()).steps,
        engine.build(equippedCommander()).steps,
      );
    });

    test('a custom rule set replaces the default one entirely', () {
      const ExobiologyRoadmapEngine empty =
          ExobiologyRoadmapEngine(rules: <RoadmapRule>[]);

      expect(empty.build(rookieCommander).steps, isEmpty);
      expect(empty.build(rookieCommander).nextStep, isNull);
    });
  });
}
