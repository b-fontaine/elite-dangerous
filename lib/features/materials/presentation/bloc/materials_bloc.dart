import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/blueprint.dart';
import '../../domain/entities/material_catalog.dart';
import '../../domain/entities/material_plan.dart';
import '../../domain/usecases/material_usecases.dart';

part 'materials_event.dart';
part 'materials_state.dart';

/// Holds what the commander is working towards, and what is still missing.
///
/// The inventory is pushed in rather than watched here: it belongs to the
/// commander dossier, which the cockpit already provides to every detail page,
/// and subscribing to it twice would make two screens disagree about the same
/// numbers.
@injectable
class MaterialsBloc extends Bloc<MaterialsEvent, MaterialsState> {
  MaterialsBloc(this._getPlans) : super(const MaterialsInitial()) {
    on<MaterialsInventoryChanged>(_onInventoryChanged);
    on<MaterialsBlueprintGradeChanged>(_onGradeChanged);
  }

  final GetMaterialPlans _getPlans;

  MaterialPlanRequest _request = const MaterialPlanRequest();

  Future<void> _onInventoryChanged(
    MaterialsInventoryChanged event,
    Emitter<MaterialsState> emit,
  ) async {
    _request = MaterialPlanRequest(
      inventory: event.inventory,
      suitId: event.suitId,
      suitGrade: event.suitGrade,
      blueprintStartGrades: _request.blueprintStartGrades,
    );
    await _recompute(emit, showLoading: state is! MaterialsReady);
  }

  Future<void> _onGradeChanged(
    MaterialsBlueprintGradeChanged event,
    Emitter<MaterialsState> emit,
  ) async {
    _request = MaterialPlanRequest(
      inventory: _request.inventory,
      suitId: _request.suitId,
      suitGrade: _request.suitGrade,
      blueprintStartGrades: <String, int>{
        ..._request.blueprintStartGrades,
        event.blueprintId: event.fromGrade,
      },
    );
    await _recompute(emit, showLoading: false);
  }

  Future<void> _recompute(
    Emitter<MaterialsState> emit, {
    required bool showLoading,
  }) async {
    if (showLoading) {
      emit(const MaterialsLoading());
    }
    final Result<MaterialPlanBoard> result = await _getPlans(_request);
    emit(
      result.fold(
        onSuccess: (MaterialPlanBoard board) => MaterialsReady(
          board: board,
          startGrades: _request.blueprintStartGrades,
        ),
        onFailure: MaterialsError.new,
      ),
    );
  }
}
