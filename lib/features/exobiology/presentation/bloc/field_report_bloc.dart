import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/time/clock.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../journal/domain/entities/exobiology_activity.dart';
import '../../../journal/domain/entities/field_report.dart';
import '../../../journal/domain/entities/game_status.dart';
import '../../../journal/domain/entities/journal_session_state.dart';
import '../../../journal/domain/entities/live_game_state.dart';
import '../../../journal/domain/entities/system_survey.dart';
import '../../../journal/domain/usecases/journal_usecases.dart';
import '../../domain/entities/exobiology_catalog.dart';
import '../../domain/entities/organic_species.dart';
import '../../domain/usecases/exobiology_usecases.dart';

part 'field_report_event.dart';
part 'field_report_state.dart';

/// Drives the live dashboard: where the commander is, and what is left here.
///
/// Two subscriptions that deliberately stay separate. The journal changes when
/// something happens and can be minutes apart; `Status.json` changes several
/// times a second and is re-read on a timer. Merging them into one stream
/// would mean re-folding the whole journal every ten seconds to learn that a
/// latitude moved.
@injectable
class FieldReportBloc extends Bloc<FieldReportEvent, FieldReportState> {
  FieldReportBloc(
    this._watchReport,
    this._watchLive,
    this._refresh,
    this._catalog,
    this._clock,
  ) : super(const FieldReportState()) {
    on<FieldReportStarted>(_onStarted);
    on<FieldReportUpdated>(_onReportUpdated);
    on<FieldReportLiveUpdated>(_onLiveUpdated);
    on<FieldReportRefreshRequested>(_onRefreshRequested);
  }

  final WatchFieldReport _watchReport;
  final WatchLiveGameState _watchLive;
  final RefreshLiveGameState _refresh;
  final GetExobiologyCatalog _catalog;
  final Clock _clock;

  StreamSubscription<FieldReport>? _reportSubscription;
  StreamSubscription<LiveGameState>? _liveSubscription;

  Future<void> _onStarted(
    FieldReportStarted event,
    Emitter<FieldReportState> emit,
  ) async {
    await _reportSubscription?.cancel();
    await _liveSubscription?.cancel();

    // Loaded once and kept: it is what turns "four organisms" into a figure
    // the commander can weigh against the risk of flying home.
    final Result<ExobiologyCatalog> catalog = await _catalog(const NoParams());
    if (catalog.valueOrNull case final ExobiologyCatalog value) {
      emit(state.copyWith(catalog: value));
    }

    _reportSubscription = _watchReport(const NoParams())
        .listen((FieldReport report) => add(FieldReportUpdated(report)));
    _liveSubscription = _watchLive(const NoParams())
        .listen((LiveGameState live) => add(FieldReportLiveUpdated(live)));
  }

  void _onReportUpdated(
    FieldReportUpdated event,
    Emitter<FieldReportState> emit,
  ) {
    emit(state.copyWith(report: event.report, isLoading: false));
  }

  void _onLiveUpdated(
    FieldReportLiveUpdated event,
    Emitter<FieldReportState> emit,
  ) {
    emit(
      state.copyWith(
        live: event.live,
        now: _clock.now(),
        isLoading: false,
        isRefreshing: false,
      ),
    );
  }

  Future<void> _onRefreshRequested(
    FieldReportRefreshRequested event,
    Emitter<FieldReportState> emit,
  ) async {
    emit(state.copyWith(isRefreshing: true));
    await _refresh(const NoParams());
    // The result arrives through the live stream like any other poll; this
    // only guards against the spinner staying up if that stream is silent.
    emit(state.copyWith(isRefreshing: false, now: _clock.now()));
  }

  @override
  Future<void> close() async {
    await _reportSubscription?.cancel();
    await _liveSubscription?.cancel();
    return super.close();
  }
}
