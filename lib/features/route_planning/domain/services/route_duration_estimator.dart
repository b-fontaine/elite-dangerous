import '../entities/route_plan.dart';
import '../entities/route_progress.dart';
import '../entities/session_pace.dart';

/// Where a session is expected to end, on a route that is longer than the
/// evening available.
class SessionReach {
  const SessionReach({
    required this.estimate,
    required this.lastWaypointIndex,
    required this.coversWholeRoute,
  });

  /// Cost of the part that fits.
  final RouteEstimate estimate;

  /// Index of the last waypoint reachable inside the budget.
  ///
  /// The route is **not** cut. A truncated route would break a loop — the
  /// return leg starts from somewhere else — and would throw away planning the
  /// commander may well use tomorrow. A mark saying "this is about as far as
  /// tonight goes" answers the question without destroying the answer.
  final int lastWaypointIndex;

  final bool coversWholeRoute;
}

/// Turns a route and a pace into a duration.
///
/// The piece no other tool in the ecosystem provides: Spansh reasons in systems
/// and in minimum value, and has no notion of time at all. It is also the
/// parameter a commander states first — "j'ai deux heures ce soir" — which is
/// why it gets its own service rather than a helper on an entity.
///
/// Deliberately **not** an inversion. Working out "how many systems fit in two
/// hours" from averages would be guessing at the content of a route that has
/// not been computed yet; asking Spansh for a generous route and then measuring
/// where the evening ends uses the real bodies and the real species counts, and
/// costs one request either way.
class RouteDurationEstimator {
  const RouteDurationEstimator();

  /// What the whole route costs.
  RouteEstimate estimate(RoutePlan plan, SessionPace pace) {
    int jumps = 0;
    int bodies = 0;
    int samples = 0;

    for (int i = 0; i < plan.waypoints.length; i++) {
      final RouteWaypoint waypoint = plan.waypoints[i];
      // The departure system is where the commander already stands; its jump
      // count is Spansh's artefact, not a leg to fly.
      if (i > 0) {
        jumps += waypoint.jumpsFromPrevious;
      }
      for (final RouteBody body in waypoint.bodies) {
        bodies++;
        samples += body.species.length * 3;
      }
    }

    return _build(pace, jumps: jumps, bodies: bodies, samples: samples);
  }

  /// What is *left* of a route in progress.
  ///
  /// Counts only outstanding species and the bodies that still carry one, so
  /// the figure falls as the session goes rather than restating the plan.
  RouteEstimate remaining(RouteProgress progress, SessionPace pace) {
    int bodies = 0;
    int samples = 0;

    for (int i = progress.currentIndex; i < progress.waypoints.length; i++) {
      for (final BodyProgress body in progress.waypoints[i].bodies) {
        final int outstanding = body.species
            .where((SpeciesProgress s) => s.isOutstanding)
            .fold<int>(0, (int sum, SpeciesProgress s) => sum + s.remainingSamples);
        if (outstanding > 0) {
          bodies++;
          samples += outstanding;
        }
      }
    }

    return _build(
      pace,
      jumps: progress.jumpsRemaining,
      bodies: bodies,
      samples: samples,
    );
  }

  /// How far the route gets inside [budget].
  SessionReach reach(RoutePlan plan, SessionPace pace, Duration budget) {
    Duration spent = Duration.zero;
    int reached = 0;
    int jumps = 0;
    int bodies = 0;
    int samples = 0;

    for (int i = 0; i < plan.waypoints.length; i++) {
      final RouteWaypoint waypoint = plan.waypoints[i];
      Duration cost = i > 0 ? pace.perJump * waypoint.jumpsFromPrevious : Duration.zero;
      int stopBodies = 0;
      int stopSamples = 0;
      for (final RouteBody body in waypoint.bodies) {
        stopBodies++;
        stopSamples += body.species.length * 3;
        cost += pace.perLanding + pace.perSample * (body.species.length * 3);
      }

      // The departure system always counts as reached: the commander is in it,
      // and a budget too small for the first leg still leaves them somewhere.
      if (i > 0 && spent + cost > budget) {
        break;
      }
      spent += cost;
      reached = i;
      if (i > 0) {
        jumps += waypoint.jumpsFromPrevious;
      }
      bodies += stopBodies;
      samples += stopSamples;
    }

    return SessionReach(
      estimate: _build(pace, jumps: jumps, bodies: bodies, samples: samples),
      lastWaypointIndex: reached,
      coversWholeRoute: reached == plan.waypoints.length - 1,
    );
  }

  /// A starting value for the plotter's `max_results`, before any route exists.
  ///
  /// Only for pre-filling a form. The two ratios come from routes actually
  /// computed while building this feature — a request from Sol at a 50 ly range
  /// and a 100 ly radius returned 21 bodies across 4 systems — and they move
  /// with `min_value`, so this is a starting point to be corrected by the real
  /// estimate, never a promise.
  int suggestedSystemCount(
    SessionPace pace,
    Duration budget, {
    double bodiesPerSystem = 5,
    double speciesPerBody = 4,
    double jumpsPerSystem = 2,
  }) {
    final double perSystem = pace.perJump.inSeconds * jumpsPerSystem +
        bodiesPerSystem *
            (pace.perLanding.inSeconds +
                pace.perSample.inSeconds * speciesPerBody * 3);
    if (perSystem <= 0) {
      return 1;
    }
    final int fits = (budget.inSeconds / perSystem).floor();
    return fits.clamp(1, 50);
  }

  static RouteEstimate _build(
    SessionPace pace, {
    required int jumps,
    required int bodies,
    required int samples,
  }) =>
      RouteEstimate(
        pace: pace,
        jumps: pace.perJump * jumps,
        landings: pace.perLanding * bodies,
        sampling: pace.perSample * samples,
        jumpCount: jumps,
        bodyCount: bodies,
        sampleCount: samples,
      );
}
