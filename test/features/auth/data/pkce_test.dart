import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:elite_dangerous/features/auth/data/services/pkce.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PkceChallenge', () {
    test('generates a verifier of 43 URL-safe characters', () {
      final PkceChallenge challenge = PkceChallenge.generate();

      expect(challenge.verifier, hasLength(43));
      expect(RegExp(r'^[A-Za-z0-9\-_]+$').hasMatch(challenge.verifier), isTrue);
    });

    test('never emits base64 padding', () {
      for (int i = 0; i < 50; i++) {
        final PkceChallenge challenge = PkceChallenge.generate();
        expect(challenge.verifier, isNot(contains('=')));
        expect(challenge.challenge, isNot(contains('=')));
      }
    });

    test('the challenge is S256 over the ASCII bytes of the verifier', () {
      final PkceChallenge challenge = PkceChallenge.generate();

      final String expected = base64Url
          .encode(sha256.convert(ascii.encode(challenge.verifier)).bytes)
          .replaceAll('=', '');
      expect(challenge.challenge, expected);
    });

    test('declares the S256 method', () {
      expect(PkceChallenge.generate().method, 'S256');
    });

    test('two challenges are different', () {
      expect(
        PkceChallenge.generate().verifier,
        isNot(PkceChallenge.generate().verifier),
      );
    });

    test('can be rebuilt from a stored verifier', () {
      final PkceChallenge original = PkceChallenge.generate();
      final PkceChallenge restored =
          PkceChallenge.fromVerifier(original.verifier);

      expect(restored.challenge, original.challenge);
    });
  });

  group('OAuthState', () {
    test('generates 43 URL-safe characters without padding', () {
      final String state = OAuthState.generate();

      expect(state, hasLength(43));
      expect(state, isNot(contains('=')));
      expect(RegExp(r'^[A-Za-z0-9\-_]+$').hasMatch(state), isTrue);
    });

    test('two states are different', () {
      expect(OAuthState.generate(), isNot(OAuthState.generate()));
    });
  });
}
