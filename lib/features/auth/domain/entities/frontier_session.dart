import 'package:equatable/equatable.dart';

/// A live Frontier OAuth session.
class FrontierSession extends Equatable {
  const FrontierSession({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
    required this.authorisedAt,
    this.tokenType = 'Bearer',
    this.customerId,
  });

  final String accessToken;

  /// Rotated on **every** refresh: the new value must be persisted atomically
  /// or the session is lost.
  final String refreshToken;

  final DateTime expiresAt;

  /// When the commander last went through the browser consent screen.
  /// Frontier refuses to refresh more than [maxRefreshWindow] after this.
  final DateTime authorisedAt;

  /// Frontier returns `Bearer`; echoed back verbatim rather than hard-coded.
  final String tokenType;

  /// From `/decode`; the journal's `FID` is `'F$customerId'`.
  final int? customerId;

  /// Access tokens last four hours.
  static const Duration accessTokenLifetime = Duration(hours: 4);

  /// A refresh token stops working 25 days after the initial authorisation,
  /// no matter how often it was rotated. After that the commander has to go
  /// through the browser again.
  static const Duration maxRefreshWindow = Duration(days: 25);

  /// Refresh a little early so an in-flight request never races the expiry.
  static const Duration refreshMargin = Duration(minutes: 5);

  bool isExpiredAt(DateTime now) => !now.isBefore(expiresAt);

  bool needsRefreshAt(DateTime now) => !now.isBefore(
        expiresAt.subtract(refreshMargin),
      );

  /// True once even a refresh cannot save the session.
  bool isBeyondRefreshWindowAt(DateTime now) =>
      now.difference(authorisedAt) >= maxRefreshWindow;

  DateTime get reauthorisationDeadline => authorisedAt.add(maxRefreshWindow);

  Duration timeUntilReauthorisation(DateTime now) {
    final Duration remaining = reauthorisationDeadline.difference(now);
    return remaining.isNegative ? Duration.zero : remaining;
  }

  String get authorizationHeader => '$tokenType $accessToken';

  FrontierSession copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? expiresAt,
    DateTime? authorisedAt,
    String? tokenType,
    int? customerId,
  }) {
    return FrontierSession(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresAt: expiresAt ?? this.expiresAt,
      authorisedAt: authorisedAt ?? this.authorisedAt,
      tokenType: tokenType ?? this.tokenType,
      customerId: customerId ?? this.customerId,
    );
  }

  @override
  List<Object?> get props =>
      <Object?>[accessToken, refreshToken, expiresAt, authorisedAt, customerId];

  @override
  String toString() => 'FrontierSession(expiresAt: $expiresAt)';
}
