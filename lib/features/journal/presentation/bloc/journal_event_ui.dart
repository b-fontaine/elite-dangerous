part of 'journal_bloc.dart';

sealed class JournalUiEvent extends Equatable {
  const JournalUiEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

final class JournalWatchStarted extends JournalUiEvent {
  const JournalWatchStarted();
}

/// Internal: the stored journal changed.
final class JournalEventsUpdated extends JournalUiEvent {
  const JournalEventsUpdated(this.events);

  final List<JournalEvent> events;

  @override
  List<Object?> get props => <Object?>[events];
}

/// Pulls the last [days] days from the Companion API.
final class JournalSyncRequested extends JournalUiEvent {
  const JournalSyncRequested({this.days = JournalSyncPolicy.defaultSyncDays});

  /// Reaches as far back as a single sync is allowed to walk. The walk stops
  /// on its own once the days come back empty, and skips the ones a previous
  /// sync already settled, so this is rarely as expensive as it looks.
  const JournalSyncRequested.maximum() : days = JournalSyncPolicy.maxSyncDays;

  final int days;

  bool get isMaximum => days >= JournalSyncPolicy.maxSyncDays;

  @override
  List<Object?> get props => <Object?>[days];
}

/// Imports every `Journal.*.log` of a folder.
final class JournalImportRequested extends JournalUiEvent {
  const JournalImportRequested(this.directory);

  final String directory;

  @override
  List<Object?> get props => <Object?>[directory];
}

final class JournalFilterChanged extends JournalUiEvent {
  const JournalFilterChanged(this.filter);

  final JournalFilter filter;

  @override
  List<Object?> get props => <Object?>[filter];
}
