part of 'field_report_bloc.dart';

sealed class FieldReportEvent extends Equatable {
  const FieldReportEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

final class FieldReportStarted extends FieldReportEvent {
  const FieldReportStarted();
}

/// The journal changed — an import, a sync, or a line the tail picked up.
final class FieldReportUpdated extends FieldReportEvent {
  const FieldReportUpdated(this.report);

  final FieldReport report;

  @override
  List<Object?> get props => <Object?>[report];
}

/// A new reading of the game's own state files.
final class FieldReportLiveUpdated extends FieldReportEvent {
  const FieldReportLiveUpdated(this.live);

  final LiveGameState live;

  @override
  List<Object?> get props => <Object?>[live];
}

/// The commander asked for a look now rather than in ten seconds.
final class FieldReportRefreshRequested extends FieldReportEvent {
  const FieldReportRefreshRequested();
}
