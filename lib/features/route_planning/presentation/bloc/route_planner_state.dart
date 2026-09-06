part of 'route_planner_bloc.dart';

class RoutePlannerState extends Equatable {
  const RoutePlannerState({
    this.request = const RouteRequest(
      objective: RouteObjective.exobiology,
      fromSystem: 'Sol',
      jumpRangeLy: 50,
      radiusLy: 100,
      maxSystems: 5,
    ),
    this.available = const Duration(hours: 2),
    this.pace = const SessionPace(),
    this.route,
    this.reach,
    this.suggestedSystems = 5,
    this.isSupported = true,
    this.isLoading = true,
    this.isComputing = false,
    this.isStarted = false,
    this.failure,
  });

  final RouteRequest request;

  /// The evening, as the commander stated it. The one parameter Spansh has no
  /// notion of.
  final Duration available;

  final SessionPace pace;

  /// The proposal, once Spansh has answered and the already-done parts are out.
  final FilteredRoute? route;

  /// How far [available] gets on that route.
  final SessionReach? reach;

  final int suggestedSystems;

  /// False on the web, where Spansh cannot be reached at all.
  final bool isSupported;

  final bool isLoading;
  final bool isComputing;

  /// True once the route has been accepted and is the one being flown.
  final bool isStarted;

  final Failure? failure;

  bool get hasProposal => route != null;

  RoutePlannerState copyWith({
    RouteRequest? request,
    Duration? available,
    SessionPace? pace,
    FilteredRoute? route,
    SessionReach? reach,
    int? suggestedSystems,
    bool? isSupported,
    bool? isLoading,
    bool? isComputing,
    bool? isStarted,
    Failure? failure,
    bool clearRoute = false,
    bool clearFailure = false,
  }) =>
      RoutePlannerState(
        request: request ?? this.request,
        available: available ?? this.available,
        pace: pace ?? this.pace,
        route: clearRoute ? null : (route ?? this.route),
        reach: clearRoute ? null : (reach ?? this.reach),
        suggestedSystems: suggestedSystems ?? this.suggestedSystems,
        isSupported: isSupported ?? this.isSupported,
        isLoading: isLoading ?? this.isLoading,
        isComputing: isComputing ?? this.isComputing,
        isStarted: isStarted ?? this.isStarted,
        failure: clearFailure ? null : (failure ?? this.failure),
      );

  @override
  List<Object?> get props => <Object?>[
        request,
        available,
        pace,
        route,
        reach,
        suggestedSystems,
        isSupported,
        isLoading,
        isComputing,
        isStarted,
        failure,
      ];
}
