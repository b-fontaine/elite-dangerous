part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.settings = const AppSettings.defaults(),
    this.isLoading = true,
    this.isResetting = false,
    this.didReset = false,
    this.failure,
  });

  final AppSettings settings;
  final bool isLoading;
  final bool isResetting;

  /// One-shot flag so the page can confirm the wipe happened.
  final bool didReset;

  final Failure? failure;

  SettingsState copyWith({
    AppSettings? settings,
    bool? isLoading,
    bool? isResetting,
    bool? didReset,
    Failure? failure,
    bool clearFlags = false,
  }) =>
      SettingsState(
        settings: settings ?? this.settings,
        isLoading: isLoading ?? this.isLoading,
        isResetting: isResetting ?? this.isResetting,
        didReset: clearFlags ? false : (didReset ?? this.didReset),
        failure: clearFlags ? null : (failure ?? this.failure),
      );

  @override
  List<Object?> get props =>
      <Object?>[settings, isLoading, isResetting, didReset, failure];
}
