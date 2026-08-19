import 'package:elite_dangerous/features/exobiology/domain/entities/commander_snapshot.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/suit.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/exobiology_reference_data.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/roadmap_declaration_resolver.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/roadmap_step_ids.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/exobiology_fixtures.dart';

void main() {
  const RoadmapDeclarationResolver resolver = RoadmapDeclarationResolver();

  CommanderSnapshot declaring(Set<String> ids) =>
      rookieCommander.copyWith(completedRoadmapStepIds: ids);

  test('a snapshot with no declarations is returned untouched', () {
    expect(resolver.resolve(rookieCommander), rookieCommander);
  });

  test('declaring the Artemis makes the commander able to sample organics', () {
    final CommanderSnapshot resolved =
        resolver.resolve(declaring(<String>{RoadmapStepIds.artemisSuit}));

    expect(resolved.canSampleOrganics, isTrue);
    expect(resolved.suit.grade, 1);
    expect(resolved.ownedSuitTypes, contains(SuitType.artemis));
  });

  test('declaring grade 2 implies the suit can be modified', () {
    final CommanderSnapshot resolved = resolver.resolve(
      declaring(<String>{
        RoadmapStepIds.artemisSuit,
        RoadmapStepIds.artemisGradeTwo,
      }),
    );

    expect(resolved.suit.grade, 2);
    expect(resolved.suit.canBeModified, isTrue);
    expect(resolved.suit.freeModificationSlots, 1);
  });

  test('a declared grade never downgrades a higher observed grade', () {
    final CommanderSnapshot resolved = resolver.resolve(
      equippedCommander(suitGrade: 5).copyWith(
        completedRoadmapStepIds: <String>{RoadmapStepIds.artemisGradeTwo},
      ),
    );

    expect(resolved.suit.grade, 5);
  });

  test('a declared suit engineer lands in the suit engineer set', () {
    final CommanderSnapshot resolved = resolver.resolve(
      declaring(<String>{
        RoadmapStepIds.unlock(ExobiologyReferenceData.wellingtonBeck),
      }),
    );

    expect(
      resolved.unlockedSuitEngineerIds,
      contains(ExobiologyReferenceData.wellingtonBeck),
    );
    expect(resolved.unlockedShipEngineerIds, isEmpty);
  });

  test('a declared ship engineer lands in the ship engineer set', () {
    final CommanderSnapshot resolved = resolver.resolve(
      declaring(<String>{
        RoadmapStepIds.unlock(ExobiologyReferenceData.felicityFarseer),
      }),
    );

    expect(
      resolved.unlockedShipEngineerIds,
      contains(ExobiologyReferenceData.felicityFarseer),
    );
    expect(resolved.unlockedSuitEngineerIds, isEmpty);
  });

  test('a declared suit modification is treated as installed', () {
    final CommanderSnapshot resolved = resolver.resolve(
      declaring(<String>{
        RoadmapStepIds.artemisSuit,
        RoadmapStepIds.artemisGradeTwo,
        RoadmapStepIds.engineering(
          ExobiologyReferenceData.modImprovedBattery,
        ),
      }),
    );

    expect(
      resolved.suit.installedModificationIds,
      contains(ExobiologyReferenceData.modImprovedBattery),
    );
  });

  test('ship engineering declarations set their dedicated flags', () {
    final CommanderSnapshot resolved = resolver.resolve(
      declaring(<String>{
        RoadmapStepIds.fsdIncreasedRange,
        RoadmapStepIds.massManager,
        RoadmapStepIds.guardianFsdBooster,
        RoadmapStepIds.detailedSurfaceScanner,
        RoadmapStepIds.pranavAntal,
      }),
    );

    expect(resolved.hasFsdIncreasedRangeG5, isTrue);
    expect(resolved.hasMassManager, isTrue);
    expect(resolved.hasGuardianFsdBooster, isTrue);
    expect(resolved.hasDetailedSurfaceScanner, isTrue);
    expect(resolved.hasExobiologySalesBonus, isTrue);
  });

  test('an unknown declaration is ignored rather than throwing', () {
    expect(
      () => resolver.resolve(declaring(<String>{'totally.unknown.step'})),
      returnsNormally,
    );
  });
}
