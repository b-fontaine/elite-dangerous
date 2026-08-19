import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_status.dart';
import '../entities/frontier_session.dart';
import '../entities/oauth_client_config.dart';
import '../repositories/auth_repository.dart';

/// Emits the commander's Frontier connection state.
@injectable
class WatchAuthStatus extends StreamUseCase<AuthStatus, NoParams> {
  const WatchAuthStatus(this._repository);

  final AuthRepository _repository;

  @override
  Stream<AuthStatus> call(NoParams input) => _repository.watchStatus();
}

/// Opens the browser and completes the OAuth exchange.
@injectable
class SignInToFrontier extends UseCase<FrontierSession, NoParams> {
  const SignInToFrontier(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<FrontierSession>> call(NoParams input) => _repository.signIn();
}

@injectable
class SignOutFromFrontier extends UseCase<void, NoParams> {
  const SignOutFromFrontier(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<void>> call(NoParams input) => _repository.signOut();
}

@injectable
class GetOAuthClientConfig extends UseCase<OAuthClientConfig, NoParams> {
  const GetOAuthClientConfig(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<OAuthClientConfig>> call(NoParams input) =>
      _repository.clientConfig();
}

@injectable
class SaveOAuthClientConfig extends UseCase<void, OAuthClientConfig> {
  const SaveOAuthClientConfig(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<void>> call(OAuthClientConfig input) =>
      _repository.saveClientConfig(input);
}

@injectable
class RefreshFrontierSession extends UseCase<FrontierSession, NoParams> {
  const RefreshFrontierSession(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<FrontierSession>> call(NoParams input) => _repository.refresh();
}
