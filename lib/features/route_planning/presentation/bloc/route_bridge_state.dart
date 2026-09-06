part of 'route_bridge_bloc.dart';

class RouteBridgeState extends Equatable {
  const RouteBridgeState({
    this.isSupported = true,
    this.isHosting = false,
    this.hostPairing,
    this.clientPairing,
    this.isLoading = true,
    this.isBusy = false,
    this.failure,
  });

  /// False on the web, which cannot open a socket.
  final bool isSupported;

  final bool isHosting;

  /// What to type on the other device, while hosting.
  final BridgePairing? hostPairing;

  /// The machine this device reads from, if it is the second screen.
  final BridgePairing? clientPairing;

  final bool isLoading;
  final bool isBusy;
  final Failure? failure;

  bool get isSecondScreen => clientPairing != null;

  RouteBridgeState copyWith({
    bool? isSupported,
    bool? isHosting,
    BridgePairing? hostPairing,
    BridgePairing? clientPairing,
    bool? isLoading,
    bool? isBusy,
    Failure? failure,
    bool clearHostPairing = false,
    bool clearClientPairing = false,
    bool clearFailure = false,
  }) =>
      RouteBridgeState(
        isSupported: isSupported ?? this.isSupported,
        isHosting: isHosting ?? this.isHosting,
        hostPairing: clearHostPairing ? null : (hostPairing ?? this.hostPairing),
        clientPairing:
            clearClientPairing ? null : (clientPairing ?? this.clientPairing),
        isLoading: isLoading ?? this.isLoading,
        isBusy: isBusy ?? this.isBusy,
        failure: clearFailure ? null : (failure ?? this.failure),
      );

  @override
  List<Object?> get props => <Object?>[
        isSupported,
        isHosting,
        hostPairing?.code,
        clientPairing?.code,
        isLoading,
        isBusy,
        failure,
      ];
}
