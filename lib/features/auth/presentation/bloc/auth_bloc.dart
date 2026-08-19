import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/auth_status.dart';
import '../../domain/entities/frontier_session.dart';
import '../../domain/entities/oauth_client_config.dart';
import '../../domain/usecases/auth_usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._watchStatus,
    this._signIn,
    this._signOut,
    this._getConfig,
    this._saveConfig,
  ) : super(const AuthInitial()) {
    on<AuthWatchStarted>(_onWatchStarted);
    on<AuthStatusChanged>(_onStatusChanged);
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthSignOutRequested>(_onSignOutRequested);
    on<AuthClientConfigSubmitted>(_onConfigSubmitted);
  }

  final WatchAuthStatus _watchStatus;
  final SignInToFrontier _signIn;
  final SignOutFromFrontier _signOut;
  final GetOAuthClientConfig _getConfig;
  final SaveOAuthClientConfig _saveConfig;

  StreamSubscription<AuthStatus>? _subscription;

  Future<void> _onWatchStarted(
    AuthWatchStarted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final Result<OAuthClientConfig> config = await _getConfig(const NoParams());
    await _subscription?.cancel();
    _subscription = _watchStatus(const NoParams()).listen(
      (AuthStatus status) => add(
        AuthStatusChanged(
          status,
          config.valueOrNull ?? const OAuthClientConfig.empty(),
        ),
      ),
    );
  }

  void _onStatusChanged(AuthStatusChanged event, Emitter<AuthState> emit) {
    emit(AuthReady(status: event.status, config: event.config));
  }

  Future<void> _onSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    final AuthState current = state;
    if (current is AuthReady) {
      emit(current.copyWith(isSigningIn: true, clearFailure: true));
    }
    final Result<FrontierSession> result = await _signIn(const NoParams());
    final AuthState next = state;
    if (next is AuthReady) {
      emit(
        next.copyWith(
          isSigningIn: false,
          failure: result.failureOrNull,
        ),
      );
    }
  }

  Future<void> _onSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _signOut(const NoParams());
  }

  Future<void> _onConfigSubmitted(
    AuthClientConfigSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    final Result<void> result = await _saveConfig(event.config);
    final AuthState current = state;
    if (current is AuthReady) {
      emit(
        result.failureOrNull == null
            ? current.copyWith(config: event.config, clearFailure: true)
            : current.copyWith(failure: result.failureOrNull),
      );
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
