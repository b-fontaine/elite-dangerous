part of 'route_planner_bloc.dart';

sealed class RoutePlannerEvent extends Equatable {
  const RoutePlannerEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

/// Opening the form, pre-filled from what the journal already knows.
class RoutePlannerStarted extends RoutePlannerEvent {
  const RoutePlannerStarted({this.currentSystem, this.jumpRangeLy});

  /// Where the commander is, from the journal. Null leaves the default.
  final String? currentSystem;

  /// Laden jump range, from `Loadout`. The commander can still correct it.
  final double? jumpRangeLy;

  @override
  List<Object?> get props => <Object?>[currentSystem, jumpRangeLy];
}

class RoutePlannerFormChanged extends RoutePlannerEvent {
  const RoutePlannerFormChanged({this.request, this.available});

  final RouteRequest? request;

  /// How long the commander says they have tonight.
  final Duration? available;

  @override
  List<Object?> get props => <Object?>[request, available];
}

/// Asking Spansh. Never automatic: this is the most expensive thing the app
/// does to a service that publishes no rate limit.
class RoutePlannerComputed extends RoutePlannerEvent {
  const RoutePlannerComputed();
}

/// Making the computed route the one being flown.
class RoutePlannerAccepted extends RoutePlannerEvent {
  const RoutePlannerAccepted();
}

/// Throwing the proposal away and going back to the form.
class RoutePlannerDiscarded extends RoutePlannerEvent {
  const RoutePlannerDiscarded();
}
