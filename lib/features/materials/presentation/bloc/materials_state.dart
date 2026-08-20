part of 'materials_bloc.dart';

sealed class MaterialsState extends Equatable {
  const MaterialsState();

  @override
  List<Object?> get props => const <Object?>[];
}

final class MaterialsInitial extends MaterialsState {
  const MaterialsInitial();
}

final class MaterialsLoading extends MaterialsState {
  const MaterialsLoading();
}

final class MaterialsReady extends MaterialsState {
  const MaterialsReady({required this.board, this.startGrades = const {}});

  final MaterialPlanBoard board;

  /// Blueprint id to the grade the commander says is already installed.
  final Map<String, int> startGrades;

  MaterialCatalog get catalog => board.catalog;

  List<Blueprint> get blueprints => board.catalog.blueprints;

  MaterialPlan? planFor(String blueprintId) => board.blueprintPlans[blueprintId];

  MaterialPlan? experimentalPlan(String effectId) =>
      board.experimentalPlans[effectId];

  int startGradeFor(String blueprintId) => startGrades[blueprintId] ?? 0;

  /// Goals with something still missing, most urgent first.
  ///
  /// Ordered by how *few* units remain rather than how many: the one closest
  /// to done is the one worth finishing, and a blueprint needing five units is
  /// a better next trip than one needing forty.
  List<Blueprint> get unfinished {
    final List<Blueprint> pending = <Blueprint>[
      for (final Blueprint blueprint in blueprints)
        if (planFor(blueprint.id)?.isComplete == false) blueprint,
    ];
    pending.sort((Blueprint a, Blueprint b) {
      final int left = planFor(a.id)?.missingTotal ?? 0;
      final int right = planFor(b.id)?.missingTotal ?? 0;
      return left == right ? a.name.compareTo(b.name) : left.compareTo(right);
    });
    return pending;
  }

  @override
  List<Object?> get props => <Object?>[board, startGrades];
}

final class MaterialsError extends MaterialsState {
  const MaterialsError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => <Object?>[failure];
}
