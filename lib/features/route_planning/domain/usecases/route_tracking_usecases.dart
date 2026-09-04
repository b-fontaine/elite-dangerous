import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../journal/domain/entities/journal_event.dart';
import '../../../journal/domain/repositories/journal_repository.dart';
import '../entities/done_index.dart';
import '../entities/filtered_route.dart';
import '../entities/route_plan.dart';
import '../entities/route_progress.dart';
import '../entities/session_pace.dart';
import '../repositories/active_route_repository.dart';
import '../repositories/history_backfill_repository.dart';
import '../services/done_index_builder.dart';
import '../services/route_duration_estimator.dart';
import '../services/route_filter.dart';
import '../services/route_progress_calculator.dart';
import '../services/session_pace_calibrator.dart';

/// Makes a freshly plotted route the one being flown.
@injectable
class StartRoute extends UseCase<RoutePlan, RoutePlan> {
  const StartRoute(this._routes);

  final ActiveRouteRepository _routes;

  @override
  Future<Result<RoutePlan>> call(RoutePlan input) =>
      guard<RoutePlan>(() async {
        await _routes.setActive(input);
        return input;
      });
}

/// The route being flown, if there is one.
@injectable
class ReadActiveRoute {
  const ReadActiveRoute(this._routes);

  final ActiveRouteRepository _routes;

  Future<RoutePlan?> call() => _routes.readActive();
}

/// Puts the current route away. It stays in the archive.
@injectable
class AbandonRoute {
  const AbandonRoute(this._routes);

  final ActiveRouteRepository _routes;

  Future<void> call() => _routes.clearActive();
}

/// Routes flown before this one.
@injectable
class ReadArchivedRoutes {
  const ReadArchivedRoutes(this._routes);

  final ActiveRouteRepository _routes;

  Future<List<RoutePlan>> call() => _routes.archived();
}

/// What is left of the active route, according to the journal.
///
/// The one screen-facing operation of this lot: it reads the stored plan, reads
/// the journal, and folds one onto the other. Nothing is written — which is why
/// calling it twice, or after a fresh import, costs nothing and changes
/// nothing.
@injectable
class TrackActiveRoute extends UseCase<RouteProgress?, NoParams> {
  const TrackActiveRoute(this._routes, this._journal, this._calculator);

  final ActiveRouteRepository _routes;
  final JournalRepository _journal;
  final RouteProgressCalculator _calculator;

  @override
  Future<Result<RouteProgress?>> call(NoParams input) async {
    final RoutePlan? plan = await _routes.readActive();
    if (plan == null) {
      return const Result<RouteProgress?>.ok(null);
    }

    // A journal that cannot be read degrades to "nothing done yet" rather than
    // to an error. The distinction matters: without a journal nothing *is*
    // known to be done, and hiding the route behind a failure would make a
    // missing import look like a lost route.
    final Result<List<JournalEvent>> events = await _journal.events();
    final List<JournalEvent> all =
        events.valueOrNull ?? const <JournalEvent>[];
    return Result<RouteProgress?>.ok(_calculator(plan, all));
  }
}

/// A freshly computed route with the already-done parts taken out.
///
/// The operation that answers the original ask — "ne pas ajouter inutilement
/// des étapes déjà faites". Run on a plan *before* it is started, so the
/// commander sees what is left rather than what the galaxy holds.
///
/// Reads the journal and writes nothing: filtering a route twice gives the same
/// answer, and a route is never quietly mutated on disk.
@injectable
class FilterPlannedRoute extends UseCase<FilteredRoute, RoutePlan> {
  const FilterPlannedRoute(
    this._journal,
    this._calculator,
    this._indexBuilder,
    this._filter,
    this._history,
  );

  final JournalRepository _journal;
  final RouteProgressCalculator _calculator;
  final DoneIndexBuilder _indexBuilder;
  final RouteFilter _filter;
  final HistoryBackfillRepository _history;

