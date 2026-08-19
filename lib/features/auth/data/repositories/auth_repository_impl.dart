import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/config/build_config.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../../../core/result/result.dart';
import '../../../../core/stream/initial_then.dart';
import '../../../../core/time/clock.dart';
import '../../domain/entities/auth_status.dart';
import '../../domain/entities/frontier_session.dart';
import '../../domain/entities/oauth_client_config.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/frontier_auth_api.dart';
import '../datasources/oauth_redirect_listener.dart';
import '../datasources/redirect_listener_factory.dart';
import '../models/token_response_dto.dart';
import '../services/authorization_url_builder.dart';
import '../services/browser_launcher.dart';
import '../services/pkce.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._api,
    this._local,
    this._listenerFactory,
    this._browser,
    this._clock,
    this._buildConfig,
  );

  final FrontierAuthApi _api;
  final AuthLocalDataSource _local;
  final RedirectListenerFactory _listenerFactory;
  final BrowserLauncher _browser;
  final Clock _clock;
  final BuildConfig _buildConfig;

  final StreamController<AuthStatus> _statusController =
      StreamController<AuthStatus>.broadcast();

  /// How long to wait for the commander to finish the browser consent screen.
  static const Duration consentTimeout = Duration(minutes: 5);

  @override
  Stream<AuthStatus> watchStatus() => initialThen<AuthStatus>(
        () async =>
            (await currentStatus()).getOrElse((_) => const AuthSignedOut()),
        _statusController.stream,
      );

  @override
  Future<Result<AuthStatus>> currentStatus() => guard(() async {
        final OAuthClientConfig config = await _local.readClientConfig();
        if (config.clientId.isEmpty) {
          return const AuthUnconfigured();
        }
        final FrontierSession? session = await _local.readSession();
        if (session == null) {
          return const AuthSignedOut();
        }
        if (session.isBeyondRefreshWindowAt(_clock.now())) {
          return const AuthReauthorisationRequired();
        }
        return AuthSignedIn(session);
      });

  @override
  Future<Result<OAuthClientConfig>> clientConfig() =>
      guard(_local.readClientConfig);

  @override
  /// An empty client id clears the device override so the build default takes
  /// over again. It is only an error when the build has no default to come
  /// back to, which would otherwise leave the commander with no client at all.
  Future<Result<void>> saveClientConfig(OAuthClientConfig config) async {
    final String clientId = config.clientId.trim();
    if (clientId.isEmpty && _buildConfig.frontierClientId.isEmpty) {
      return const ResultFailure<void>(
        ValidationFailure(
          message: 'Le client_id Frontier ne peut pas être vide.',
          field: 'clientId',
        ),
      );
    }
    final Result<void> result = await guard(() async {
      await _local.writeClientConfig(
        OAuthClientConfig(
          clientId: clientId,
          redirectUri: config.redirectUri.trim().isEmpty
              ? RedirectListenerFactory.mobileRedirectUri
              : config.redirectUri.trim(),
        ),
      );
    });
    if (result.isSuccess) {
      await _emitCurrentStatus();
    }
    return result;
  }

  @override
  Future<Result<FrontierSession>> signIn() async {
    final OAuthClientConfig config = await _local.readClientConfig();
    if (config.clientId.isEmpty) {
      return const ResultFailure<FrontierSession>(AuthConfigurationFailure());
    }
    if (!_listenerFactory.isSupported) {
      return const ResultFailure<FrontierSession>(
        ValidationFailure(
          message: 'La connexion Frontier n\'est pas disponible sur le web. '
              'Utilise l\'import de journaux local, ou l\'application mobile '
              'ou desktop.',
        ),
      );
    }

    OAuthRedirectListener? listener;
    try {
      listener = _listenerFactory.create(
        configuredRedirectUri: config.redirectUri,
      );
      final String redirectUri = await listener.start();
      final PkceChallenge pkce = PkceChallenge.generate();
      final String state = OAuthState.generate();
      await _local.writePendingFlow(verifier: pkce.verifier, state: state);

      final Uri authorizationUrl = AuthorizationUrlBuilder.build(
        clientId: config.clientId,
        redirectUri: redirectUri,
        pkce: pkce,
        state: state,
      );
      if (!await _browser.open(authorizationUrl)) {
        return const ResultFailure<FrontierSession>(
          UnexpectedFailure(
            message: 'Impossible d\'ouvrir le navigateur pour la connexion '
                'Frontier.',
          ),
        );
      }

      final OAuthRedirectResult redirect =
          await listener.awaitRedirect(timeout: consentTimeout);

      // The redirect URI is not whitelisted by Frontier, so this check is the
      // only thing standing between us and a forged callback.
      if (redirect.state != state) {
        return const ResultFailure<FrontierSession>(
          UnauthorizedFailure(
            message: 'Réponse d\'autorisation rejetée : jeton anti-CSRF '
                'invalide.',
          ),
        );
      }
      if (!redirect.isSuccess) {
        return ResultFailure<FrontierSession>(
          UnauthorizedFailure(message: redirect.failureMessage),
        );
      }

      final TokenResponseDto tokens = await _api.exchangeAuthorizationCode(
        clientId: config.clientId,
        code: redirect.code!,
        codeVerifier: pkce.verifier,
        redirectUri: redirectUri,
      );

      final DateTime now = _clock.now();
      FrontierSession session = FrontierSession(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
        expiresAt: now.add(Duration(seconds: tokens.expiresIn)),
        authorisedAt: now,
        tokenType: tokens.tokenType,
      );
      session = session.copyWith(
        customerId: await _readCustomerId(session),
      );

      await _local.writeSession(session);
      await _local.clearPendingFlow();
      _statusController.add(AuthSignedIn(session));
      return Success<FrontierSession>(session);
    } on TimeoutException {
      return const ResultFailure<FrontierSession>(
        CancelledFailure(
          message: 'Connexion Frontier abandonnée : aucune réponse du '
              'navigateur.',
        ),
      );
    } on UnsupportedError catch (error) {
      return ResultFailure<FrontierSession>(
        ValidationFailure(message: error.message ?? 'Plateforme non supportée.'),
      );
    } catch (error, stackTrace) {
      return ResultFailure<FrontierSession>(mapDioError(error, stackTrace));
    } finally {
      await listener?.dispose();
    }
  }

  @override
  Future<Result<FrontierSession>> refresh() async {
    final OAuthClientConfig config = await _local.readClientConfig();
    final FrontierSession? current = await _local.readSession();
    if (config.clientId.isEmpty) {
      return const ResultFailure<FrontierSession>(AuthConfigurationFailure());
    }
    if (current == null) {
      return const ResultFailure<FrontierSession>(UnauthorizedFailure());
    }
    if (current.isBeyondRefreshWindowAt(_clock.now())) {
      _statusController.add(const AuthReauthorisationRequired());
      return const ResultFailure<FrontierSession>(
        UnauthorizedFailure(
          message: 'Frontier limite le rafraîchissement à 25 jours après la '
              'connexion. Reconnecte ton compte.',
        ),
      );
    }

    try {
      final TokenResponseDto tokens = await _api.refreshAccessToken(
        clientId: config.clientId,
        refreshToken: current.refreshToken,
      );
      final FrontierSession session = current.copyWith(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
        expiresAt: _clock.now().add(Duration(seconds: tokens.expiresIn)),
        tokenType: tokens.tokenType,
      );
      await _local.writeSession(session);
      _statusController.add(AuthSignedIn(session));
      return Success<FrontierSession>(session);
    } catch (error, stackTrace) {
      final Failure failure = mapDioError(error, stackTrace);
      if (failure is UnauthorizedFailure) {
        await _local.clearSession();
        _statusController.add(const AuthReauthorisationRequired());
      }
      return ResultFailure<FrontierSession>(failure);
    }
  }

  @override
  Future<Result<void>> signOut() async {
    final Result<void> result = await guard(() async {
      await _local.clearSession();
      await _local.clearPendingFlow();
    });
    await _emitCurrentStatus();
    return result;
  }

  /// Ties the session to a commander. Failing here is not fatal: the session
  /// works, we simply cannot cross-check the account, so the error is swallowed
  /// rather than aborting a successful sign-in.
  Future<int?> _readCustomerId(FrontierSession session) async {
    try {
      final DecodeResponseDto decoded =
          await _api.decode(session.authorizationHeader);
      return decoded.usr?.customerId;
    } catch (_) {
      return null;
    }
  }

  Future<void> _emitCurrentStatus() async {
    final Result<AuthStatus> status = await currentStatus();
    _statusController.add(status.getOrElse((_) => const AuthSignedOut()));
  }

  @disposeMethod
  @override
  Future<void> dispose() => _statusController.close();
}
