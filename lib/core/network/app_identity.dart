/// Identity this app presents to Frontier.
///
/// Frontier expects a `User-Agent` that identifies the tool; EDMC sets one on
/// every request and the API is known to behave badly without it.
abstract final class AppIdentity {
  static const String name = 'CodexExobiologique';
  static const String version = '1.0.0';
  static const String userAgent = '$name/$version';
}
