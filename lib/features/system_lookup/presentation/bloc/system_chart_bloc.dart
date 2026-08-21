import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/body_landmarks.dart';
import '../../domain/entities/charted_system.dart';
import '../../domain/usecases/system_lookup_usecases.dart';

part 'system_chart_event.dart';
part 'system_chart_state.dart';

/// Drives the one place in this app that talks to a third party.
///
/// The rule it enforces is the one the whole feature is built on: **a request
/// leaves this device only when the commander asks a question.** Arriving in a
/// system loads whatever is already cached — that costs nothing — and stops
/// there. Nothing prefetches, nothing polls, and jumping through twenty
/// systems on the way to a nebula sends exactly zero requests.
@injectable
class SystemChartBloc extends Bloc<SystemChartEvent, SystemChartState> {
  SystemChartBloc(
    this._lookup,
    this._landmarks,
    this._cached,
    CanLookUpSystems supported,
  ) : super(SystemChartState(isSupported: supported())) {
    on<SystemChartTargetChanged>(_onTargetChanged);
    on<SystemChartRequested>(_onRequested);
    on<SystemChartBodyRequested>(_onBodyRequested);
  }

  final LookupSystem _lookup;
  final LookupBodyLandmarks _landmarks;
  final ReadCachedSystem _cached;

  Future<void> _onTargetChanged(
    SystemChartTargetChanged event,
    Emitter<SystemChartState> emit,
  ) async {
    if (event.id64 == state.id64) {
      return;
    }

    // A new system means everything held about the old one is about somewhere
    // else. Keeping the bodies would show a commander who just jumped the
    // species of the system they left.
    emit(
      SystemChartState(
        isSupported: state.isSupported,
        id64: event.id64,
        systemName: event.systemName,
      ),
    );

    final int? id64 = event.id64;
    if (id64 == null || !state.isSupported) {
      return;
    }

    final ChartedSystem? cached = await _cached(id64);
    if (cached != null && id64 == state.id64) {
      emit(state.copyWith(system: cached));
    }
  }

  Future<void> _onRequested(
    SystemChartRequested event,
    Emitter<SystemChartState> emit,
  ) async {
    final int? id64 = state.id64;
    if (id64 == null || state.isLoading) {
      return;
    }

    emit(state.copyWith(isLoading: true, clearFailure: true));

    final Result<ChartedSystem> result = await _lookup(
      SystemLookupInput(id64: id64, refresh: event.refresh),
    );

    if (id64 != state.id64) {
      // The commander jumped while the request was in flight; this answer is
      // about the previous system and must not be shown as the current one.
      return;
    }

    emit(
      result.fold(
        onSuccess: (ChartedSystem system) =>
            state.copyWith(system: system, isLoading: false, clearFailure: true),
        // The previously held system stays on screen: a failed refresh should
        // not empty a panel that was answering the commander's question.
        onFailure: (Failure failure) =>
            state.copyWith(isLoading: false, failure: failure),
      ),
    );
  }

  Future<void> _onBodyRequested(
    SystemChartBodyRequested event,
    Emitter<SystemChartState> emit,
  ) async {
    final ChartedBody body = event.body;
    // Two taps in the same frame reach here in order, the second one after the
    // first has emitted — verified by test rather than assumed, because the
    // opposite would have needed a guard outside the state.
    if (state.pendingBodies.contains(body.id64)) {
      return;
    }

    emit(
      state.copyWith(
        pendingBodies: <int>{...state.pendingBodies, body.id64},
        clearFailure: true,
      ),
    );

    final Result<BodyLandmarks> result = await _landmarks(
      BodyLandmarksInput(
        bodyId64: body.id64,
        signalsUpdatedAt: body.signalsUpdatedAt,
        refresh: event.refresh,
      ),
    );

    final Set<int> pending = <int>{...state.pendingBodies}..remove(body.id64);

    emit(
      result.fold(
        onSuccess: (BodyLandmarks landmarks) => state.copyWith(
          pendingBodies: pending,
          landmarks: <int, BodyLandmarks>{
            ...state.landmarks,
            body.id64: landmarks,
          },
        ),
        onFailure: (Failure failure) =>
            state.copyWith(pendingBodies: pending, failure: failure),
      ),
    );
  }
}
