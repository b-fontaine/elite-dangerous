part of 'route_bridge_bloc.dart';

sealed class RouteBridgeEvent extends Equatable {
  const RouteBridgeEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

class RouteBridgeStarted extends RouteBridgeEvent {
  const RouteBridgeStarted();
}

/// Switching the sharing on, or off. Never automatic: a port opens because the
/// commander asked for it.
class RouteBridgeHostToggled extends RouteBridgeEvent {
  const RouteBridgeHostToggled();
}

class RouteBridgePaired extends RouteBridgeEvent {
  const RouteBridgePaired(this.code);

  /// What the game machine printed, as typed on this device.
  final String code;

  @override
  List<Object?> get props => <Object?>[code];
}

class RouteBridgeUnpaired extends RouteBridgeEvent {
  const RouteBridgeUnpaired();
}
