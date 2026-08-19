import 'package:injectable/injectable.dart';

import '../../../core/network/access_token_provider.dart';
import '../../../core/result/result.dart';
import '../../../core/time/clock.dart';
import '../domain/entities/frontier_session.dart';
import '../domain/repositories/auth_repository.dart';
import 'datasources/auth_local_data_source.dart';

/// Bridges the auth feature to the network layer's [AuthInterceptor].
///
/// Reads straight from local storage rather than through the repository, so
/// attaching a token to a request never triggers the repository's status
/// stream — that would turn every API call into a UI rebuild.
@LazySingleton(as: AccessTokenProvider)
class FrontierAccessTokenProvider implements AccessTokenProvider {
  const FrontierAccessTokenProvider(this._local, this._authRepository, this._clock);

  final AuthLocalDataSource _local;
  final AuthRepository _authRepository;
  final Clock _clock;

  @override
  Future<String?> currentAccessToken() async {
    final FrontierSession? session = await _local.readSession();
    if (session == null) {
      return null;
    }
    // Refresh proactively so a request never dies on an expiry we saw coming.
    if (session.needsRefreshAt(_clock.now())) {
      return await refreshAccessToken() ?? session.accessToken;
    }
    return session.accessToken;
  }

  @override
  Future<String?> refreshAccessToken() async {
    final Result<FrontierSession> refreshed = await _authRepository.refresh();
    return refreshed.valueOrNull?.accessToken;
  }

  @override
  Future<void> onSessionLost() async {
    await _authRepository.signOut();
  }
}
