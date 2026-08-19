import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/time/clock.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/exobiology_activity.dart';
import '../../domain/entities/journal_event.dart';
import '../../domain/repositories/journal_repository.dart';
import '../../domain/services/exobiology_activity_aggregator.dart';
import '../../domain/usecases/journal_usecases.dart';

part 'journal_event_ui.dart';
part 'journal_state.dart';

@injectable
class JournalBloc extends Bloc<JournalUiEvent, JournalState> {
  JournalBloc(
    this._watchEvents,
    this._sync,
    this._import,
    this._suggestedDirectories,
    this._aggregator,
    this._clock,
  ) : super(const JournalState()) {
    on<JournalWatchStarted>(_onWatchStarted);
    on<JournalEventsUpdated>(_onEventsUpdated);
    on<JournalSyncRequested>(_onSyncRequested);
    on<JournalImportRequested>(_onImportRequested);
    on<JournalFilterChanged>(_onFilterChanged);
  }

  final WatchJournalEvents _watchEvents;
  final SyncJournalFromCompanionApi _sync;
  final ImportJournalDirectory _import;
  final GetSuggestedJournalDirectories _suggestedDirectories;
  final ExobiologyActivityAggregator _aggregator;
  final Clock _clock;

  StreamSubscription<List<JournalEvent>>? _subscription;

  Future<void> _onWatchStarted(
    JournalWatchStarted event,
    Emitter<JournalState> emit,
  ) async {
    final Result<List<String>> directories =
        await _suggestedDirectories(const NoParams());
    emit(
      state.copyWith(
        suggestedDirectories: directories.valueOrNull ?? const <String>[],
      ),
    );
    await _subscription?.cancel();
    _subscription = _watchEvents(const NoParams()).listen(
      (List<JournalEvent> events) => add(JournalEventsUpdated(events)),
    );
  }

  void _onEventsUpdated(
    JournalEventsUpdated event,
    Emitter<JournalState> emit,
  ) {
    emit(
      state.copyWith(
        events: event.events,
        activity: _aggregator.aggregate(event.events),
        isLoading: false,
      ),
    );
  }

  Future<void> _onSyncRequested(
    JournalSyncRequested event,
    Emitter<JournalState> emit,
  ) async {
    emit(state.copyWith(isSyncing: true, clearFailure: true, clearReport: true));
    final Result<JournalSyncReport> result = await _sync(
      JournalSyncRange.lastDays(event.days, now: _clock.now()),
    );
    emit(
      result.fold(
        onSuccess: (JournalSyncReport report) =>
            state.copyWith(isSyncing: false, lastReport: report),
        onFailure: (Failure failure) =>
            state.copyWith(isSyncing: false, failure: failure),
      ),
    );
  }

  Future<void> _onImportRequested(
    JournalImportRequested event,
    Emitter<JournalState> emit,
  ) async {
    emit(state.copyWith(isSyncing: true, clearFailure: true, clearReport: true));
    final Result<JournalSyncReport> result = await _import(event.directory);
    emit(
      result.fold(
        onSuccess: (JournalSyncReport report) =>
            state.copyWith(isSyncing: false, lastReport: report),
        onFailure: (Failure failure) =>
            state.copyWith(isSyncing: false, failure: failure),
      ),
    );
  }

  void _onFilterChanged(
    JournalFilterChanged event,
    Emitter<JournalState> emit,
  ) {
    emit(state.copyWith(filter: event.filter));
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
