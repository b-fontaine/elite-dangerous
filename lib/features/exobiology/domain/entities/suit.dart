import 'package:equatable/equatable.dart';

/// Odyssey suits. Only the Artemis carries the Genetic Sampler, which makes it
/// mandatory for exobiology; the Maverick is listed because its Arc Cutter is
/// what actually makes material farming for the Artemis bearable.
enum SuitType {
  artemis('Artemis Suit', 'Exobiologie — seule combinaison avec Genetic Sampler'),
  maverick('Maverick Suit', 'Pillage — seule combinaison avec Arc Cutter'),
  dominator('Dominator Suit', 'Combat — hors profil pacifique'),
  flightSuit('Flight Suit', 'Combinaison de départ, sans outil');

  const SuitType(this.label, this.role);

  final String label;
  final String role;
}

/// A suit-engineering modification.
class SuitModification extends Equatable {
  const SuitModification({
    required this.id,
    required this.name,
    required this.effect,
    required this.creditCost,
    required this.engineerIds,
    required this.exobiologyPriority,
  });

  final String id;
  final String name;
  final String effect;
  final int creditCost;

  /// Engineers able to install it.
  final List<String> engineerIds;

  /// 1 = install first. Ordering comes straight from the Artemis guide:
  /// battery and backpack first, then tool consumption, then mobility.
  final int exobiologyPriority;

  @override
  List<Object?> get props => <Object?>[id, name, creditCost];
}

/// Material cost of one grade step.
class SuitGradeStep extends Equatable {
  const SuitGradeStep({
    required this.fromGrade,
    required this.toGrade,
    required this.materials,
  });

  final int fromGrade;
  final int toGrade;

  /// Material name → quantity. Grades cost **no credits**, only materials.
  final Map<String, int> materials;

  @override
  List<Object?> get props => <Object?>[fromGrade, toGrade, materials];
}

/// The commander's actual Artemis, as known by the app.
class SuitLoadout extends Equatable {
  const SuitLoadout({
    required this.type,
    required this.grade,
    this.installedModificationIds = const <String>{},
  });

  const SuitLoadout.none()
      : type = SuitType.flightSuit,
        grade = 0,
        installedModificationIds = const <String>{};

  final SuitType type;

  /// 0 = not owned, 1 → 5 otherwise.
  final int grade;

  final Set<String> installedModificationIds;

  bool get isOwned => grade >= 1;

  /// A grade-1 suit has no modification slot at all — the single most common
  /// beginner surprise.
  bool get canBeModified => grade >= 2;

  /// Grade 2 unlocks one slot, grade 5 unlocks four.
  int get modificationSlots => grade <= 1 ? 0 : grade - 1;

  int get freeModificationSlots =>
      (modificationSlots - installedModificationIds.length).clamp(0, 4);

  @override
  List<Object?> get props => <Object?>[type, grade, installedModificationIds];
}
