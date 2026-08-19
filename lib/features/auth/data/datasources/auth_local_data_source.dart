import 'package:injectable/injectable.dart';

import '../../../../core/config/build_config.dart';
import '../../../../core/storage/key_value_store.dart';
import '../../../../core/storage/secure_store.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../domain/entities/frontier_session.dart';
import '../../domain/entities/oauth_client_config.dart';

/// Persists the OAuth session and resolves the effective client configuration.
///
/// Tokens and the client id live in [SecureStore] (Keychain / Keystore /
/// libsecret / DPAPI); only the redirect URI, which is not a secret, goes to
/// the plain store. The client id additionally falls back to [BuildConfig],
/// so a build made with a `.env` works without the commander typing anything.
@lazySingleton
class AuthLocalDataSource {
  const AuthLocalDataSource(
    this._secureStore,
    this._keyValueStore,
    this._buildConfig,
  );

  final SecureStore _secureStore;
  final KeyValueStore _keyValueStore;
  final BuildConfig _buildConfig;

  static const String _authorisedAtKey = 'frontier.authorised_at';
  static const String _customerIdKey = 'frontier.customer_id';
  static const String _tokenTypeKey = 'frontier.token_type';

  /// The client id saved on this device wins; the value compiled into the
  /// build serves when there is none. An empty saved value means the commander
  /// cleared the field to come back to the build default, so it is treated as
  /// nothing saved rather than as "no client at all".
  Future<OAuthClientConfig> readClientConfig() async {
    final String saved =
        await _secureStore.read(StorageKeys.oauthClientId) ?? '';
    final String compiled = _buildConfig.frontierClientId;
    return OAuthClientConfig(
      clientId: saved.isEmpty ? compiled : saved,
      redirectUri:
          await _keyValueStore.readString(StorageKeys.oauthRedirectUri) ?? '',
      clientIdIsBuildDefault: saved.isEmpty && compiled.isNotEmpty,
    );
  }

  Future<void> writeClientConfig(OAuthClientConfig config) async {
    await _secureStore.write(StorageKeys.oauthClientId, config.clientId);
    await _keyValueStore.writeString(
      StorageKeys.oauthRedirectUri,
      config.redirectUri,
    );
  }

  Future<FrontierSession?> readSession() async {
    final String? accessToken =
        await _secureStore.read(StorageKeys.accessToken);
    final String? refreshToken =
        await _secureStore.read(StorageKeys.refreshToken);
    final String? expiry = await _secureStore.read(StorageKeys.tokenExpiry);
    if (accessToken == null || refreshToken == null || expiry == null) {
      return null;
    }
    final DateTime? expiresAt = DateTime.tryParse(expiry);
    if (expiresAt == null) {
      return null;
    }
    final String? authorisedAt = await _secureStore.read(_authorisedAtKey);
    final String? customerId = await _secureStore.read(_customerIdKey);

    return FrontierSession(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
      authorisedAt: DateTime.tryParse(authorisedAt ?? '') ?? expiresAt,
      tokenType: await _secureStore.read(_tokenTypeKey) ?? 'Bearer',
      customerId: customerId == null ? null : int.tryParse(customerId),
    );
  }

  /// Writes the refresh token **first**: it is rotated on every exchange, and
  /// losing it is unrecoverable, whereas a stale access token merely triggers
  /// one extra refresh.
  Future<void> writeSession(FrontierSession session) async {
    await _secureStore.write(StorageKeys.refreshToken, session.refreshToken);
    await _secureStore.write(StorageKeys.accessToken, session.accessToken);
    await _secureStore.write(
      StorageKeys.tokenExpiry,
      session.expiresAt.toIso8601String(),
    );
    await _secureStore.write(
      _authorisedAtKey,
      session.authorisedAt.toIso8601String(),
    );
    await _secureStore.write(_tokenTypeKey, session.tokenType);
    if (session.customerId != null) {
      await _secureStore.write(_customerIdKey, session.customerId.toString());
    }
  }

  Future<void> clearSession() async {
    await _secureStore.delete(StorageKeys.accessToken);
    await _secureStore.delete(StorageKeys.refreshToken);
    await _secureStore.delete(StorageKeys.tokenExpiry);
    await _secureStore.delete(_authorisedAtKey);
    await _secureStore.delete(_customerIdKey);
    await _secureStore.delete(_tokenTypeKey);
  }

  Future<void> writePendingFlow({
    required String verifier,
    required String state,
  }) async {
    await _secureStore.write(StorageKeys.pkceVerifier, verifier);
    await _secureStore.write(StorageKeys.oauthState, state);
  }

  Future<({String? verifier, String? state})> readPendingFlow() async => (
        verifier: await _secureStore.read(StorageKeys.pkceVerifier),
        state: await _secureStore.read(StorageKeys.oauthState),
      );

  Future<void> clearPendingFlow() async {
    await _secureStore.delete(StorageKeys.pkceVerifier);
    await _secureStore.delete(StorageKeys.oauthState);
  }
}
