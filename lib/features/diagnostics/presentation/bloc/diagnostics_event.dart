part of 'diagnostics_bloc.dart';

sealed class DiagnosticsEvent extends Equatable {
  const DiagnosticsEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

/// Loads what is already on the device. Costs nothing.
final class DiagnosticsStarted extends DiagnosticsEvent {
  const DiagnosticsStarted();
}

/// Spends one Companion API query on `/profile`.
final class DiagnosticsProfileRefreshRequested extends DiagnosticsEvent {
  const DiagnosticsProfileRefreshRequested();
}

/// Spends one Companion API query on one UTC day of journal.
final class DiagnosticsJournalDayRequested extends DiagnosticsEvent {
  const DiagnosticsJournalDayRequested({this.day});

  /// `null` means today, which is the day that carries the session-start
  /// events the cockpit needs.
  final DateTime? day;

  @override
  List<Object?> get props => <Object?>[day];
}

final class DiagnosticsExportRequested extends DiagnosticsEvent {
  const DiagnosticsExportRequested(this.payload);

  final RawPayload payload;

  @override
  List<Object?> get props => <Object?>[payload];
}

final class DiagnosticsNoticeCleared extends DiagnosticsEvent {
  const DiagnosticsNoticeCleared();
}
