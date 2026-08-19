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
    this.isRefreshing = false,
    this.failure,
  });

  final Commander commander;
  final ManualCommanderOverrides overrides;
  final bool isRefreshing;

  /// A refresh that failed while a usable profile is already on screen: shown
  /// as a banner rather than replacing the content.
  final Failure? failure;

  CommanderReady copyWith({
    Commander? commander,
    ManualCommanderOverrides? overrides,
    bool? isRefreshing,
    Failure? failure,
    bool clearFailure = false,
  }) =>
      CommanderReady(
        commander: commander ?? this.commander,
        overrides: overrides ?? this.overrides,
        isRefreshing: isRefreshing ?? this.isRefreshing,
        failure: clearFailure ? null : (failure ?? this.failure),
      );

  @override
  List<Object?> get props =>
      <Object?>[commander, overrides, isRefreshing, failure];
}

final class CommanderError extends CommanderState {
  const CommanderError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => <Object?>[failure];
}
