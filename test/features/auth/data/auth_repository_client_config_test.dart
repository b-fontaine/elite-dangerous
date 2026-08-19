import 'package:elite_dangerous/core/config/build_config.dart';
import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/core/time/clock.dart';
import 'package:elite_dangerous/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:elite_dangerous/features/auth/data/datasources/frontier_auth_api.dart';
import 'package:elite_dangerous/features/auth/data/datasources/redirect_listener_factory.dart';
import 'package:elite_dangerous/features/auth/data/models/token_response_dto.dart';
import 'package:elite_dangerous/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:elite_dangerous/features/auth/data/services/browser_launcher.dart';
import 'package:elite_dangerous/features/auth/domain/entities/oauth_client_config.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/in_memory_stores.dart';

class _FakeBuildConfig implements BuildConfig {
  const _FakeBuildConfig(this.frontierClientId);

  @override
  final String frontierClientId;
}

/// Collaborators `saveClientConfig` never reaches. They throw rather than
/// return a plausible value, so a test that starts depending on them fails
/// loudly instead of passing on a fiction.
class _UnusedAuthApi implements FrontierAuthApi {
  @override
  Future<TokenResponseDto> exchangeAuthorizationCode({
    String grantType = 'authorization_code',
    required String clientId,
    required String code,
    required String codeVerifier,
    required String redirectUri,
  }) =>
      throw UnimplementedError();

  @override
  Future<TokenResponseDto> refreshAccessToken({
    String grantType = 'refresh_token',
    required String clientId,
    required String refreshToken,
  }) =>
      throw UnimplementedError();

  @override
  Future<DecodeResponseDto> decode(String authorization) =>
      throw UnimplementedError();
}

class _UnusedBrowser implements BrowserLauncher {
  @override
  Future<bool> open(Uri url) => throw UnimplementedError();
}

class _FixedClock implements Clock {
  @override
  DateTime now() => DateTime.utc(3307);
}

void main() {
  const String compiled = 'BUILD-0000-0000-0000';
  const String typed = 'TYPED-1111-1111-1111';

  ({AuthRepositoryImpl repository, AuthLocalDataSource local}) build({
    String buildClientId = '',
  }) {
    final AuthLocalDataSource local = AuthLocalDataSource(
      InMemorySecureStore(),
      InMemoryKeyValueStore(),
      _FakeBuildConfig(buildClientId),
    );
    return (
      repository: AuthRepositoryImpl(
        _UnusedAuthApi(),
        local,
        const RedirectListenerFactory(),
        _UnusedBrowser(),
        _FixedClock(),
        _FakeBuildConfig(buildClientId),
      ),
      local: local,
    );
  }

  group('saveClientConfig', () {
    test('stores what the commander typed', () async {
      final ({AuthRepositoryImpl repository, AuthLocalDataSource local}) sut =
          build(buildClientId: compiled);

      final Result<void> result = await sut.repository.saveClientConfig(
        const OAuthClientConfig(clientId: typed, redirectUri: ''),
      );

      expect(result.isSuccess, isTrue);
      final OAuthClientConfig stored = await sut.local.readClientConfig();
      expect(stored.clientId, typed);
      expect(stored.clientIdIsBuildDefault, isFalse);
    });

    test('an empty submission comes back to the build default', () async {
      final ({AuthRepositoryImpl repository, AuthLocalDataSource local}) sut =
          build(buildClientId: compiled);
      await sut.repository.saveClientConfig(
        const OAuthClientConfig(clientId: typed, redirectUri: ''),
      );

      final Result<void> result = await sut.repository.saveClientConfig(
        const OAuthClientConfig(clientId: '', redirectUri: ''),
      );

      expect(result.isSuccess, isTrue);
      final OAuthClientConfig stored = await sut.local.readClientConfig();
      expect(stored.clientId, compiled);
      expect(stored.clientIdIsBuildDefault, isTrue);
    });

    test('an empty submission is refused when the build has no default',
        () async {
      final ({AuthRepositoryImpl repository, AuthLocalDataSource local}) sut =
          build();

      final Result<void> result = await sut.repository.saveClientConfig(
        const OAuthClientConfig(clientId: '', redirectUri: ''),
      );

      expect(result.isFailure, isTrue);
      expect(result.failureOrNull, isA<ValidationFailure>());
      expect(
        (result.failureOrNull! as ValidationFailure).field,
        'clientId',
      );
    });
  });
}
