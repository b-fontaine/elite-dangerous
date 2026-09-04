import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/route_plan.dart';
import '../../domain/entities/route_progress.dart';
import '../../domain/entities/session_pace.dart';
import '../../domain/services/route_duration_estimator.dart';
import '../../domain/usecases/route_tracking_usecases.dart';

part 'route_tracking_event.dart';
part 'route_tracking_state.dart';

/// Drives the follow screen: what is left of the route being flown.
///
/// Everything shown here is **derived**, so refreshing is cheap and idempotent:
/// the plan is read from disk, the journal is folded onto it, and the pace is
/// measured from the same journal. Nothing is written, which is why a refresh
/// can be triggered as often as the commander likes — and why a fresh import
/// corrects the picture instead of double-counting into it.
@injectable
class RouteTrackingBloc extends Bloc<RouteTrackingEvent, RouteTrackingState> {
  RouteTrackingBloc(
    this._track,
    this._measurePace,
    this._estimator,
    this._abandon,
  ) : super(const RouteTrackingState()) {
    on<RouteTrackingStarted>(_onStarted);
    on<RouteTrackingRefreshed>(_onStarted);
    on<RouteTrackingAbandoned>(_onAbandoned);
  }

  final TrackActiveRoute _track;
  final MeasureSessionPace _measurePace;
  final RouteDurationEstimator _estimator;
  final AbandonRoute _abandon;

  Future<void> _onStarted(
    RouteTrackingEvent event,
    Emitter<RouteTrackingState> emit,
  ) async {
    emit(state.copyWith(isLoading: state.progress == null, isRefreshing: true));

    final Result<RouteProgress?> tracked = await _track(const NoParams());

    await tracked.fold(
      onSuccess: (RouteProgress? progress) async {
        if (progress == null) {
          emit(const RouteTrackingState(isLoading: false));
          return;
        }
        final Result<SessionPace> pace = await _measurePace(const NoParams());
        final SessionPace measured =
            pace.valueOrNull ?? const SessionPace();
        emit(
          RouteTrackingState(
            progress: progress,
            pace: measured,
            remaining: _estimator.remaining(progress, measured),
            isLoading: false,
          ),
        );
      },
      onFailure: (Failure failure) async => emit(
        state.copyWith(
          isLoading: false,
          isRefreshing: false,
          failure: failure,
        ),
      ),
    );
  }

  Future<void> _onAbandoned(
    RouteTrackingAbandoned event,
    Emitter<RouteTrackingState> emit,
  ) async {
    await _abandon();
    // Not cleared to an error state: abandoning is a normal end, and the route
    // is archived rather than lost.
    emit(const RouteTrackingState(isLoading: false));
  }
}
