import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/roadmap.dart';
import '../../domain/usecases/exobiology_usecases.dart';

part 'roadmap_event.dart';
part 'roadmap_state.dart';

/// Drives the exobiology roadmap screen.
///
/// The roadmap is derived, never stored: the bloc listens to the commander's
/// state and lets the engine recompute. Ticking a step therefore writes to the
/// progress repository and the new roadmap comes back through the stream —
/// there is deliberately no local mutation of the displayed plan.
@injectable
class RoadmapBloc extends Bloc<RoadmapEvent, RoadmapState> {
  RoadmapBloc(this._watchRoadmap, this._setStepState)
      : super(const RoadmapInitial()) {
    on<RoadmapWatchStarted>(_onWatchStarted);
    on<RoadmapUpdated>(_onUpdated);
    on<RoadmapFailed>(_onFailed);
    on<RoadmapStepCompletionToggled>(_onCompletionToggled);
    on<RoadmapStepDismissalToggled>(_onDismissalToggled);
    on<RoadmapFilterChanged>(_onFilterChanged);
  }

  final WatchExobiologyRoadmap _watchRoadmap;
  final SetRoadmapStepState _setStepState;

  StreamSubscription<Roadmap>? _subscription;

  Future<void> _onWatchStarted(
    RoadmapWatchStarted event,
    Emitter<RoadmapState> emit,
  ) async {
    emit(const RoadmapLoading());
    await _subscription?.cancel();
    _subscription = _watchRoadmap(const NoParams()).listen(
      (Roadmap roadmap) => add(RoadmapUpdated(roadmap)),
      onError: (Object error) => add(
        RoadmapFailed(UnexpectedFailure(message: error.toString())),
      ),
    );
  }

  void _onUpdated(RoadmapUpdated event, Emitter<RoadmapState> emit) {
    final RoadmapState current = state;
    emit(
      RoadmapReady(
        roadmap: event.roadmap,
        filter: current is RoadmapReady ? current.filter : RoadmapFilter.todo,
      ),
    );
  }

  void _onFailed(RoadmapFailed event, Emitter<RoadmapState> emit) {
    emit(RoadmapError(event.failure));
  }

  Future<void> _onCompletionToggled(
    RoadmapStepCompletionToggled event,
    Emitter<RoadmapState> emit,
  ) async {
    final Result<void> result = await _setStepState(
      RoadmapStepStateInput(stepId: event.stepId, completed: event.completed),
    );
    if (result.failureOrNull case final Failure failure) {
      emit(RoadmapError(failure));
    }
  }

  Future<void> _onDismissalToggled(
    RoadmapStepDismissalToggled event,
    Emitter<RoadmapState> emit,
  ) async {
    final Result<void> result = await _setStepState(
      RoadmapStepStateInput(stepId: event.stepId, dismissed: event.dismissed),
    );
    if (result.failureOrNull case final Failure failure) {
      emit(RoadmapError(failure));
    }
  }

  void _onFilterChanged(
    RoadmapFilterChanged event,
    Emitter<RoadmapState> emit,
  ) {
    final RoadmapState current = state;
    if (current is RoadmapReady) {
      emit(current.copyWith(filter: event.filter));
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
