part of 'journal_bloc.dart';

/// Which events the timeline shows.
enum JournalFilter {
  exobiology('Exobiologie'),
  exploration('Exploration'),
  all('Tout');

  const JournalFilter(this.label);

  final String label;

  bool matches(JournalEvent event) => switch (this) {
        JournalFilter.exobiology => event is ScanOrganicEvent ||
            event is SellOrganicDataEvent ||
            event is BodySignalsEvent ||
            event is SuitEvent,
        JournalFilter.exploration => event is BodyScanEvent ||
            event is BodySignalsEvent ||
            event is SurfaceContactEvent,
        JournalFilter.all => true,
      };
}

class JournalState extends Equatable {
  const JournalState({
    this.events = const <JournalEvent>[],
    this.activity = const ExobiologyActivity(),
    this.filter = JournalFilter.exobiology,
    this.suggestedDirectories = const <String>[],
    this.isLoading = true,
    this.isSyncing = false,
    this.lastReport,
    this.failure,
  });

  final List<JournalEvent> events;
  final ExobiologyActivity activity;
  final JournalFilter filter;
  final List<String> suggestedDirectories;
  final bool isLoading;
  final bool isSyncing;
  final JournalSyncReport? lastReport;
  final Failure? failure;

  /// Newest first — the commander wants the last session, not the first.
  List<JournalEvent> get visibleEvents {
    final List<JournalEvent> filtered =
        events.where(filter.matches).toList()
          ..sort((JournalEvent a, JournalEvent b) =>
              b.timestamp.compareTo(a.timestamp));
    return List<JournalEvent>.unmodifiable(filtered);
  }

  bool get isEmpty => events.isEmpty;

  JournalState copyWith({
    List<JournalEvent>? events,
    ExobiologyActivity? activity,
    JournalFilter? filter,
    List<String>? suggestedDirectories,
    bool? isLoading,
    bool? isSyncing,
    JournalSyncReport? lastReport,
    Failure? failure,
    bool clearFailure = false,
    bool clearReport = false,
  }) {
    return JournalState(
      events: events ?? this.events,
      activity: activity ?? this.activity,
      filter: filter ?? this.filter,
      suggestedDirectories: suggestedDirectories ?? this.suggestedDirectories,
      isLoading: isLoading ?? this.isLoading,
      isSyncing: isSyncing ?? this.isSyncing,
      lastReport: clearReport ? null : (lastReport ?? this.lastReport),
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => <Object?>[
        events,
        activity,
        filter,
        suggestedDirectories,
        isLoading,
        isSyncing,
        lastReport,
        failure,
      ];
}
