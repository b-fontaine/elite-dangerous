import 'package:elite_dangerous/core/config/build_config.dart';
import 'package:elite_dangerous/core/storage/storage_keys.dart';
import 'package:elite_dangerous/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:elite_dangerous/features/auth/domain/entities/oauth_client_config.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/in_memory_stores.dart';

/// A [BuildConfig] whose compiled value is chosen by the test.
///
/// `String.fromEnvironment` is a compile-time constant and cannot be varied
/// from a test, which is the whole reason [BuildConfig] is injected rather
/// than read statically.
class _FakeBuildConfig implements BuildConfig {
  const _FakeBuildConfig(this.frontierClientId);

  @override
  final String frontierClientId;
}

void main() {
  const String compiled = 'BUILD-0000-0000-0000';
  const String saved = 'SAVED-1111-1111-1111';

  AuthLocalDataSource subject({
    String? savedClientId,
    String buildClientId = '',
  }) =>
      AuthLocalDataSource(
        InMemorySecureStore(<String, String>{
          StorageKeys.oauthClientId: ?savedClientId,
        }),
        InMemoryKeyValueStore(),
        _FakeBuildConfig(buildClientId),
      );

  group('readClientConfig', () {
    test('serves the value saved on the device', () async {
      final OAuthClientConfig config =
          await subject(savedClientId: saved, buildClientId: compiled)
              .readClientConfig();

      expect(config.clientId, saved);
      expect(config.clientIdIsBuildDefault, isFalse);
    });

    test('falls back to the compiled value when nothing is saved', () async {
      final OAuthClientConfig config =
          await subject(buildClientId: compiled).readClientConfig();

      expect(config.clientId, compiled);
      expect(config.clientIdIsBuildDefault, isTrue);
    });

    test('treats a saved empty string as nothing saved', () async {
      // Clearing the field writes an empty string; the commander is asking to
      // go back to the build default, not to have no client at all.
      final OAuthClientConfig config =
          await subject(savedClientId: '', buildClientId: compiled)
              .readClientConfig();

      expect(config.clientId, compiled);
      expect(config.clientIdIsBuildDefault, isTrue);
    });

    test('stays empty when neither source has a value', () async {
      final OAuthClientConfig config = await subject().readClientConfig();

      expect(config.clientId, isEmpty);
      expect(config.clientIdIsBuildDefault, isFalse);
      expect(config.isConfigured, isFalse);
    });
  });
}
