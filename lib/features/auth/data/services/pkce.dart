import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

/// RFC 7636 PKCE pair for the Frontier authorisation flow.
///
/// Frontier only supports the `S256` method. Note that the challenge is the
/// SHA-256 of the *ASCII characters of the encoded verifier*, not of the 32
/// random bytes — that is what the RFC prescribes and what Frontier expects.
class PkceChallenge {
  const PkceChallenge._(this.verifier, this.challenge);

  /// Draws 32 cryptographically secure random bytes and derives the pair.
  factory PkceChallenge.generate() =>
      PkceChallenge.fromVerifier(_base64Url(_randomBytes(32)));

  /// Rebuilds the pair from a verifier persisted before the browser round-trip.
  factory PkceChallenge.fromVerifier(String verifier) => PkceChallenge._(
        verifier,
        _base64Url(sha256.convert(ascii.encode(verifier)).bytes),
      );

  /// 43 characters of unreserved URL-safe base64, no padding.
  final String verifier;

  final String challenge;

  String get method => 'S256';

  static List<int> _randomBytes(int length) {
    final Random random = Random.secure();
    return List<int>.generate(length, (_) => random.nextInt(256));
  }

  /// Base64url without the `=` padding, exactly as EDMC does it.
  static String _base64Url(List<int> bytes) =>
      base64Url.encode(bytes).replaceAll('=', '');
}

/// CSRF token echoed back by Frontier in the redirect.
///
/// With PKCE and a redirect URI that Frontier does not appear to whitelist,
/// validating this value is the app's only defence against a forged callback,
/// so it is never optional.
abstract final class OAuthState {
  static String generate() {
    final Random random = Random.secure();
    final List<int> bytes = List<int>.generate(32, (_) => random.nextInt(256));
    return base64Url.encode(bytes).replaceAll('=', '');
  }
}
