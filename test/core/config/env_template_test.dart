import 'dart:convert';
import 'dart:io';

import 'package:elite_dangerous/core/config/build_config.dart';
import 'package:flutter_test/flutter_test.dart';

/// `.env.template` is the only documentation a contributor reads before
/// creating their own `.env`. If it drifts from the keys the code actually
/// reads, the build silently produces an app with no client id — so the
/// template is pinned to [BuildConfig] rather than to a copied literal.
void main() {
  final File template = File('.env.template');

  /// `KEY=value` pairs, comments and blank lines removed.
  Map<String, String> parse(String contents) {
    final Map<String, String> entries = <String, String>{};
    for (final String line in const LineSplitter().convert(contents)) {
      final String trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#')) {
        continue;
      }
      final int separator = trimmed.indexOf('=');
      expect(separator, greaterThan(0),
          reason: 'ligne ni commentaire ni CLÉ=valeur : "$line"');
      entries[trimmed.substring(0, separator).trim()] =
          trimmed.substring(separator + 1).trim();
    }
    return entries;
  }

  group('.env.template', () {
    test('is committed', () {
      expect(template.existsSync(), isTrue);
    });

    test('declares exactly the keys the code reads', () {
      expect(
        parse(template.readAsStringSync()).keys.toSet(),
        <String>{BuildConfig.frontierClientIdKey},
      );
    });

    test('carries no value', () {
      // A filled-in template is a client id committed to a public repository.
      expect(
        parse(template.readAsStringSync()).values.where((String v) => v.isNotEmpty),
        isEmpty,
      );
    });
  });
}
