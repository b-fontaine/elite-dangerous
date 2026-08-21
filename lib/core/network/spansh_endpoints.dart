/// Spansh's read-only API.
///
/// Spansh mirrors the community's shared knowledge of the galaxy — everything
/// EDDN carries, indexed by the same `id64` the game writes into the journal.
/// Only the four `GET` endpoints below are documented (OpenAPI v2.3.2, served
/// by `docs.spansh.co.uk`); the search and routing endpoints are not, and this
/// app deliberately stays on the documented half.
///
/// Two things to know before adding a call here:
///
/// * **There is no published rate limit and no terms of service.** "Does not
///   *currently* enforce any rate limits" is the whole of it. The sustainable
///   volume is therefore unknown, which is why every response is cached and no
///   request is ever made without the commander asking for it.
/// * **No CORS headers.** A browser refuses these requests outright, so the
///   web build cannot use them at all — see `SystemLookupRepository.isSupported`.
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
}
