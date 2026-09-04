/// Spansh's read-only API.
///
/// Spansh mirrors the community's shared knowledge of the galaxy — everything
/// EDDN carries, indexed by the same `id64` the game writes into the journal.
/// The lookup endpoints are documented (OpenAPI v2.3.2, served by
/// `docs.spansh.co.uk`). **The routing endpoints are not**, and using them is a
/// deliberate, load-bearing decision rather than an oversight: they are the only
/// public source that will name the species on a body before the commander has
/// flown there, and computing the equivalent locally would mean holding the
/// galaxy's bodies — 115.8 GB of dump, or one request per system.
///
/// Three things to know before adding a call here:
///
/// * **There is no published rate limit and no terms of service.** "Does not
///   *currently* enforce any rate limits" is the whole of it. The sustainable
///   volume is therefore unknown, which is why every response is cached and no
///   request is ever made without the commander asking for it.
/// * **The routing contract was read, not published.** It comes from Spansh's
///   own web client and was then verified against the live service. Spansh
///   lists API documentation as a funding goal, so this contract can change
///   without notice: every call through it must degrade to a displayed failure,
///   never to a crash.
/// * **No CORS headers.** A browser refuses these requests outright, so the
///   web build cannot use them at all — see `SystemLookupRepository.isSupported`
///   and `RoutePlannerRepository.isSupported`.
abstract final class SpanshEndpoints {
  static const String baseUrl = 'https://spansh.co.uk';

  /// Everything known about a system, its bodies included, keyed on the
  /// `SystemAddress` the journal writes in `Location`, `FSDJump` and
  /// `CarrierJump`. Answers in `camelCase`, under a `system` root.
  static String dump(int id64) => '/api/dump/$id64';

  /// One body, keyed on the body's own `id64` — not the system's. Answers in
  /// `snake_case`, under a `record` root, and carries the `landmarks` array
  /// that names species, colour variants and their coordinates.
  static String body(int id64) => '/api/body/$id64';

  /// Human-facing page for a system, for a "see it on Spansh" link.
  static String systemPage(int id64) => '$baseUrl/system/$id64';

  /// Human-facing page for a body.
  static String bodyPage(int id64) => '$baseUrl/body/$id64';

  // --- Routing (undocumented; see the note above) ------------------------

  /// Plots a route ranked by the value of the organisms on the way.
  ///
  /// `POST`, **form-encoded** — it refuses a JSON body — and answers `202`
  /// with a job id rather than a route.
  static const String exobiologyRoute = '/api/exobiology/route';

  /// The "Road to Riches": the same shape, ranked by scan and mapping value.
  static const String richesRoute = '/api/riches/route';

  /// Where a plotted route eventually appears, keyed on the job id returned by
  /// the two endpoints above. Stays readable after completion, so a route can
  /// be re-opened without being recomputed.
  static String routeResults(String jobId) => '/api/results/$jobId';
}
