import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'app_link_redirect_listener.dart';
import 'loopback_redirect_listener.dart';
import 'oauth_redirect_listener.dart';

/// Picks the redirect transport that fits the host platform.
///
/// Desktop gets a loopback HTTP server (EDMC's strategy); mobile gets a custom
/// URL scheme, which Frontier's own documentation recommends. Web is refused
/// on purpose: a browser cannot register a custom scheme, and it is unknown
/// whether Frontier's hosts send CORS headers — so a web build would need a
/// backend proxy, which this app deliberately does not have.
@lazySingleton
class RedirectListenerFactory {
  const RedirectListenerFactory();

  /// Custom scheme registered in `AndroidManifest.xml` and
  /// `ios/Runner/Info.plist`. macOS is deliberately absent: it takes the
  /// loopback branch below, so the scheme would be dead configuration there.
  static const String mobileRedirectUri = 'edcodex://auth';

  bool get isSupported => !kIsWeb;

  OAuthRedirectListener create({String? configuredRedirectUri}) {
    if (kIsWeb) {
      throw UnsupportedError(
        'La connexion au compte Frontier n\'est pas disponible sur le web : '
        'elle exige un schéma d\'URL natif ou un serveur local.',
      );
    }
    return switch (defaultTargetPlatform) {
      TargetPlatform.android || TargetPlatform.iOS => AppLinkRedirectListener(
          redirectUri: configuredRedirectUri?.isNotEmpty ?? false
              ? configuredRedirectUri!
              : mobileRedirectUri,
        ),
      _ => LoopbackRedirectListener(),
    };
  }

  /// The redirect URI to show in the settings screen so the commander can
  /// declare it to Frontier if their client requires a fixed one.
  String get defaultRedirectUri => switch (defaultTargetPlatform) {
        TargetPlatform.android || TargetPlatform.iOS => mobileRedirectUri,
        _ => 'http://localhost:<port attribué>/auth',
      };
}
