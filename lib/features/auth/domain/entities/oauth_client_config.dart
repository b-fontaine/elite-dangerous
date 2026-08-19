import 'package:equatable/equatable.dart';

/// The OAuth client credentials this app talks to Frontier with.
///
/// Frontier issues a client id only after a **manual approval** in the
/// Developer Zone of `user.frontierstore.net`; there is no self-service
/// registration. The app therefore cannot ship one: each commander pastes the
/// id they were granted. Reusing another tool's public client id (EDMC's is in
/// its source) would impersonate that tool in the user's list of authorised
/// applications, so the app refuses to do it.
///
/// PKCE means the "Shared Key" secret is never needed, and it must never be
/// embedded in a distributed application anyway.
class OAuthClientConfig extends Equatable {
  const OAuthClientConfig({
    required this.clientId,
    required this.redirectUri,
    this.clientIdIsBuildDefault = false,
  });

  const OAuthClientConfig.empty()
      : clientId = '',
        redirectUri = '',
        clientIdIsBuildDefault = false;

  final String clientId;

  /// True when [clientId] comes from the build rather than from something the
  /// commander typed. Lets the settings screen say so instead of presenting a
  /// compiled value as if it had been entered on this device.
  final bool clientIdIsBuildDefault;

  /// Must be byte-identical between the authorisation request and the token
  /// exchange, or Frontier rejects the exchange.
  final String redirectUri;

  bool get isConfigured => clientId.isNotEmpty && redirectUri.isNotEmpty;

  OAuthClientConfig copyWith({
    String? clientId,
    String? redirectUri,
    bool? clientIdIsBuildDefault,
  }) =>
      OAuthClientConfig(
        clientId: clientId ?? this.clientId,
        redirectUri: redirectUri ?? this.redirectUri,
        clientIdIsBuildDefault:
            clientIdIsBuildDefault ?? this.clientIdIsBuildDefault,
      );

  @override
  List<Object?> get props =>
      <Object?>[clientId, redirectUri, clientIdIsBuildDefault];
}
