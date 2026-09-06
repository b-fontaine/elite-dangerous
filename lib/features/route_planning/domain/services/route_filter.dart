import '../entities/done_index.dart';
import '../entities/filtered_route.dart';
import '../entities/route_plan.dart';
import '../entities/route_progress.dart';
import '../entities/route_request.dart';

/// Takes the already-done parts out of a freshly computed route.
///
/// Spansh knows the galaxy and nothing about this commander — it has no
/// exclusion parameter, and one sent anyway is dropped in silence. The
/// subtraction can therefore only happen here.
///
/// **What removal means depends on the objective**, and conflating the two
/// would throw away work:
///
/// * an **exobiology** route drops a body once every species on it is analysed
///   — sampling is what that route is for;
/// * a **riches** route drops a body once its surface is mapped by this
///   commander — the scan and mapping value it was chosen for is collected.
///
/// **Having visited a system removes nothing.** Flying through a system says
/// nothing about having sampled it, and a commander who once refuelled at a
/// stop would otherwise watch the best body of their route disappear. Those
/// systems are reported, not deleted.
class RouteFilter {
  const RouteFilter();

  FilteredRoute call(RoutePlan plan, RouteProgress progress, DoneIndex done) {
    final List<RouteRemoval> removals = <RouteRemoval>[];
    final Set<String> revisited = <String>{};
    final List<RouteWaypoint> kept = <RouteWaypoint>[];

    final bool forExobiology =
        plan.request.objective == RouteObjective.exobiology;

    for (int i = 0; i < plan.waypoints.length; i++) {
      final RouteWaypoint waypoint = plan.waypoints[i];
      final WaypointProgress? tracked =
          i < progress.waypoints.length ? progress.waypoints[i] : null;

      if (done.hasVisited(id64: waypoint.id64, name: waypoint.name)) {
        revisited.add(waypoint.name);
      }

      final List<RouteBody> keptBodies = <RouteBody>[];
      for (int b = 0; b < waypoint.bodies.length; b++) {
        final RouteBody body = waypoint.bodies[b];
        final BodyProgress? bodyProgress =
            tracked != null && b < tracked.bodies.length
                ? tracked.bodies[b]
                : null;

        final RemovalReason? reason = _reasonToDrop(
          body: body,
          progress: bodyProgress,
          done: done,
          systemAddress: waypoint.id64,
          forExobiology: forExobiology,
        );

        if (reason == null) {
          keptBodies.add(body);
        } else {
          removals.add(
            RouteRemoval(
              systemName: waypoint.name,
              bodyName: body.name,
              reason: reason,
              valueCr: forExobiology
                  ? body.landmarkValueCr
                  : body.estimatedScanValueCr + body.estimatedMappingValueCr,
            ),
          );
        }
      }

      // A system whose bodies all went is itself a removal — but the departure
      // waypoint stays whatever happens: it is where the commander is, not a
      // stop to skip. The last waypoint of a loop is the same system, and
      // removing it would leave a route that never comes home.
      final bool isEndpoint = i == 0 || i == plan.waypoints.length - 1;
      if (keptBodies.isEmpty && waypoint.bodies.isNotEmpty && !isEndpoint) {
        removals.add(
          RouteRemoval(
            systemName: waypoint.name,
            reason: RemovalReason.nothingToDo,
            valueCr: 0,
          ),
        );
        continue;
      }

      kept.add(
        RouteWaypoint(
          id64: waypoint.id64,
          name: waypoint.name,
          x: waypoint.x,
          y: waypoint.y,
          z: waypoint.z,
          jumpsFromPrevious: waypoint.jumpsFromPrevious,
          bodies: List<RouteBody>.unmodifiable(keptBodies),
        ),
      );
    }

    return FilteredRoute(
      original: plan,
      filtered: RoutePlan(
        jobId: plan.jobId,
        request: plan.request,
        waypoints: List<RouteWaypoint>.unmodifiable(kept),
        computedAt: plan.computedAt,
      ),
      removals: List<RouteRemoval>.unmodifiable(removals),
      revisitedSystems: Set<String>.unmodifiable(revisited),
    );
  }

  /// Why this body should go, or null to keep it.
  static RemovalReason? _reasonToDrop({
    required RouteBody body,
    required BodyProgress? progress,
    required DoneIndex done,
    required int systemAddress,
    required bool forExobiology,
  }) {
    if (forExobiology) {
      if (body.species.isEmpty) {
        return RemovalReason.nothingToDo;
      }
      // Only [BodyProgress.isComplete] decides, and it already refuses to close
      // a shared genus on partial evidence — so a body carrying two species of
      // one genus is not dropped until both are accounted for.
      if (progress != null && progress.isComplete) {
        return RemovalReason.allSpeciesAnalysed;
      }
      return null;
    }

    final BodyRecord? record = done.recordForName(systemAddress, body.name);
    if (record != null && record.mapped) {
      return RemovalReason.bodyAlreadyMapped;
    }
    return null;
  }
}
