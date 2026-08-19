import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/commander.dart';
import '../../domain/entities/manual_commander_overrides.dart';
import '../../domain/usecases/commander_usecases.dart';

part 'commander_event.dart';
part 'commander_state.dart';

@injectable
class CommanderBloc extends Bloc<CommanderEvent, CommanderState> {
  CommanderBloc(
    this._watchCommander,
    this._refreshProfile,
    this._getOverrides,
    this._saveOverrides,
  ) : super(const CommanderInitial()) {
    on<CommanderWatchStarted>(_onWatchStarted);
    on<CommanderUpdated>(_onUpdated);
    on<CommanderRefreshRequested>(_onRefreshRequested);
    on<CommanderOverridesSubmitted>(_onOverridesSubmitted);
  }

  final WatchCommander _watchCommander;
  final RefreshCommanderProfile _refreshProfile;
  final GetManualOverrides _getOverrides;
  final SaveManualOverrides _saveOverrides;

  StreamSubscription<Commander>? _subscription;

  Future<void> _onWatchStarted(
    CommanderWatchStarted event,
    Emitter<CommanderState> emit,
  ) async {
    emit(const CommanderLoading());
    final Result<ManualCommanderOverrides> overrides =
        await _getOverrides(const NoParams());
    await _subscription?.cancel();
    _subscription = _watchCommander(const NoParams()).listen(
      (Commander commander) => add(
        CommanderUpdated(
          commander,
          overrides.valueOrNull ?? const ManualCommanderOverrides.empty(),
        ),
      ),
    );
  }

  void _onUpdated(CommanderUpdated event, Emitter<CommanderState> emit) {
    emit(
      CommanderReady(
        commander: event.commander,
        overrides: event.overrides,
      ),
    );
  }

  Future<void> _onRefreshRequested(
    CommanderRefreshRequested event,
    Emitter<CommanderState> emit,
  ) async {
    final CommanderState current = state;
    if (current is CommanderReady) {
      emit(current.copyWith(isRefreshing: true));
    }
    final Result<Commander> result = await _refreshProfile(const NoParams());
    if (result.failureOrNull case final Failure failure) {
      if (current is CommanderReady) {
        emit(current.copyWith(isRefreshing: false, failure: failure));
      } else {
        emit(CommanderError(failure));
      }
    }
    // On success the stream pushes the new profile through CommanderUpdated.
  }

  Future<void> _onOverridesSubmitted(
    CommanderOverridesSubmitted event,
    Emitter<CommanderState> emit,
  ) async {
    final Result<void> result = await _saveOverrides(event.overrides);
    final CommanderState current = state;
    if (result.failureOrNull case final Failure failure) {
      emit(
        current is CommanderReady
            ? current.copyWith(failure: failure)
            : CommanderError(failure),
      );
      return;
    }
    if (current is CommanderReady) {
      emit(current.copyWith(overrides: event.overrides, clearFailure: true));
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
