import '../../../../core/result/result.dart';
import '../entities/route_plan.dart';
import '../entities/route_request.dart';

/// Asks Spansh to plot a route.
///
/// Four rules shape this port, and each one is a constraint the endpoint
/// imposes rather than a preference:
///
/// * **Nothing here happens on its own.** As with the system lookup, a request
///   leaves this device because the commander pressed something. Plotting a
///   route is the most expensive thing this app can ask of Spansh, so it is
///   never speculative and never automatic.
/// * **The call is a job, not a request.** Spansh answers `202` with a job id
///   and computes in the background; the plan only exists after polling
///   `/api/results/{job}`. That round trip is this port's job to hide, but its
///   cost is why [plan] can take tens of seconds.
/// * **The endpoint is undocumented.** Unlike `/api/dump`, no OpenAPI
///   description covers it — Spansh lists documentation as a funding goal. The
///   contract implemented here was read out of their own web client and then
///   verified against the live service. It can change without notice, which is
///   why a failure must stay an ordinary displayable state.
/// * **A plan is not progress.** What comes back is what the galaxy holds, not
///   what this commander still has to do. Subtracting what is already done is a
///   separate concern, deliberately kept out of here.
abstract interface class RoutePlannerRepository {
  /// Whether this build can reach Spansh at all.
  ///
  /// False on the web, for the same reason the system lookup is: Spansh sends
  /// no CORS headers, so the browser refuses the request before it is made.
  bool get isSupported;

  /// Plots a route, waiting for Spansh's job to finish.
  ///
  /// Resolves when the job completes, times out, or fails. The returned plan
  /// carries the [RoutePlan.jobId], so the same answer can be re-read later
  /// with [results] instead of being recomputed.
  Future<Result<RoutePlan>> plan(RouteRequest request);

  /// Re-reads a job that has already been computed.
  ///
  /// [request] is what produced the job; it travels with the plan so a
  /// re-opened route can still say what was asked. Spansh keeps results
  /// addressable after completion, so this costs one cheap `GET` where [plan]
  /// costs a full computation.
  Future<Result<RoutePlan>> results(String jobId, RouteRequest request);
}
