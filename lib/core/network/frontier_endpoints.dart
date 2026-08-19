/// Frontier Developments' Companion API (CAPI) endpoints.
///
/// These are the hosts every third-party tool (EDMC, EDDiscovery, Observatory)
/// talks to. They are read-only and rate-limited; Frontier explicitly allows
/// journal/CAPI reads while forbidding memory injection.
abstract final class FrontierEndpoints {
  /// OAuth2 authorisation server.
  static const String authBaseUrl = 'https://auth.frontierstore.net';
  static const String authorizePath = '/auth';
  static const String tokenPath = '/token';
  static const String decodePath = '/decode';

  /// Companion API data server.
  static const String apiBaseUrl = 'https://companion.orerve.net';
  static const String profilePath = '/profile';
  static const String journalPath = '/journal';
  static const String marketPath = '/market';
  static const String shipyardPath = '/shipyard';
  static const String fleetCarrierPath = '/fleetcarrier';
  static const String visitedStarsPath = '/visitedstars';

  /// The scope EDMC requests; grants read access to the profile and journals.
  static const String scope = 'auth capi';

  /// `/journal/{year}/{month}/{day}` for a given UTC day.
  static String journalForDay(DateTime dayUtc) {
    final String year = dayUtc.year.toString().padLeft(4, '0');
    final String month = dayUtc.month.toString().padLeft(2, '0');
    final String day = dayUtc.day.toString().padLeft(2, '0');
    return '$journalPath/$year/$month/$day';
  }
}
