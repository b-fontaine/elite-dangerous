import '../../../../core/network/frontier_endpoints.dart';
import 'pkce.dart';

/// Builds Frontier's authorisation URL.
///
/// Parameter set and ordering follow EDMC's production request, which is the
/// only form known to work end to end.
abstract final class AuthorizationUrlBuilder {
  /// Platforms Frontier accepts an account from. `all` is the documented
  /// default; EDMC sends `frontier,steam,epic`, and `epic` is missing from the
  /// published list — so the broader value is the safer one.
  static const String audience = 'frontier,steam,epic';

  static Uri build({
    required String clientId,
    required String redirectUri,
    required PkceChallenge pkce,
    required String state,
  }) {
    return Uri.parse(
      '${FrontierEndpoints.authBaseUrl}${FrontierEndpoints.authorizePath}',
    ).replace(
      queryParameters: <String, String>{
        'response_type': 'code',
        'audience': audience,
        'scope': FrontierEndpoints.scope,
        'client_id': clientId,
        'code_challenge': pkce.challenge,
        'code_challenge_method': pkce.method,
        'state': state,
        'redirect_uri': redirectUri,
      },
    );
  }
}
