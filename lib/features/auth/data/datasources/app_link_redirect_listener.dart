import 'dart:async';

import 'package:app_links/app_links.dart';

import 'oauth_redirect_listener.dart';

/// Mobile strategy: a custom URL scheme registered with the OS.
///
/// Frontier's documentation explicitly endorses this
/// (« register a custom URL scheme handler … e.g. `myapp://fd-auth-redirect` »).
/// The scheme must also be declared in `AndroidManifest.xml` (intent-filter)
/// and `ios/Runner/Info.plist` (`CFBundleURLTypes`); a test pins both to
/// [RedirectListenerFactory.mobileRedirectUri].
class AppLinkRedirectListener implements OAuthRedirectListener {
  AppLinkRedirectListener({
    required this.redirectUri,
    AppLinks? appLinks,
  }) : _appLinks = appLinks ?? AppLinks();

  /// The exact URI registered with the OS, e.g. `edcodex://auth`.
  final String redirectUri;

  final AppLinks _appLinks;
  StreamSubscription<Uri>? _subscription;
  final Completer<OAuthRedirectResult> _completer =
      Completer<OAuthRedirectResult>();

  @override
  Future<String> start() async {
    final Uri expected = Uri.parse(redirectUri);
    _subscription = _appLinks.uriLinkStream.listen((Uri uri) {
      if (uri.scheme != expected.scheme || uri.host != expected.host) {
        return;
      }
      if (!_completer.isCompleted) {
        _completer.complete(OAuthRedirectResult.fromUri(uri));
      }
    });
    return redirectUri;
  }

  @override
  Future<OAuthRedirectResult> awaitRedirect({required Duration timeout}) =>
      _completer.future.timeout(timeout);

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
  }
}
