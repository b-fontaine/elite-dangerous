import '../entities/route_plan.dart';

/// Keeps the route the commander is currently flying, and the ones they flew
/// before.
///
/// **Only the plan is stored.** Progress is derived from the journal every time
/// it is read, so nothing here has to be kept in step with a session — which is
/// what makes closing the app mid-route, or re-importing a journal, a
/// non-event. The same rule the roadmap already follows.
abstract interface class ActiveRouteRepository {
  /// The route being flown, or null when there is none.
  Future<RoutePlan?> readActive();

  /// Makes [plan] the active route, archiving whichever was active before.
  Future<void> setActive(RoutePlan plan);

  /// Puts the active route away without starting another.
  ///
  /// The route is archived, not deleted: a commander who stops halfway is the
  /// normal case, and [archived] is where they find it again.
  Future<void> clearActive();

  /// Previously flown routes, most recently archived first.
  Future<List<RoutePlan>> archived();

  /// Forgets everything. Wired to the "reset local data" action.
  Future<void> clear();
}
