import 'package:equatable/equatable.dart';

/// An engineer who applies a blueprint, and how far they take it.
class BlueprintEngineer extends Equatable {
  const BlueprintEngineer({
    required this.id,
    required this.name,
    required this.maxGrade,
  });

  final String id;
  final String name;

  /// The highest grade this engineer reaches for this blueprint. Farseer tops
  /// out at 3 on Sensors and Thrusters while going to 5 on the FSD, and making
  /// the trip for a grade they cannot apply is the mistake worth preventing.
  final int maxGrade;

  @override
  List<Object?> get props => <Object?>[id, name, maxGrade];
}

/// One grade of a blueprint, and what a single roll of it costs.
class BlueprintGrade extends Equatable {
  const BlueprintGrade({
    required this.grade,
    required this.rollsAtReputation5,
    required this.materials,
    this.effect,
  });

  final int grade;

  /// How many rolls this grade takes at engineer reputation 5.
  ///
  /// Since Update 18.08 (7 August 2024) a roll gives a fixed result rather
  /// than a random one: at reputation 5 a grade-N blueprint takes N rolls.
  /// Below that it takes more — but it is still not random.
  final int rollsAtReputation5;

  /// Material id to quantity, **per roll**. The full cost of the grade is this
  /// multiplied by [rollsAtReputation5].
  final Map<String, int> materials;

  /// The headline effect, e.g. `+55 % de masse optimale`.
  final String? effect;

  /// What the grade costs in full, rolls included.
  Map<String, int> get totalMaterials => <String, int>{
        for (final MapEntry<String, int> entry in materials.entries)
          entry.key: entry.value * rollsAtReputation5,
      };

  @override
  List<Object?> get props =>
      <Object?>[grade, rollsAtReputation5, materials, effect];
}

/// An experimental effect, applied once on top of a finished blueprint.
class ExperimentalEffect extends Equatable {
  const ExperimentalEffect({
    required this.id,
    required this.name,
    required this.materials,
    this.description,
  });

  final String id;
  final String name;
  final String? description;

  /// Applied once, so unlike [BlueprintGrade.materials] this is the whole cost.
  final Map<String, int> materials;

  @override
  List<Object?> get props => <Object?>[id, name, description, materials];
}

/// A module blueprint the commander can work towards.
class Blueprint extends Equatable {
  const Blueprint({
    required this.id,
    required this.fdName,
    required this.name,
    required this.module,
    required this.grades,
    this.purpose,
    this.warning,
    this.engineers = const <BlueprintEngineer>[],
    this.engineersNote,
    this.experimentals = const <ExperimentalEffect>[],
  });

  final String id;

  /// Frontier's own identifier, e.g. `FSD_LongRange`, so a reader can check
  /// this against any other tool.
  final String fdName;

  final String name;
  final String module;

  /// Why it is worth doing, in the commander's terms.
  final String? purpose;

  /// What blocks it, when something does.
  final String? warning;

  final List<BlueprintEngineer> engineers;

  /// Anything the engineer list does not say by itself — including that it is
  /// not exhaustive.
  final String? engineersNote;

  final List<BlueprintGrade> grades;
  final List<ExperimentalEffect> experimentals;

  int get maxGrade => grades.fold<int>(
        0,
        (int best, BlueprintGrade grade) =>
            grade.grade > best ? grade.grade : best,
      );

  BlueprintGrade? gradeAt(int grade) {
    for (final BlueprintGrade candidate in grades) {
      if (candidate.grade == grade) {
        return candidate;
      }
    }
    return null;
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        fdName,
        name,
        module,
        purpose,
        warning,
        engineers,
        engineersNote,
        grades,
        experimentals,
      ];
}

/// One step up a suit's grade ladder.
class SuitGradeStep extends Equatable {
  const SuitGradeStep({
    required this.fromGrade,
    required this.toGrade,
    required this.materials,
    this.creditsCr,
    this.modificationSlots,
  });

  final int fromGrade;
  final int toGrade;

  /// Material id to quantity. Paid once — a suit grade has no rolls.
  final Map<String, int> materials;

  /// From the Fandom wiki alone; Inara lists no credit cost for suit grades.
  /// Treated as unconfirmed everywhere it is shown.
  final int? creditsCr;

  /// Modification slots the suit has once at [toGrade]: 0, 1, 2, 3, 4 from G1
  /// to G5.
  final int? modificationSlots;

  @override
  List<Object?> get props =>
      <Object?>[fromGrade, toGrade, materials, creditsCr, modificationSlots];
}

/// The grade ladder of one suit.
///
/// The three suits share exactly the same list but for a single component:
/// Aerogel for the Artemis, Carbon Fibre Plating for the Maverick, Titanium
/// Plating for the Dominator. Copying a list written for another suit is the
/// classic mistake.
class SuitUpgradePath extends Equatable {
  const SuitUpgradePath({
    required this.id,
    required this.name,
    required this.platingMaterialId,
    required this.steps,
  });

  final String id;
  final String name;

  /// The one component that differs between the three suits.
  final String platingMaterialId;

  final List<SuitGradeStep> steps;

  SuitGradeStep? stepFrom(int grade) {
    for (final SuitGradeStep step in steps) {
      if (step.fromGrade == grade) {
        return step;
      }
    }
    return null;
  }

  @override
  List<Object?> get props => <Object?>[id, name, platingMaterialId, steps];
}
