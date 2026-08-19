import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// The sandbox macOS runs the app in has to be opened twice for the Frontier
/// sign-in to work: outgoing for the OAuth and Companion API calls, incoming
/// for the loopback listener `RedirectListenerFactory` starts on desktop.
///
/// The debug entitlements ship with a network server exception of their own
/// (the Dart VM service needs it), so a missing release entitlement stays
/// invisible until the build that reaches commanders. These tests hold both
/// files to the same contract.
void main() {
  bool grants(String entitlements, String key) => RegExp(
        '<key>${RegExp.escape(key)}</key>\\s*<true\\s*/>',
      ).hasMatch(entitlements);

  const Map<String, String> files = <String, String>{
    'DebugProfile': 'macos/Runner/DebugProfile.entitlements',
    'Release': 'macos/Runner/Release.entitlements',
  };

  files.forEach((String name, String path) {
    group('$name.entitlements', () {
      final String entitlements = File(path).readAsStringSync();

      test('stays sandboxed', () {
        expect(grants(entitlements, 'com.apple.security.app-sandbox'), isTrue);
      });

      test('allows outgoing connections to Frontier', () {
        expect(
          grants(entitlements, 'com.apple.security.network.client'),
          isTrue,
          reason: 'without it every call to auth.frontierstore.net and '
              'companion.orerve.net fails inside the sandbox',
        );
      });

      test('allows the loopback redirect listener to bind a port', () {
        expect(
          grants(entitlements, 'com.apple.security.network.server'),
          isTrue,
          reason: 'LoopbackRedirectListener cannot accept the OAuth redirect '
              'without it',
        );
      });
    });
  });
}
