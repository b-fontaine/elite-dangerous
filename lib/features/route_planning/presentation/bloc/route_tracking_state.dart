part of 'route_tracking_bloc.dart';

class RouteTrackingState extends Equatable {
  const RouteTrackingState({
    this.progress,
    this.pace = const SessionPace(),
    this.remaining,
    this.isLoading = true,
    this.isRefreshing = false,
    this.failure,
  });

  /// Null when no route is being flown, which is an ordinary state and not an
  /// error: it is what the screen shows before the first route is composed.
  final RouteProgress? progress;

  final SessionPace pace;

  /// What is left to do, at this commander's own measured pace.
  final RouteEstimate? remaining;

  final bool isLoading;
  final bool isRefreshing;
  final Failure? failure;

  bool get hasRoute => progress != null;

  RoutePlan? get plan => progress?.plan;

  RouteTrackingState copyWith({
    RouteProgress? progress,
    SessionPace? pace,
    RouteEstimate? remaining,
    bool? isLoading,
    bool? isRefreshing,
    Failure? failure,
  }) =>
      RouteTrackingState(
        progress: progress ?? this.progress,
        pace: pace ?? this.pace,
        remaining: remaining ?? this.remaining,
        isLoading: isLoading ?? this.isLoading,
        isRefreshing: isRefreshing ?? this.isRefreshing,
        failure: failure,
      );

  @override
  List<Object?> get props => <Object?>[
        progress,
        pace,
        remaining,
        isLoading,
        isRefreshing,
        failure,
      ];
}
