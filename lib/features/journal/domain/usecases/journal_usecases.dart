import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/exobiology_activity.dart';
import '../entities/journal_event.dart';
import '../repositories/journal_repository.dart';
import '../services/exobiology_activity_aggregator.dart';

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

@injectable
class ClearJournal extends UseCase<void, NoParams> {
  const ClearJournal(this._repository);

  final JournalRepository _repository;

  @override
  Future<Result<void>> call(NoParams input) => _repository.clear();
}
