import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../journal/domain/entities/journal_session_state.dart';
import '../../../journal/domain/usecases/journal_usecases.dart';
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
    this._watchSession,
  ) : super(const CommanderInitial()) {
    on<CommanderWatchStarted>(_onWatchStarted);
    on<CommanderUpdated>(_onUpdated);
    on<CommanderSessionUpdated>(_onSessionUpdated);
    on<CommanderRefreshRequested>(_onRefreshRequested);
    on<CommanderOverridesSubmitted>(_onOverridesSubmitted);
  }

  final WatchCommander _watchCommander;
  final RefreshCommanderProfile _refreshProfile;
  final GetManualOverrides _getOverrides;
  final SaveManualOverrides _saveOverrides;
  final WatchJournalSessionState _watchSession;

  StreamSubscription<Commander>? _subscription;
  StreamSubscription<JournalSessionState>? _sessionSubscription;

  /// Held so a journal arriving before the first profile is not lost: the two
  /// streams are independent and either can be first.
  JournalSessionState _session = const JournalSessionState.empty();

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

    await _sessionSubscription?.cancel();
    _sessionSubscription = _watchSession(const NoParams()).listen(
      (JournalSessionState session) => add(CommanderSessionUpdated(session)),
    );
  }

  void _onUpdated(CommanderUpdated event, Emitter<CommanderState> emit) {
    emit(
      CommanderReady(
        commander: event.commander,
        overrides: event.overrides,
        session: _session,
      ),
    );
  }

  void _onSessionUpdated(
    CommanderSessionUpdated event,
    Emitter<CommanderState> emit,
  ) {
    _session = event.session;
    final CommanderState current = state;
    if (current is CommanderReady) {
      emit(current.copyWith(session: event.session));
    }
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
    await _sessionSubscription?.cancel();
    return super.close();
  }
}
