part of 'commander_bloc.dart';

sealed class CommanderState extends Equatable {
  const CommanderState();

  @override
  List<Object?> get props => const <Object?>[];
}

final class CommanderInitial extends CommanderState {
  const CommanderInitial();
}

final class CommanderLoading extends CommanderState {
  const CommanderLoading();
}

final class CommanderReady extends CommanderState {
  const CommanderReady({
    required this.commander,
    required this.overrides,
    this.session = const JournalSessionState.empty(),
    this.isRefreshing = false,
    this.failure,
  });

  final Commander commander;
  final ManualCommanderOverrides overrides;

  /// What the journal proves — the half `/profile` cannot supply: career
  /// totals, engineers, reputations, the exact rebuy, the laden jump range.
  final JournalSessionState session;

  final bool isRefreshing;

  /// A refresh that failed while a usable profile is already on screen: shown
  /// as a banner rather than replacing the content.
  final Failure? failure;

  CommanderReady copyWith({
    Commander? commander,
    ManualCommanderOverrides? overrides,
    JournalSessionState? session,
    bool? isRefreshing,
    Failure? failure,
    bool clearFailure = false,
  }) =>
      CommanderReady(
        commander: commander ?? this.commander,
        overrides: overrides ?? this.overrides,
        session: session ?? this.session,
        isRefreshing: isRefreshing ?? this.isRefreshing,
        failure: clearFailure ? null : (failure ?? this.failure),
      );

  @override
  List<Object?> get props =>
      <Object?>[commander, overrides, session, isRefreshing, failure];
}

final class CommanderError extends CommanderState {
  const CommanderError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => <Object?>[failure];
}
