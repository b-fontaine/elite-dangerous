import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/blueprint.dart';
import '../entities/material_catalog.dart';
import '../entities/material_plan.dart';
import '../repositories/material_catalog_repository.dart';
import '../services/material_planner.dart';

/// What the materials screen asks for.
class MaterialPlanRequest extends Equatable {
  const MaterialPlanRequest({
    this.inventory = const <String, int>{},
    this.suitId = 'artemis',
    this.suitGrade,
    this.blueprintStartGrades = const <String, int>{},
  });

  /// Everything the commander holds, on foot and in the ship, keyed by name or
  /// by journal symbol — [MaterialCatalog.resolve] takes either.
  final Map<String, int> inventory;

  final String suitId;

  /// The grade the suit is at now. Null when the app does not know, in which
  /// case no suit plan is produced rather than a wrong one.
  final int? suitGrade;

  /// Blueprint id to the grade already installed. Absent means "none yet".
  final Map<String, int> blueprintStartGrades;

  @override
  List<Object?> get props =>
      <Object?>[inventory, suitId, suitGrade, blueprintStartGrades];
}

/// The catalogue plus every plan the screen needs, computed together.
class MaterialPlanBoard extends Equatable {
  const MaterialPlanBoard({
    required this.catalog,
    required this.blueprintPlans,
    this.experimentalPlans = const <String, MaterialPlan>{},
    this.suitPlan,
    this.suitStep,
  });

  final MaterialCatalog catalog;

  /// One plan per blueprint, in the catalogue's order.
  final Map<String, MaterialPlan> blueprintPlans;

  /// One plan per experimental effect, keyed by its id. Applied once, so these
  /// count no rolls.
  final Map<String, MaterialPlan> experimentalPlans;

  /// The next step up the suit ladder, when the app knows the current grade.
  final MaterialPlan? suitPlan;
  final SuitGradeStep? suitStep;

  @override
  List<Object?> get props => <Object?>[
        catalog,
        blueprintPlans,
        experimentalPlans,
        suitPlan,
        suitStep,
      ];
}

/// Loads the bundled catalogue and measures every goal against the inventory.
///
/// One use case rather than one per goal: the plans share a catalogue and a
/// stock count, and computing them apart would parse the same asset five times
/// to answer the same question.
@injectable
class GetMaterialPlans extends UseCase<MaterialPlanBoard, MaterialPlanRequest> {
  const GetMaterialPlans(this._repository, this._planner);

  final MaterialCatalogRepository _repository;
  final MaterialPlanner _planner;

  @override
  Future<Result<MaterialPlanBoard>> call(MaterialPlanRequest input) async {
    final Result<MaterialCatalog> loaded = await _repository.loadCatalog();
    return loaded.map((MaterialCatalog catalog) {
      final Map<String, MaterialPlan> plans = <String, MaterialPlan>{
        for (final Blueprint blueprint in catalog.blueprints)
          blueprint.id: _planner.planBlueprint(
            catalog: catalog,
            blueprint: blueprint,
            fromGrade: input.blueprintStartGrades[blueprint.id] ?? 0,
            toGrade: blueprint.maxGrade,
            owned: input.inventory,
          ),
      };

      final Map<String, MaterialPlan> experimentals = <String, MaterialPlan>{
        for (final Blueprint blueprint in catalog.blueprints)
          for (final ExperimentalEffect effect in blueprint.experimentals)
            effect.id: _planner.planExperimental(
              catalog: catalog,
              effect: effect,
              owned: input.inventory,
            ),
      };

      final SuitUpgradePath? suit = catalog.suit(input.suitId);
      final SuitGradeStep? step =
          input.suitGrade == null ? null : suit?.stepFrom(input.suitGrade!);

      return MaterialPlanBoard(
        catalog: catalog,
        blueprintPlans: plans,
        experimentalPlans: experimentals,
        suitStep: step,
        suitPlan: suit == null || step == null
            ? null
            : _planner.planSuit(
                catalog: catalog,
                suit: suit,
                fromGrade: step.fromGrade,
                toGrade: step.toGrade,
                owned: input.inventory,
              ),
      );
    });
  }
}