  @override
  Future<Result<FilteredRoute>> call(RoutePlan input) async {
    // Read before the fold rather than inside it: the stored history is the
    // one part of this that is not derived from the journal, and the merge
    // order says so — what the journal knows today wins over what a backfill
    // recorded months ago.
    final DoneIndex backfilled = await _history.stored();
    // Same degradation as the tracker: no journal means nothing is known to be
    // done, which is a filter that removes nothing — not a failure to plan.
    final Result<List<JournalEvent>> events = await _journal.events();
    final List<JournalEvent> all =
        events.valueOrNull ?? const <JournalEvent>[];

    final DoneIndex done = backfilled.mergedWith(_indexBuilder(all));
    final RouteProgress progress = _calculator(input, all);
    return Result<FilteredRoute>.ok(_filter(input, progress, done));
  }
}

/// Everywhere the commander has already been, and what they did there.
///
/// Exposed on its own because the next lot pours two remote sources into it —
/// the Frontier visited-stars cache and EDSM's flight logs — and both need a
/// base to merge onto.
@injectable
class BuildDoneIndex extends UseCase<DoneIndex, NoParams> {
  const BuildDoneIndex(this._journal, this._indexBuilder);

  final JournalRepository _journal;
  final DoneIndexBuilder _indexBuilder;

  @override
  Future<Result<DoneIndex>> call(NoParams input) async {
    final Result<List<JournalEvent>> events = await _journal.events();
    return Result<DoneIndex>.ok(
      _indexBuilder(events.valueOrNull ?? const <JournalEvent>[]),
    );
  }
}

/// Pulls Frontier's visited-stars cache, in one request.
@injectable
class ImportVisitedStars extends UseCase<int, NoParams> {
  const ImportVisitedStars(this._history);

  final HistoryBackfillRepository _history;

  @override
  Future<Result<int>> call(NoParams input) => _history.importVisitedStars();
}

/// Walks EDSM's flight log backwards, a bounded number of weeks at a time.
@injectable
class BackfillHistoryFromEdsm extends UseCase<BackfillReport, int> {
  const BackfillHistoryFromEdsm(this._history);

  final HistoryBackfillRepository _history;

  /// [input] is how many windows this pass may spend. Bounded so a screen
  /// never waits on an hour of requests; call again to go further back.
  @override
  Future<Result<BackfillReport>> call(int input) =>
      _history.backfillFromEdsm(maxWindows: input);
}

/// How fast this commander plays, measured on their own journal.
@injectable
class MeasureSessionPace extends UseCase<SessionPace, NoParams> {
  const MeasureSessionPace(this._journal, this._calibrator);

  final JournalRepository _journal;
  final SessionPaceCalibrator _calibrator;

  @override
  Future<Result<SessionPace>> call(NoParams input) async {
    // No journal means no measurements, which is what the defaults are for —
    // and `PaceSource.defaults` already says so on screen.
    final Result<List<JournalEvent>> events = await _journal.events();
    return Result<SessionPace>.ok(
      _calibrator(events.valueOrNull ?? const <JournalEvent>[]),
    );
  }
}

class RouteBudget extends Equatable {
  const RouteBudget({required this.plan, required this.available});

  final RoutePlan plan;

  /// What the commander says they have tonight.
  final Duration available;

  @override
  List<Object?> get props => <Object?>[plan, available];
}

/// How far a route gets in the time available, at this commander's own pace.
///
/// The answer to "j'ai deux heures ce soir" — and the one operation in this
/// feature with no equivalent anywhere in the ecosystem.
@injectable
class ReachInTime extends UseCase<SessionReach, RouteBudget> {
  const ReachInTime(this._journal, this._calibrator, this._estimator);

  final JournalRepository _journal;
  final SessionPaceCalibrator _calibrator;
  final RouteDurationEstimator _estimator;

  @override
  Future<Result<SessionReach>> call(RouteBudget input) async {
    final Result<List<JournalEvent>> events = await _journal.events();
    final List<JournalEvent> all =
        events.valueOrNull ?? const <JournalEvent>[];
    return Result<SessionReach>.ok(
      _estimator.reach(input.plan, _calibrator(all), input.available),
    );
  }
}
