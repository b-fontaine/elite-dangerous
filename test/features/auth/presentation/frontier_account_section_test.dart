import 'dart:async';

import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/core/stream/initial_then.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/auth/domain/entities/auth_status.dart';
import 'package:elite_dangerous/features/auth/domain/entities/frontier_session.dart';
import 'package:elite_dangerous/features/auth/domain/entities/oauth_client_config.dart';
import 'package:elite_dangerous/features/auth/domain/repositories/auth_repository.dart';
import 'package:elite_dangerous/features/auth/domain/usecases/auth_usecases.dart';
import 'package:elite_dangerous/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:elite_dangerous/features/auth/presentation/widgets/frontier_account_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

/// A repository that records what the section asks of it.
///
/// Real use cases and a real bloc sit on top: what is under test is the wiring
/// between a button and the OAuth flow, so only the outermost port is faked.
class _RecordingAuthRepository implements AuthRepository {
  _RecordingAuthRepository(this._status);

  final AuthStatus _status;
  final StreamController<AuthStatus> _statuses =
      StreamController<AuthStatus>.broadcast();

  int signInCalls = 0;
  int signOutCalls = 0;

  /// When set, [signIn] hangs on it — the browser is open and nothing has come
  /// back yet.
  Completer<Result<FrontierSession>>? holdSignIn;

  Result<FrontierSession> signInResult = const ResultFailure<FrontierSession>(
    CancelledFailure(message: 'jamais réclamé'),
  );

  /// Built the way the real repository builds it: a controller, never a
  /// generator. A suspended `async*` can only be wound down by the zone that
  /// drives it, and by teardown time the test's fake-async zone is gone — so
  /// closing the bloc would wait for a cancellation that can never happen.
  @override
  Stream<AuthStatus> watchStatus() =>
      initialThen<AuthStatus>(() async => _status, _statuses.stream);

  @override
  Future<Result<AuthStatus>> currentStatus() async =>
      Success<AuthStatus>(_status);

  @override
  Future<Result<OAuthClientConfig>> clientConfig() async =>
      const Success<OAuthClientConfig>(
        OAuthClientConfig(
          clientId: 'BUILD-0000',
          redirectUri: '',
          clientIdIsBuildDefault: true,
        ),
      );

  @override
  Future<Result<void>> saveClientConfig(OAuthClientConfig config) async =>
      const Success<void>(null);

  @override
  Future<Result<FrontierSession>> signIn() {
    signInCalls++;
    return holdSignIn?.future ??
        Future<Result<FrontierSession>>.value(signInResult);
  }

  @override
  Future<Result<FrontierSession>> refresh() => throw UnimplementedError();

  @override
  Future<Result<void>> signOut() async {
    signOutCalls++;
    return const Success<void>(null);
  }

  @override
  Future<void> dispose() => _statuses.close();
}

AuthBloc _blocOver(_RecordingAuthRepository repository) => AuthBloc(
      WatchAuthStatus(repository),
      SignInToFrontier(repository),
      SignOutFromFrontier(repository),
      GetOAuthClientConfig(repository),
      SaveOAuthClientConfig(repository),
    );

Future<void> _pumpSection(
  WidgetTester tester, {
  required _RecordingAuthRepository repository,
  VoidCallback? onConfigure,
}) async {
  final AuthBloc bloc = _blocOver(repository)..add(const AuthWatchStarted());
  addTearDown(bloc.close);
  addTearDown(repository.dispose);

  await tester.pumpWidget(
    MaterialApp(
      theme: EdTheme.build(),
      home: Scaffold(
        body: BlocProvider<AuthBloc>.value(
          value: bloc,
          child: FrontierAccountSection(onConfigure: onConfigure),
        ),
      ),
    ),
  );
  // One frame for the config read, one for the first status of the stream.
  await tester.pump();
  await tester.pump();
}

