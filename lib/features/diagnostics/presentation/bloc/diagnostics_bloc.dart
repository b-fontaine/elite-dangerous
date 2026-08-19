import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/diagnostics_capture.dart';
import '../../domain/entities/raw_payload.dart';
import '../../domain/usecases/diagnostics_usecases.dart';

part 'diagnostics_event.dart';
part 'diagnostics_state.dart';

@injectable
class DiagnosticsBloc extends Bloc<DiagnosticsEvent, DiagnosticsState> {
  DiagnosticsBloc(
    this._readCachedProfile,
    this._refreshProfile,
    this._readStoredJournal,
    this._fetchJournalDay,
    this._export,
  ) : super(const DiagnosticsState()) {
    on<DiagnosticsStarted>(_onStarted);
    on<DiagnosticsProfileRefreshRequested>(_onProfileRefreshRequested);
    on<DiagnosticsJournalDayRequested>(_onJournalDayRequested);
    on<DiagnosticsExportRequested>(_onExportRequested);
    on<DiagnosticsNoticeCleared>(_onNoticeCleared);
  }

  final ReadCachedProfile _readCachedProfile;
  final RefreshProfileCapture _refreshProfile;
  final ReadStoredJournal _readStoredJournal;
  final FetchJournalDayCapture _fetchJournalDay;
  final ExportCapture _export;

  /// Opens on what is already here: neither read costs a query, so the screen
  /// is useful before the commander decides to spend one.
  Future<void> _onStarted(
    DiagnosticsStarted event,
    Emitter<DiagnosticsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, clearNotices: true));

    final Result<ProfileCapture?> profile =
        await _readCachedProfile(const NoParams());
    final Result<JournalCapture?> journal =
        await _readStoredJournal(const NoParams());

    emit(
      state.copyWith(
        isLoading: false,
        profile: profile.valueOrNull,
        journal: journal.valueOrNull,
        failure: profile.failureOrNull ?? journal.failureOrNull,
      ),
    );
  }

  Future<void> _onProfileRefreshRequested(
    DiagnosticsProfileRefreshRequested event,
    Emitter<DiagnosticsState> emit,
  ) async {
    emit(state.copyWith(isFetchingProfile: true, clearNotices: true));
    final Result<ProfileCapture> result = await _refreshProfile(
      const NoParams(),
    );
    emit(
      result.fold(
        onSuccess: (ProfileCapture capture) => state.copyWith(
          isFetchingProfile: false,
          profile: capture,
        ),
        onFailure: (Failure failure) =>
            state.copyWith(isFetchingProfile: false, failure: failure),
      ),
    );
  }

  Future<void> _onJournalDayRequested(
    DiagnosticsJournalDayRequested event,
    Emitter<DiagnosticsState> emit,
  ) async {
    emit(state.copyWith(isFetchingJournal: true, clearNotices: true));
    final Result<JournalCapture> result = await _fetchJournalDay(event.day);
    emit(
      result.fold(
        onSuccess: (JournalCapture capture) => state.copyWith(
          isFetchingJournal: false,
          journal: capture,
        ),
        onFailure: (Failure failure) =>
            state.copyWith(isFetchingJournal: false, failure: failure),
      ),
    );
  }

  Future<void> _onExportRequested(
    DiagnosticsExportRequested event,
    Emitter<DiagnosticsState> emit,
  ) async {
    emit(state.copyWith(isExporting: true, clearNotices: true));
    final Result<String> result = await _export(event.payload);
    emit(
      result.fold(
        onSuccess: (String path) =>
            state.copyWith(isExporting: false, exportedPath: path),
        onFailure: (Failure failure) =>
            state.copyWith(isExporting: false, failure: failure),
      ),
    );
  }

  void _onNoticeCleared(
    DiagnosticsNoticeCleared event,
    Emitter<DiagnosticsState> emit,
  ) {
    emit(state.copyWith(clearNotices: true));
  }
}
