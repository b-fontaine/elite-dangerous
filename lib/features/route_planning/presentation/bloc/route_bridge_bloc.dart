import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../domain/repositories/route_bridge.dart';

part 'route_bridge_event.dart';
part 'route_bridge_state.dart';

/// Drives the sharing screen, on both sides of the bridge.
///
/// One bloc rather than two because a machine can be either — the desktop that
/// reads the game files, or the tablet that reads the desktop — and which one
/// it is today is not worth making the commander declare.
@injectable
class RouteBridgeBloc extends Bloc<RouteBridgeEvent, RouteBridgeState> {
  RouteBridgeBloc(this._host, this._client)
      : super(const RouteBridgeState()) {
    on<RouteBridgeStarted>(_onStarted);
    on<RouteBridgeHostToggled>(_onHostToggled);
    on<RouteBridgePaired>(_onPaired);
    on<RouteBridgeUnpaired>(_onUnpaired);
  }

  final RouteBridgeHost _host;
  final RouteBridgeClient _client;

  Future<void> _onStarted(
    RouteBridgeStarted event,
    Emitter<RouteBridgeState> emit,
  ) async {
    emit(
      state.copyWith(
        isSupported: _host.isSupported,
        isHosting: _host.isRunning,
        hostPairing: _host.pairing,
        clientPairing: await _client.pairing(),
        isLoading: false,
      ),
    );
  }

  Future<void> _onHostToggled(
    RouteBridgeHostToggled event,
    Emitter<RouteBridgeState> emit,
  ) async {
    if (_host.isRunning) {
      await _host.stop();
      emit(state.copyWith(isHosting: false, clearHostPairing: true));
      return;
    }

    emit(state.copyWith(isBusy: true, clearFailure: true));
    final Result<BridgePairing> started = await _host.start();
    emit(
      started.fold(
        onSuccess: (BridgePairing pairing) => state.copyWith(
          isHosting: true,
          hostPairing: pairing,
          isBusy: false,
        ),
        onFailure: (Failure failure) =>
            state.copyWith(isBusy: false, failure: failure),
      ),
    );
  }

  Future<void> _onPaired(
    RouteBridgePaired event,
    Emitter<RouteBridgeState> emit,
  ) async {
    final BridgePairing? pairing = BridgePairing.parse(event.code);
    if (pairing == null) {
      emit(
        state.copyWith(
          failure: const ParsingFailure(
            message: 'Code d\'appairage illisible. Il ressemble à '
                '192.168.1.24:8420/k7m2xq9p.',
          ),
        ),
      );
      return;
    }
    await _client.pair(pairing);
    emit(state.copyWith(clientPairing: pairing, clearFailure: true));
  }

  Future<void> _onUnpaired(
    RouteBridgeUnpaired event,
    Emitter<RouteBridgeState> emit,
  ) async {
    await _client.unpair();
    emit(state.copyWith(clearClientPairing: true));
  }
}
