import 'dart:async';
import 'dart:math' as math;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/time/clock.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../journal/domain/entities/journal_event.dart';
import '../../../journal/domain/usecases/journal_usecases.dart';
import '../../domain/entities/route_plan.dart';
import '../../domain/entities/route_progress.dart';
import '../../domain/entities/session_pace.dart';
import '../../domain/services/route_duration_estimator.dart';
import '../../domain/usecases/route_tracking_usecases.dart';

part 'route_tracking_event.dart';
part 'route_tracking_state.dart';

/// Drives the follow screen: what is left of the route being flown.
///
/// Everything shown here is **derived**, so refreshing is cheap and idempotent:
/// the plan is read from disk, the journal is folded onto it, and the pace is
/// measured from the same journal. Nothing is written, which is why a refresh
/// can be triggered as often as the commander likes — and why a fresh import
/// corrects the picture instead of double-counting into it.
///
/// On a second screen the same holds with the fold happening on the other
/// machine: [FollowRoute] decides which, and this bloc only learns of it to
/// caption the screen and to keep re-reading.
@injectable
class RouteTrackingBloc extends Bloc<RouteTrackingEvent, RouteTrackingState> {
  RouteTrackingBloc(
    this._follow,
    this._estimator,
    this._abandon,
    this._clock,
    this._watchJournalEvents,
  ) : super(const RouteTrackingState()) {
    on<RouteTrackingStarted>(_onStarted);
    on<RouteTrackingRefreshed>(_onStarted);
    on<RouteTrackingAbandoned>(_onAbandoned);
  }

  final FollowRoute _follow;
  final RouteDurationEstimator _estimator;
  final AbandonRoute _abandon;
  final Clock _clock;
  final WatchJournalEvents _watchJournalEvents;

  /// How long between two reads of the game machine.
  ///
  /// Only on a second screen. On the game machine itself the journal is read on
  /// demand and already re-read by the live journal watcher; polling here would
  /// duplicate it. Ten seconds, the same interval as that watcher, for the same
  /// reason: what is being watched moves in minutes.
  ///
  /// Not `const` only so a test can shorten it — nothing in the app writes it.
  @visibleForTesting
  static Duration pollInterval = const Duration(seconds: 10);

  /// How far the interval is allowed to stretch after repeated failures.
  ///
  /// A phone left on the desk with the screen open and the PC off for the night
  /// would otherwise open a socket every ten seconds until morning, keeping the
  /// radio awake for an answer that is not coming.
  static const int maxBackoff = 6;

  Timer? _poll;
  int _consecutiveFailures = 0;

  /// Guards against a slow read landing after a newer one.
  ///
  /// Handlers run concurrently — a poll that started before the commander
  /// unpaired can still be waiting on a four-second timeout when the fresh
  /// local read has already answered. Without this, the stale answer would win
  /// simply by finishing last, putting the screen back on a machine it is no
  /// longer paired to.
  int _reads = 0;

  /// Whether this screen is re-reading a game machine on a timer.
  @visibleForTesting
  bool get isPolling => _poll != null;

  /// Wakes a re-read as soon as the local journal gains new lines.
  ///
  /// Set up once, on the first start: the game machine has nothing else
  /// nudging this screen, since [_scheduleNextRead] only arms a timer for a
  /// shared one. `skip(1)` drops the stream's own catch-up value — this
  /// bloc's first read already covers it, so acting on it too would refresh
  /// twice for the same journal.
  StreamSubscription<List<JournalEvent>>? _journalSubscription;

  @override
  Future<void> close() {
    _stopPolling();
    unawaited(_journalSubscription?.cancel());
    return super.close();
  }

  Future<void> _onStarted(
    RouteTrackingEvent event,
    Emitter<RouteTrackingState> emit,
  ) async {
    _journalSubscription ??= _watchJournalEvents(const NoParams())
        .skip(1)
        .listen((_) {
      // A shared screen keeps re-reading the bridge on its own timer instead;
      // nudging it here too would just add a redundant bridge round trip.
      if (!isClosed && !state.isShared) {
        add(const RouteTrackingRefreshed(silent: true));
      }
    });

    final int read = ++_reads;
    final bool silent = event is RouteTrackingRefreshed && event.silent;
    if (!silent) {
      emit(state.copyWith(isLoading: state.progress == null, isRefreshing: true));
    }

    final FollowedRoute followed = await _follow();
    // `close()` does not wait for a handler in flight, and a newer read may
    // already have answered: either way this one has nothing left to say, and
    // scheduling a timer from here would outlive the screen.
    if (isClosed || read != _reads) {
      return;
    }
    _scheduleNextRead(
      shared: followed.isShared,
      failed: followed.failure != null,
    );

    if (followed.progress case final RouteProgress progress) {
      emit(
        RouteTrackingState(
          progress: progress,
          pace: followed.pace,
          remaining: _estimator.remaining(progress, followed.pace),
          source: followed.source,
          publishedAt: followed.publishedAt,
          age: _ageOf(followed.publishedAt),
          host: followed.host,
          isLoading: false,
        ),
      );
      return;
    }

    // A shared screen that already holds a route keeps showing it rather than
    // throwing it away over one dropped read: the figures were true when they
    // arrived, the ageing caption says how long ago that was, and a wifi hiccup
    // should not blank a route the commander is flying.
    if (followed.isShared && state.hasRoute && followed.failure != null) {
      emit(
        state.copyWith(
          age: _ageOf(state.publishedAt),
          failure: followed.failure,
          isLoading: false,
        ),
      );
      return;
    }

    // Nothing to show, with or without a reason: a paired machine flying
    // nothing and one that cannot be reached at all are both "no route here",
    // and the screen tells them apart by [RouteTrackingState.failure].
    emit(
      RouteTrackingState(
        source: followed.source,
        host: followed.host,
        failure: followed.failure,
        isLoading: false,
      ),
    );
  }

  /// How stale what is on screen is, never negative.
  ///
  /// The two machines keep their own clocks, and a phone a few seconds ahead of
  /// the PC would otherwise be told the route arrives from the future — which
  /// is both alarming and useless.
  Duration? _ageOf(DateTime? publishedAt) {
    if (publishedAt == null) {
      return null;
    }
    final Duration age = _clock.now().difference(publishedAt);
    return age.isNegative ? Duration.zero : age;
  }

  /// Books the next read of the game machine, or stops reading altogether.
  ///
  /// One-shot rather than periodic: the delay depends on how the last read
  /// went, and a fixed tick could stack a second request on top of one still
  /// waiting for a machine that is not answering.
  void _scheduleNextRead({required bool shared, required bool failed}) {
    _stopPolling();
    if (!shared || isClosed) {
      return;
    }
    _consecutiveFailures = failed ? _consecutiveFailures + 1 : 0;
    final int factor = math.min(1 << _consecutiveFailures, maxBackoff);
    _poll = Timer(pollInterval * factor, () {
      if (!isClosed) {
        add(const RouteTrackingRefreshed(silent: true));
      }
    });
  }

  void _stopPolling() {
    _poll?.cancel();
    _poll = null;
  }

  Future<void> _onAbandoned(
    RouteTrackingAbandoned event,
    Emitter<RouteTrackingState> emit,
  ) async {
    await _abandon();
    // Whatever this screen was reading, it is now showing its own empty state:
    // the invariant "polling implies shared" belongs here, not in the widget
    // that happens to hide the button.
    _stopPolling();
    _reads++;
    // Not cleared to an error state: abandoning is a normal end, and the route
    // is archived rather than lost.
    emit(const RouteTrackingState(isLoading: false));
  }
}
