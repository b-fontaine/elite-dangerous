/// Bridges the network layer and the auth feature without a circular
/// dependency: [AuthInterceptor] needs a bearer token, but the auth repository
/// needs a `Dio` to obtain one.
///
/// The auth feature implements this port; the interceptor only ever sees it.
abstract interface class AccessTokenProvider {
  /// Current access token, or `null` when the commander is signed out.
  Future<String?> currentAccessToken();

  /// Attempts a refresh-token exchange.
  ///
  /// Returns the new access token, or `null` when the session cannot be
  /// recovered (no refresh token, refresh rejected).
  Future<String?> refreshAccessToken();

  /// Called when a refresh definitively failed, so the app can drop the
  /// session and prompt for a new sign-in.
  Future<void> onSessionLost();
}
