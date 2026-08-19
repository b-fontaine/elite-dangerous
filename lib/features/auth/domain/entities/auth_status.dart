import 'package:equatable/equatable.dart';

import 'frontier_session.dart';

/// Where the commander stands with regard to their Frontier account.
sealed class AuthStatus extends Equatable {
  const AuthStatus();

  @override
  List<Object?> get props => const <Object?>[];
}

/// No client id configured yet: the commander must first obtain one from
/// Frontier's Developer Zone.
final class AuthUnconfigured extends AuthStatus {
  const AuthUnconfigured();
}

/// A client id exists but nobody has signed in.
final class AuthSignedOut extends AuthStatus {
  const AuthSignedOut();
}

/// A valid session is available.
final class AuthSignedIn extends AuthStatus {
  const AuthSignedIn(this.session);

  final FrontierSession session;

  @override
  List<Object?> get props => <Object?>[session];
}

/// The session exists but is past the 25-day refresh window: the commander has
/// to go through the browser again. Surfaced as its own state so the UI can
/// explain *why* rather than silently signing them out.
final class AuthReauthorisationRequired extends AuthStatus {
  const AuthReauthorisationRequired();
}
