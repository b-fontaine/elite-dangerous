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

/// What an import or a sync actually did.
class JournalSyncReport extends Equatable {
  const JournalSyncReport({
    this.daysFetched = 0,
    this.daysWithoutPlay = 0,
    this.partialDays = const <String>[],
    this.filesRead = 0,
    this.eventsAdded = 0,
    this.eventsSkipped = 0,
  });

  final int daysFetched;

  /// Days Frontier answered `204`: the commander simply did not play.
  final int daysWithoutPlay;

  /// Days Frontier answered `206`: the server could not gather everything and
  /// asks to be retried later.
  final List<String> partialDays;

  final int filesRead;

  /// New events, after deduplication against what was already stored.
  final int eventsAdded;

  /// Lines that could not be parsed at all.
  final int eventsSkipped;

  bool get hasPartialDays => partialDays.isNotEmpty;

  @override
  List<Object?> get props => <Object?>[
        daysFetched,
        daysWithoutPlay,
        partialDays,
        filesRead,
        eventsAdded,
        eventsSkipped,
      ];
}

/// The commander's flight log.
abstract interface class JournalRepository implements Disposable {
  Future<Result<List<JournalEvent>>> events();

  Stream<List<JournalEvent>> watchEvents();

  /// Fetches `[from, to]` inclusive from the Companion API, one UTC day at a
  /// time — Frontier exposes no range endpoint.
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
