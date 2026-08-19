part of 'commander_bloc.dart';

sealed class CommanderEvent extends Equatable {
  const CommanderEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

final class CommanderWatchStarted extends CommanderEvent {
  const CommanderWatchStarted();
}

/// Internal: a new profile arrived from the repository stream.
final class CommanderUpdated extends CommanderEvent {
  const CommanderUpdated(this.commander, this.overrides);

  final Commander commander;
  final ManualCommanderOverrides overrides;

  @override
  List<Object?> get props => <Object?>[commander, overrides];
}

/// Forces a Companion API round-trip. User-initiated only: Frontier's budget
/// is roughly one query a minute.
final class CommanderRefreshRequested extends CommanderEvent {
  const CommanderRefreshRequested();
}

final class CommanderOverridesSubmitted extends CommanderEvent {
  const CommanderOverridesSubmitted(this.overrides);

  final ManualCommanderOverrides overrides;

  @override
  List<Object?> get props => <Object?>[overrides];
}
