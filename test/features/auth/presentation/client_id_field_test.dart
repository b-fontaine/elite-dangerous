import 'package:elite_dangerous/features/auth/domain/entities/oauth_client_config.dart';
import 'package:elite_dangerous/features/auth/presentation/pages/frontier_connection_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('clientIdHelperText', () {
    test('says so when the value comes from the build', () {
      const OAuthClientConfig config = OAuthClientConfig(
        clientId: 'BUILD-0000',
        redirectUri: '',
        clientIdIsBuildDefault: true,
      );

      expect(clientIdHelperText(config), isNotNull);
      expect(clientIdHelperText(config), contains('build'));
    });

    test('stays silent for a value typed on this device', () {
      const OAuthClientConfig config = OAuthClientConfig(
        clientId: 'TYPED-1111',
        redirectUri: '',
      );

      expect(clientIdHelperText(config), isNull);
    });

    test('stays silent when there is no value at all', () {
      expect(clientIdHelperText(const OAuthClientConfig.empty()), isNull);
    });
  });

  group('initialClientIdFieldValue', () {
    test('never puts the build default on screen', () {
      const OAuthClientConfig config = OAuthClientConfig(
        clientId: 'BUILD-0000',
        redirectUri: '',
        clientIdIsBuildDefault: true,
      );

      expect(initialClientIdFieldValue(config), isEmpty);
    });

    test('brings back a value the commander saved themselves', () {
      const OAuthClientConfig config = OAuthClientConfig(
        clientId: 'TYPED-1111',
        redirectUri: '',
      );

      expect(initialClientIdFieldValue(config), 'TYPED-1111');
    });

    test('is empty when nothing is configured', () {
      expect(initialClientIdFieldValue(const OAuthClientConfig.empty()),
          isEmpty);
    });
  });
}
