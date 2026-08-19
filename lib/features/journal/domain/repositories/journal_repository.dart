import 'package:equatable/equatable.dart';

import '../../../../core/lifecycle/disposable.dart';
import '../../../../core/result/result.dart';
import '../entities/journal_event.dart';

/// A journal file to import, expressed without any `dart:io` type so the
/// repository stays testable and web-safe.
class JournalFileSource {
  const JournalFileSource({required this.name, required this.readLines});

  final String name;
  final Stream<String> Function() readLines;
}

/// Why a Companion API sync stopped where it did.
enum JournalSyncStop {
  /// It reached the oldest day it was asked for.
  rangeExhausted('Toute la période demandée a été parcourue'),

  /// Enough consecutive days came back empty that going further is pointless.
  ///
  /// Frontier answers `204` both for a day the commander did not play and for
  /// one older than whatever it still keeps — the two are indistinguishable,
  /// and both mean stop.
  quietRun('Plus rien avant cette date : soit sans partie, soit hors de ce '
      'que Frontier conserve'),

  /// The day budget ran out before the range did.
  budgetSpent('Plafond de jours atteint'),

  /// Frontier refused, and nothing older was attempted.
  refused('Frontier a refusé la requête');

  const JournalSyncStop(this.label);

  final String label;
}

/// What an import or a sync actually did.
class JournalSyncReport extends Equatable {
  const JournalSyncReport({
    this.daysFetched = 0,
    this.daysWithoutPlay = 0,
    this.partialDays = const <String>[],
    this.daysAlreadyKnown = 0,
    this.filesRead = 0,
    this.eventsAdded = 0,
    this.eventsSkipped = 0,
    this.oldestDayReached,
    this.stoppedBecause,
  });

  final int daysFetched;

  /// Days Frontier answered `204`: the commander simply did not play.
  final int daysWithoutPlay;

  /// Days Frontier answered `206`: the server could not gather everything and
  /// asks to be retried later.
  final List<String> partialDays;

  /// Days skipped because a previous sync already settled them. A past day
  /// that answered `200` or `204` can never change, so asking again would
  /// spend a query to learn nothing.
  final int daysAlreadyKnown;

  final int filesRead;

  /// New events, after deduplication against what was already stored.
  final int eventsAdded;

  /// Lines that could not be parsed at all.
  final int eventsSkipped;

  /// The furthest back this sync actually went, `YYYY-MM-DD`.
  final String? oldestDayReached;

  final JournalSyncStop? stoppedBecause;

  bool get hasPartialDays => partialDays.isNotEmpty;

  int get daysAttempted => daysFetched + daysWithoutPlay;

  @override
  List<Object?> get props => <Object?>[
        daysFetched,
        daysWithoutPlay,
        partialDays,
        daysAlreadyKnown,
        filesRead,
        eventsAdded,
        eventsSkipped,
        oldestDayReached,
        stoppedBecause,
      ];
}

/// The commander's flight log.
abstract interface class JournalRepository implements Disposable {
  Future<Result<List<JournalEvent>>> events();

  Stream<List<JournalEvent>> watchEvents();

  /// Fetches `[from, to]` inclusive from the Companion API, one UTC day at a
  /// time — Frontier exposes no range endpoint.
  ///
  /// Walks backwards from [to]: the events the app most needs — `Statistics`,
  /// `EngineerProgress`, `ShipLocker`, `Loadout`, `Reputation` — are rewritten
  /// at every session start, so the most recent played day already carries the
  /// commander's current state. Going newest-first finds it in one request
  /// instead of after the whole range.
  Future<Result<JournalSyncReport>> syncFromCompanionApi({
    required DateTime from,
    required DateTime to,
  });

  Future<Result<JournalSyncReport>> importFiles(List<JournalFileSource> files);

  /// Directories where the game writes `Journal.*.log`, per platform.
  Future<Result<List<String>>> suggestedJournalDirectories();

  /// Lists the journal files of a directory, newest first.
  Future<Result<List<JournalFileSource>>> listJournalFiles(String directory);

  Future<Result<void>> clear();
}
