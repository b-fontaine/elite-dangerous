import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/app_settings.dart';
import '../../domain/usecases/settings_usecases.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(this._watch, this._save, this._reset)
      : super(const SettingsState()) {
    on<SettingsWatchStarted>(_onWatchStarted);
    on<SettingsUpdated>(_onUpdated);
    on<SettingsChanged>(_onChanged);
    on<SettingsLocalDataResetRequested>(_onResetRequested);
  }

  final WatchSettings _watch;
  final SaveSettings _save;
  final ResetLocalData _reset;

  StreamSubscription<AppSettings>? _subscription;

  Future<void> _onWatchStarted(
    SettingsWatchStarted event,
    Emitter<SettingsState> emit,
  ) async {
    await _subscription?.cancel();
    _subscription = _watch(const NoParams())
        .listen((AppSettings settings) => add(SettingsUpdated(settings)));
  }

  void _onUpdated(SettingsUpdated event, Emitter<SettingsState> emit) {
    emit(state.copyWith(settings: event.settings, isLoading: false));
  }

  Future<void> _onChanged(
    SettingsChanged event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(settings: event.settings));
    final Result<void> result = await _save(event.settings);
    if (result.failureOrNull case final Failure failure) {
      emit(state.copyWith(failure: failure));
    }
  }

  Future<void> _onResetRequested(
    SettingsLocalDataResetRequested event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(isResetting: true, clearFlags: true));
    final Result<void> result = await _reset(const NoParams());
    emit(
      result.fold(
        onSuccess: (_) => state.copyWith(isResetting: false, didReset: true),
        onFailure: (Failure failure) =>
            state.copyWith(isResetting: false, failure: failure),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
