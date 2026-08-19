import '../../../../core/lifecycle/disposable.dart';
import '../../../../core/result/result.dart';
import '../entities/auth_status.dart';
import '../entities/frontier_session.dart';
import '../entities/oauth_client_config.dart';

/// The Frontier OAuth session lifecycle.
abstract interface class AuthRepository implements Disposable {
  /// Current status, then every subsequent change.
  Stream<AuthStatus> watchStatus();

  Future<Result<AuthStatus>> currentStatus();

  Future<Result<OAuthClientConfig>> clientConfig();

  Future<Result<void>> saveClientConfig(OAuthClientConfig config);

  /// Opens the system browser on Frontier's consent screen and waits for the
  /// redirect to come back.
  ///
  /// Returns [CancelledFailure] if the commander closes the browser, and
  /// [AuthConfigurationFailure] if no client id has been configured.
  Future<Result<FrontierSession>> signIn();

  /// Forces a refresh-token exchange.
  Future<Result<FrontierSession>> refresh();

  Future<Result<void>> signOut();
}
