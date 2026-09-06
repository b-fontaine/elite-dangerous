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
  const RouteTrackingRefreshed({this.silent = false});

  /// Whether to re-read without showing a spinner.
  ///
  /// True for the timer on a second screen: a poll every ten seconds that
  /// replaced the screen with "Lecture de la route…" would take the retry
  /// button out from under the commander's finger every other second.
  final bool silent;

  @override
  List<Object?> get props => <Object?>[silent];
}

/// Putting the route away. It stays in the archive.
class RouteTrackingAbandoned extends RouteTrackingEvent {
  const RouteTrackingAbandoned();
}
