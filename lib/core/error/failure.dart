import 'package:equatable/equatable.dart';

/// Base type for every recoverable error crossing a layer boundary.
///
/// Failures belong to the domain layer: they carry a human readable, already
/// localised (fr) message and never leak framework types such as [Exception]
/// subclasses coming from Dio or dart:io.
sealed class Failure extends Equatable {
  const Failure({required this.message, this.cause});

  final String message;
  final Object? cause;

  @override
  List<Object?> get props => <Object?>[runtimeType, message];

  @override
  String toString() => '$runtimeType($message)';
}

/// No connectivity, DNS error, socket closed, timeout…
final class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'Connexion réseau impossible.',
    super.cause,
  });
}

/// HTTP 401/403 — the Frontier token is missing, expired or revoked.
final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    super.message = 'Session Frontier expirée ou invalide.',
    super.cause,
  });
}

/// HTTP 404, or an empty payload where one was expected.
final class NotFoundFailure extends Failure {
  const NotFoundFailure({
    super.message = 'Ressource introuvable.',
    super.cause,
  });
}

/// HTTP 429 — the Companion API throttles aggressively.
final class RateLimitFailure extends Failure {
  const RateLimitFailure({
    super.message = 'Trop de requêtes vers Frontier. Réessaie dans quelques minutes.',
    super.cause,
    this.retryAfter,
  });

  final Duration? retryAfter;

  @override
  List<Object?> get props => <Object?>[...super.props, retryAfter];
}

/// HTTP 5xx.
final class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'Le service Frontier est indisponible.',
    super.cause,
    this.statusCode,
  });

  final int? statusCode;

  @override
  List<Object?> get props => <Object?>[...super.props, statusCode];
}

/// Local storage read/write error.
final class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Lecture ou écriture locale impossible.',
    super.cause,
  });
}

/// Malformed payload (remote JSON, bundled asset, journal line…).
final class ParsingFailure extends Failure {
  const ParsingFailure({
    super.message = 'Données illisibles ou corrompues.',
    super.cause,
  });
}

/// A domain invariant was violated, usually by user input.
final class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.cause,
    this.field,
  });

  final String? field;

  @override
  List<Object?> get props => <Object?>[...super.props, field];
}

/// The OAuth client credentials required by the Companion API are absent.
final class AuthConfigurationFailure extends Failure {
  const AuthConfigurationFailure({
    super.message =
        'Aucun client OAuth Frontier configuré. Renseigne un client_id dans les réglages.',
    super.cause,
  });
}

/// The user aborted an interactive flow (closed the browser, cancelled a picker…).
final class CancelledFailure extends Failure {
  const CancelledFailure({
    super.message = 'Opération annulée.',
    super.cause,
  });
}

/// Anything we did not anticipate.
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    super.message = 'Erreur inattendue.',
    super.cause,
  });
}
