part of 'diagnostics_bloc.dart';

class DiagnosticsState extends Equatable {
  const DiagnosticsState({
    this.isLoading = true,
    this.isFetchingProfile = false,
    this.isFetchingJournal = false,
    this.isExporting = false,
    this.profile,
    this.journal,
    this.exportedPath,
    this.failure,
  });

  final bool isLoading;
  final bool isFetchingProfile;
  final bool isFetchingJournal;
  final bool isExporting;

  final ProfileCapture? profile;
  final JournalCapture? journal;

  /// Where the last export landed, so the path can be read and reused.
  final String? exportedPath;

  final Failure? failure;

  bool get isBusy => isFetchingProfile || isFetchingJournal || isExporting;

  DiagnosticsState copyWith({
    bool? isLoading,
    bool? isFetchingProfile,
    bool? isFetchingJournal,
    bool? isExporting,
    ProfileCapture? profile,
    JournalCapture? journal,
    String? exportedPath,
    Failure? failure,
    bool clearNotices = false,
  }) =>
      DiagnosticsState(
        isLoading: isLoading ?? this.isLoading,
        isFetchingProfile: isFetchingProfile ?? this.isFetchingProfile,
        isFetchingJournal: isFetchingJournal ?? this.isFetchingJournal,
        isExporting: isExporting ?? this.isExporting,
        profile: profile ?? this.profile,
        journal: journal ?? this.journal,
        exportedPath: clearNotices ? null : (exportedPath ?? this.exportedPath),
        failure: clearNotices ? null : (failure ?? this.failure),
      );

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        isFetchingProfile,
        isFetchingJournal,
        isExporting,
        profile,
        journal,
        exportedPath,
        failure,
      ];
}
