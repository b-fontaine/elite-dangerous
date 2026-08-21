import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/exobiology_activity.dart';
import '../entities/field_report.dart';
import '../entities/journal_event.dart';
import '../entities/journal_session_state.dart';
import '../entities/journal_sync_policy.dart';
import '../entities/live_game_state.dart';
import '../repositories/journal_repository.dart';
import '../repositories/live_journal_repository.dart';
import '../services/exobiology_activity_aggregator.dart';
import '../services/journal_session_aggregator.dart';
import '../services/system_survey_builder.dart';

@injectable
class WatchJournalEvents extends StreamUseCase<List<JournalEvent>, NoParams> {
  const WatchJournalEvents(this._repository);

  final JournalRepository _repository;

  @override
  Stream<List<JournalEvent>> call(NoParams input) =>
      _repository.watchEvents();
}

/// Date range for [SyncJournalFromCompanionApi].
class JournalSyncRange extends Equatable {
  const JournalSyncRange({required this.from, required this.to});

  /// The last [days] days, ending today (UTC — Frontier answers in game time).
  factory JournalSyncRange.lastDays(int days, {required DateTime now}) {
    final DateTime today = DateTime.utc(now.year, now.month, now.day);
    return JournalSyncRange(
      from: today.subtract(Duration(days: days - 1)),
      to: today,
    );
  }

  /// As far back as a single sync is allowed to walk.
  ///
  /// The walk stops on its own well before this when the days come back empty,
  /// so asking for the maximum costs the maximum only on an account that
  /// played nearly every day — and days already settled are skipped outright.
  factory JournalSyncRange.maximum({required DateTime now}) =>
      JournalSyncRange.lastDays(JournalSyncPolicy.maxSyncDays, now: now);

  final DateTime from;
  final DateTime to;

  @override
  List<Object?> get props => <Object?>[from, to];
}

@injectable
class SyncJournalFromCompanionApi
    extends UseCase<JournalSyncReport, JournalSyncRange> {
  const SyncJournalFromCompanionApi(this._repository);

  final JournalRepository _repository;

  @override
  Future<Result<JournalSyncReport>> call(JournalSyncRange input) =>
      _repository.syncFromCompanionApi(from: input.from, to: input.to);
}

@injectable
class ImportJournalDirectory extends UseCase<JournalSyncReport, String> {
  const ImportJournalDirectory(this._repository);

  final JournalRepository _repository;

  @override
  Future<Result<JournalSyncReport>> call(String input) async {
    final Result<List<JournalFileSource>> files =
        await _repository.listJournalFiles(input);
    return switch (files) {
      Success<List<JournalFileSource>>(:final List<JournalFileSource> value) =>
        _repository.importFiles(value),
      ResultFailure<List<JournalFileSource>>(:final failure) =>
        ResultFailure<JournalSyncReport>(failure),
    };
  }
}

@injectable
class GetSuggestedJournalDirectories extends UseCase<List<String>, NoParams> {
  const GetSuggestedJournalDirectories(this._repository);

  final JournalRepository _repository;

  @override
  Future<Result<List<String>>> call(NoParams input) =>
      _repository.suggestedJournalDirectories();
}

/// Folds the whole journal into the exobiology picture.
@injectable
class GetExobiologyActivity extends UseCase<ExobiologyActivity, NoParams> {
  const GetExobiologyActivity(this._repository, this._aggregator);

  final JournalRepository _repository;
  final ExobiologyActivityAggregator _aggregator;

  @override
  Future<Result<ExobiologyActivity>> call(NoParams input) async {
    final Result<List<JournalEvent>> events = await _repository.events();
    return events.map(_aggregator.aggregate);
  }
}

/// Folds the whole journal into the commander's present state.
///
/// Separate from [GetExobiologyActivity] because the two answer different
/// questions from the same lines: that one measures a career of sampling, this
/// one reads the snapshots Frontier rewrites at every session start.
@injectable
class GetJournalSessionState extends UseCase<JournalSessionState, NoParams> {
  const GetJournalSessionState(this._repository, this._aggregator);

  final JournalRepository _repository;
  final JournalSessionAggregator _aggregator;

  @override
  Future<Result<JournalSessionState>> call(NoParams input) async {
    final Result<List<JournalEvent>> events = await _repository.events();
    return events.map(_aggregator.aggregate);
  }
}

/// [GetJournalSessionState], recomputed whenever the journal changes.
@injectable
class WatchJournalSessionState
    extends StreamUseCase<JournalSessionState, NoParams> {
  const WatchJournalSessionState(this._repository, this._aggregator);

  final JournalRepository _repository;
  final JournalSessionAggregator _aggregator;

  @override
  Stream<JournalSessionState> call(NoParams input) =>
      _repository.watchEvents().map(_aggregator.aggregate);
}

/// The commander in the field: where they are, what they carry, and what is
/// left to do in the system around them.
///
/// One subscription, one pass, three answers — see [FieldReport] for why they
/// are not three use cases.
@injectable
class WatchFieldReport extends StreamUseCase<FieldReport, NoParams> {
  const WatchFieldReport(
    this._repository,
    this._sessions,
    this._activity,
    this._surveys,
  );

  final JournalRepository _repository;
  final JournalSessionAggregator _sessions;
  final ExobiologyActivityAggregator _activity;
  final SystemSurveyBuilder _surveys;

  @override
  Stream<FieldReport> call(NoParams input) =>
      _repository.watchEvents().map((List<JournalEvent> events) {
        final JournalSessionState session = _sessions.aggregate(events);
        return FieldReport(
          session: session,
          activity: _activity.aggregate(events),
          survey: _surveys.build(
            events: events,
            systemAddress: session.position.systemAddress,
            systemName: session.position.starSystem,
          ),
        );
      });
}

/// The running game, re-read every ten seconds.
@injectable
class WatchLiveGameState extends StreamUseCase<LiveGameState, NoParams> {
  const WatchLiveGameState(this._live);

  final LiveJournalRepository _live;

  @override
  Stream<LiveGameState> call(NoParams input) => _live.watch();
}

/// Reads the game's files once, now.
@injectable
class RefreshLiveGameState extends UseCase<LiveGameState, NoParams> {
  const RefreshLiveGameState(this._live);

  final LiveJournalRepository _live;

  @override
  Future<Result<LiveGameState>> call(NoParams input) =>
      guard(_live.refreshNow);
}

@injectable
class ClearJournal extends UseCase<void, NoParams> {
  const ClearJournal(this._repository);

  final JournalRepository _repository;

  @override
  Future<Result<void>> call(NoParams input) => _repository.clear();
}
