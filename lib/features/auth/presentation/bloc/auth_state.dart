part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => const <Object?>[];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthReady extends AuthState {
  const AuthReady({
    required this.status,
    required this.config,
    this.isSigningIn = false,
    this.failure,
  });

  final AuthStatus status;
  final OAuthClientConfig config;

  /// True while the browser is open and the redirect has not come back.
  final bool isSigningIn;

  final Failure? failure;

  bool get isSignedIn => status is AuthSignedIn;

  bool get needsClientId => status is AuthUnconfigured;

  bool get needsReauthorisation => status is AuthReauthorisationRequired;

  FrontierSession? get session => switch (status) {
        AuthSignedIn(:final FrontierSession session) => session,
        _ => null,
      };

  AuthReady copyWith({
    AuthStatus? status,
    OAuthClientConfig? config,
    bool? isSigningIn,
    Failure? failure,
    bool clearFailure = false,
  }) =>
      AuthReady(
        status: status ?? this.status,
        config: config ?? this.config,
        isSigningIn: isSigningIn ?? this.isSigningIn,
        failure: clearFailure ? null : (failure ?? this.failure),
      );

  @override
  List<Object?> get props => <Object?>[status, config, isSigningIn, failure];
}
