import 'dart:async';

/// What Frontier sends back on the redirect URI.
class OAuthRedirectResult {
  const OAuthRedirectResult({this.code, this.state, this.error, this.errorDescription});

  final String? code;
  final String? state;
  final String? error;
  final String? errorDescription;

  bool get isSuccess => code != null && code!.isNotEmpty && error == null;

  String get failureMessage =>
      errorDescription ?? error ?? 'Réponse d\'autorisation invalide.';

  static OAuthRedirectResult fromUri(Uri uri) => OAuthRedirectResult(
        code: uri.queryParameters['code'],
        state: uri.queryParameters['state'],
        error: uri.queryParameters['error'],
        errorDescription: uri.queryParameters['error_description'] ??
            uri.queryParameters['message'],
      );
}

/// Receives the authorisation code back from the system browser.
///
/// The transport differs per platform — a loopback HTTP server on desktop, a
/// custom URL scheme on mobile — which is exactly why it sits behind a port:
/// [AuthRepository] should not know which one it got.
abstract interface class OAuthRedirectListener {
  /// Starts listening and returns the redirect URI to advertise to Frontier.
  ///
  /// Must be called *before* opening the browser, so the desktop listener has
  /// already bound its port when the callback arrives.
  Future<String> start();

  /// Resolves when the redirect arrives, or throws [TimeoutException].
  Future<OAuthRedirectResult> awaitRedirect({required Duration timeout});

  Future<void> dispose();
}
