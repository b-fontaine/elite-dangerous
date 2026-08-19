part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

final class AuthWatchStarted extends AuthEvent {
  const AuthWatchStarted();
}

/// Internal: the repository reported a new status.
final class AuthStatusChanged extends AuthEvent {
  const AuthStatusChanged(this.status, this.config);

  final AuthStatus status;
  final OAuthClientConfig config;

  @override
  List<Object?> get props => <Object?>[status, config];
}

/// Opens the browser on Frontier's consent screen.
final class AuthSignInRequested extends AuthEvent {
  const AuthSignInRequested();
}

final class AuthSignOutRequested extends AuthEvent {
  const AuthSignOutRequested();
}

final class AuthClientConfigSubmitted extends AuthEvent {
  const AuthClientConfigSubmitted(this.config);

  final OAuthClientConfig config;

  @override
  List<Object?> get props => <Object?>[config];
}
