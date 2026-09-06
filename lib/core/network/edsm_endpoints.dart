/// EDSM's commander-log API.
///
/// The one source that can hold exploration history predating this app: a
/// commander who fed EDSM for years knows systems their current journal files
/// and their Frontier cache never saw.
///
/// Three properties shape every call made here, and none of them is optional:
///
/// * **A key the commander must fetch themselves.** Reading private flight logs
///   needs `commanderName` plus an `apiKey` generated under EDSM's *settings →
///   My API Key*. There is no OAuth and no developer registration; the key
///   identifies the player, not this app, so it is stored in the secure store
///   with the Frontier tokens rather than in preferences.
/// * **360 requests an hour, and a one-week window per request.** Roughly one
///   call every ten seconds, and a year of history costs fifty-two of them.
///   Backfilling is therefore a slow background errand with a resumable
///   cursor, never something a screen waits on.
/// * **System names, not `id64`.** Each entry carries `system` and an
///   EDSM-internal `systemId` that maps to nothing else in this app. That is
///   the whole reason `DoneIndex` was built with two keys.
///
/// The documentation page sits behind Cloudflare and answers 403 to automated
/// clients; the endpoints themselves answer normally. The message numbers below
/// were read off the live service.
abstract final class EdsmEndpoints {
  static const String baseUrl = 'https://www.edsm.net';

  /// A commander's flight log over a window of at most one week.
  static const String flightLogs = '/api-logs-v1/get-logs';

  /// Where a commander was last seen. Answers without a key when the profile
  /// is public, which makes it the cheapest way to check a key is wrong before
  /// spending an hour of backfill on it.
  static const String position = '/api-logs-v1/get-position';

  /// EDSM's own date format: `YYYY-MM-DD HH:MM:SS`, in UTC, with a space
  /// rather than the `T` an ISO parser would emit.
  static String formatDate(DateTime utc) {
    String two(int v) => v.toString().padLeft(2, '0');
    return '${utc.year.toString().padLeft(4, '0')}-${two(utc.month)}-'
        '${two(utc.day)} ${two(utc.hour)}:${two(utc.minute)}:${two(utc.second)}';
  }
}

/// EDSM's `msgnum`, as observed on the live service.
///
/// It answers `200 OK` at the HTTP level whatever happens, so this is the only
/// place failure is visible. A client that checked the status code alone would
/// treat a missing key as an empty history — and silently conclude the
/// commander had never been anywhere.
abstract final class EdsmMessage {
  static const int ok = 100;
  static const int missingApiKey = 202;
  static const int unknownCommanderOrKey = 203;

  static bool isSuccess(int? msgnum) => msgnum == ok;
}
