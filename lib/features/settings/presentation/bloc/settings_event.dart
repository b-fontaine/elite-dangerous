part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

final class SettingsWatchStarted extends SettingsEvent {
  const SettingsWatchStarted();
}

/// Internal: the stored settings changed.
final class SettingsUpdated extends SettingsEvent {
  const SettingsUpdated(this.settings);

  final AppSettings settings;

  @override
  List<Object?> get props => <Object?>[settings];
}

final class SettingsChanged extends SettingsEvent {
  const SettingsChanged(this.settings);

  final AppSettings settings;

  @override
  List<Object?> get props => <Object?>[settings];
}

/// Wipes everything local. The UI must have confirmed first.
final class SettingsLocalDataResetRequested extends SettingsEvent {
  const SettingsLocalDataResetRequested();
}
