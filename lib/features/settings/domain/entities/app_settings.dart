import 'package:equatable/equatable.dart';

/// User preferences. Everything here is local; the app has no account system.
class AppSettings extends Equatable {
  const AppSettings({
    this.journalDirectory,
    this.autoSyncOnLaunch = false,
    this.showReliabilityTags = true,
    this.compactDensity = false,
  });

  const AppSettings.defaults() : this();

  /// Folder holding `Journal.*.log`, remembered between imports.
  final String? journalDirectory;

  /// Whether to hit the Companion API on launch. Off by default: Frontier
  /// budgets roughly one query a minute and a silent call on every cold start
  /// is exactly what that rule exists to prevent.
  final bool autoSyncOnLaunch;

  /// Show the OFF / COM / EST provenance chips next to figures.
  final bool showReliabilityTags;

  final bool compactDensity;

  AppSettings copyWith({
    String? journalDirectory,
    bool? autoSyncOnLaunch,
    bool? showReliabilityTags,
    bool? compactDensity,
    bool clearJournalDirectory = false,
  }) =>
      AppSettings(
        journalDirectory: clearJournalDirectory
            ? null
            : (journalDirectory ?? this.journalDirectory),
        autoSyncOnLaunch: autoSyncOnLaunch ?? this.autoSyncOnLaunch,
        showReliabilityTags: showReliabilityTags ?? this.showReliabilityTags,
        compactDensity: compactDensity ?? this.compactDensity,
      );

  @override
  List<Object?> get props => <Object?>[
        journalDirectory,
        autoSyncOnLaunch,
        showReliabilityTags,
        compactDensity,
      ];
}