void main() {
  testWidgets('« Connecter » starts the OAuth flow on the spot', (
    WidgetTester tester,
  ) async {
    final _RecordingAuthRepository repository =
        _RecordingAuthRepository(const AuthSignedOut());
    bool configureOpened = false;
    await _pumpSection(
      tester,
      repository: repository,
      onConfigure: () => configureOpened = true,
    );

    await tester.tap(find.text('Connecter'));
    await tester.pump();

    expect(repository.signInCalls, 1);
    expect(
      configureOpened,
      isFalse,
      reason: 'connecter ne doit plus passer par l\'écran de configuration',
    );
  });

  testWidgets('the button goes inert while the browser is open', (
    WidgetTester tester,
  ) async {
    final _RecordingAuthRepository repository =
        _RecordingAuthRepository(const AuthSignedOut())
          ..holdSignIn = Completer<Result<FrontierSession>>();
    await _pumpSection(tester, repository: repository);

    await tester.tap(find.text('Connecter'));
    await tester.pump();

    expect(find.text('En attente…'), findsOneWidget);
    expect(
      tester.widget<OutlinedButton>(find.byType(OutlinedButton)).onPressed,
      isNull,
    );

    await tester.tap(find.byType(OutlinedButton), warnIfMissed: false);
    await tester.pump();
    expect(repository.signInCalls, 1);

    repository.holdSignIn!.complete(
      const ResultFailure<FrontierSession>(CancelledFailure()),
    );
    await tester.pump();
  });

  testWidgets('a refused connection is explained without leaving settings', (
    WidgetTester tester,
  ) async {
    final _RecordingAuthRepository repository =
        _RecordingAuthRepository(const AuthSignedOut())
          ..signInResult = const ResultFailure<FrontierSession>(
            UnauthorizedFailure(message: 'Autorisation refusée par Frontier.'),
          );
    await _pumpSection(tester, repository: repository);

    await tester.tap(find.text('Connecter'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Autorisation refusée par Frontier.'), findsOneWidget);
  });

  testWidgets('« Configurer l\'authentification » opens the client screen', (
    WidgetTester tester,
  ) async {
    final _RecordingAuthRepository repository =
        _RecordingAuthRepository(const AuthSignedOut());
    bool configureOpened = false;
    await _pumpSection(
      tester,
      repository: repository,
      onConfigure: () => configureOpened = true,
    );

    await tester.tap(find.text('Configurer l\'authentification'));
    await tester.pump();

    expect(configureOpened, isTrue);
    expect(repository.signInCalls, isZero);
  });

  testWidgets('without a client id, only configuring is offered', (
    WidgetTester tester,
  ) async {
    final _RecordingAuthRepository repository =
        _RecordingAuthRepository(const AuthUnconfigured());
    await _pumpSection(tester, repository: repository, onConfigure: () {});

    expect(find.text('Connecter'), findsNothing);
    expect(find.text('Configurer l\'authentification'), findsOneWidget);
  });

  testWidgets('an expired authorisation offers to redo it', (
    WidgetTester tester,
  ) async {
    final _RecordingAuthRepository repository =
        _RecordingAuthRepository(const AuthReauthorisationRequired());
    await _pumpSection(tester, repository: repository);

    await tester.tap(find.text('Reconnecter'));
    await tester.pump();

    expect(repository.signInCalls, 1);
  });

  testWidgets('a connected account can be disconnected', (
    WidgetTester tester,
  ) async {
    final DateTime now = DateTime.utc(3307, 5, 1);
    final _RecordingAuthRepository repository = _RecordingAuthRepository(
      AuthSignedIn(
        FrontierSession(
          accessToken: 'a',
          refreshToken: 'r',
          expiresAt: now.add(const Duration(hours: 4)),
          authorisedAt: now,
        ),
      ),
    );
    await _pumpSection(tester, repository: repository);

    await tester.tap(find.text('Déconnecter'));
    await tester.pump();

    expect(repository.signOutCalls, 1);
    expect(find.text('Connecter'), findsNothing);
  });
}
