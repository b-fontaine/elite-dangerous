import 'dart:io';

import 'package:elite_dangerous/features/auth/data/datasources/redirect_listener_factory.dart';
import 'package:flutter_test/flutter_test.dart';

/// The mobile redirect only works if the OS routes the scheme back to the app.
/// A Dart constant cannot enforce that on its own, so these tests pin the
/// native declarations to [RedirectListenerFactory.mobileRedirectUri]: renaming
/// the scheme without touching the manifest or the plist fails here instead of
/// stranding the commander in their browser.
void main() {
  final Uri redirect = Uri.parse(RedirectListenerFactory.mobileRedirectUri);

  group('mobile redirect URI', () {
    test('is a custom scheme with a host, not an http URL', () {
      expect(redirect.scheme, isNot(anyOf('http', 'https')));
      expect(redirect.scheme, isNotEmpty);
      expect(redirect.host, isNotEmpty);
    });
  });

  group('AndroidManifest.xml', () {
    final String manifest =
        File('android/app/src/main/AndroidManifest.xml').readAsStringSync();

    test('declares a VIEW intent-filter for the redirect scheme', () {
      final Iterable<String> filters =
          RegExp(r'<intent-filter>(.*?)</intent-filter>', dotAll: true)
              .allMatches(manifest)
              .map((RegExpMatch m) => m.group(1)!);

      expect(
        filters.where(
          (String filter) =>
              filter.contains('android.intent.action.VIEW') &&
              filter.contains('android.intent.category.BROWSABLE') &&
              filter.contains('android:scheme="${redirect.scheme}"') &&
              filter.contains('android:host="${redirect.host}"'),
        ),
        hasLength(1),
        reason: 'exactly one intent-filter must catch '
            '${RedirectListenerFactory.mobileRedirectUri}',
      );
    });

    test('keeps a launch mode that reuses the running activity', () {
      // app_links delivers the redirect through onNewIntent; a default
      // launchMode would start a second activity instead.
      expect(manifest, contains('android:launchMode="singleTop"'));
    });
  });

  group('ios/Runner/Info.plist', () {
    final String plist = File('ios/Runner/Info.plist').readAsStringSync();

    test('declares the redirect scheme in CFBundleURLTypes', () {
      final RegExpMatch? schemes = RegExp(
        r'<key>CFBundleURLSchemes</key>\s*<array>(.*?)</array>',
        dotAll: true,
      ).firstMatch(plist);

      expect(schemes, isNotNull,
          reason: 'CFBundleURLTypes is missing from Info.plist');
      expect(schemes!.group(1), contains('<string>${redirect.scheme}</string>'));
    });
  });
}
