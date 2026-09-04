part of 'route_tracking_bloc.dart';

sealed class RouteTrackingEvent extends Equatable {
  const RouteTrackingEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

/// Opening the screen.
class RouteTrackingStarted extends RouteTrackingEvent {
  const RouteTrackingStarted();
}

/// Asking again — after a journal import, or on returning to the app mid-session.
class RouteTrackingRefreshed extends RouteTrackingEvent {
  const RouteTrackingRefreshed();
}

/// Putting the route away. It stays in the archive.
class RouteTrackingAbandoned extends RouteTrackingEvent {
  const RouteTrackingAbandoned();
}
