import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/filtered_route.dart';
import '../../domain/entities/route_plan.dart';
import '../../domain/entities/route_request.dart';
import '../../domain/entities/session_pace.dart';
import '../../domain/services/route_duration_estimator.dart';
import '../../domain/usecases/route_planning_usecases.dart';
import '../../domain/usecases/route_tracking_usecases.dart';

part 'route_planner_event.dart';
part 'route_planner_state.dart';

/// Drives the compose screen, from a form to a route worth flying.
///
/// The order of operations is the whole point, and it is not the obvious one:
///
/// 1. **Measure the pace first**, from the journal. It is free, it is local,
///    and it turns "two hours" into a system count worth asking Spansh for.
/// 2. **Ask Spansh once.** Plotting is the most expensive thing this app does
///    to a service that publishes no rate limit, so it happens on a press and
///    never on its own.
/// 3. **Subtract what is already done**, locally. Spansh has no exclusion
///    parameter and silently drops one sent anyway.
/// 4. **Then price the time**, on the filtered route — because the estimate
///    should describe the work left, not the work the galaxy holds.
@injectable
class RoutePlannerBloc extends Bloc<RoutePlannerEvent, RoutePlannerState> {
  RoutePlannerBloc(
    this._plan,
    this._filter,
    this._measurePace,
    this._estimator,
    this._start,
    this._canPlan,
  ) : super(const RoutePlannerState()) {
    on<RoutePlannerStarted>(_onStarted);
    on<RoutePlannerFormChanged>(_onFormChanged);
    on<RoutePlannerComputed>(_onComputed);
    on<RoutePlannerAccepted>(_onAccepted);
    on<RoutePlannerDiscarded>(_onDiscarded);
  }

  final PlanRoute _plan;
  final FilterPlannedRoute _filter;
  final MeasureSessionPace _measurePace;
  final RouteDurationEstimator _estimator;
  final StartRoute _start;
  final CanPlanRoutes _canPlan;

  Future<void> _onStarted(
    RoutePlannerStarted event,
    Emitter<RoutePlannerState> emit,
  ) async {
    final Result<SessionPace> pace = await _measurePace(const NoParams());
    final SessionPace measured = pace.valueOrNull ?? const SessionPace();

    emit(
      state.copyWith(
        pace: measured,
        isSupported: _canPlan(),
        // The form opens on a system count the commander's own pace says fits
        // the evening, rather than on an arbitrary default they have to guess
        // their way out of.
        request: state.request.copyWith(
          fromSystem: event.currentSystem ?? state.request.fromSystem,
          jumpRangeLy: event.jumpRangeLy ?? state.request.jumpRangeLy,
          maxSystems: _estimator.suggestedSystemCount(measured, state.available),
        ),
        isLoading: false,
      ),
    );
  }

  void _onFormChanged(
    RoutePlannerFormChanged event,
    Emitter<RoutePlannerState> emit,
  ) {
    final Duration available = event.available ?? state.available;
    emit(
      state.copyWith(
        request: event.request ?? state.request,
        available: available,
        // Changing the evening's length re-suggests a size, unless the
        // commander has taken the wheel and set one themselves.
        suggestedSystems:
            _estimator.suggestedSystemCount(state.pace, available),
      ),
    );
  }

  Future<void> _onComputed(
    RoutePlannerComputed event,
    Emitter<RoutePlannerState> emit,
  ) async {
    emit(state.copyWith(isComputing: true, clearFailure: true));

    final Result<RoutePlan> plotted = await _plan(state.request);

    await plotted.fold(
      onSuccess: (RoutePlan plan) async {
        final Result<FilteredRoute> filtered = await _filter(plan);
        final FilteredRoute route = filtered.valueOrNull ??
            FilteredRoute(original: plan, filtered: plan);
        emit(
          state.copyWith(
            route: route,
            reach: _estimator.reach(route.filtered, state.pace, state.available),
            isComputing: false,
          ),
        );
      },
      onFailure: (Failure failure) async =>
          emit(state.copyWith(isComputing: false, failure: failure)),
    );
  }

  Future<void> _onAccepted(
    RoutePlannerAccepted event,
    Emitter<RoutePlannerState> emit,
  ) async {
    final FilteredRoute? route = state.route;
    if (route == null) {
      return;
    }
    // The filtered route is what gets flown, not the original: keeping the
    // already-done stops would put the commander back on work they finished.
    final Result<RoutePlan> started = await _start(route.filtered);
    emit(
      started.fold(
        onSuccess: (_) => state.copyWith(isStarted: true),
        onFailure: (Failure failure) => state.copyWith(failure: failure),
      ),
    );
  }

  void _onDiscarded(
    RoutePlannerDiscarded event,
    Emitter<RoutePlannerState> emit,
  ) =>
      emit(state.copyWith(clearRoute: true, clearFailure: true));
}
