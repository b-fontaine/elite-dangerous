import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/frontier_endpoints.dart';
import '../models/token_response_dto.dart';

part 'frontier_auth_api.g.dart';

/// Frontier's OAuth2 authorisation server.
///
/// Bodies are `application/x-www-form-urlencoded`, never JSON, and no
/// `client_secret` is sent: PKCE replaces it, and a distributed app must never
/// embed the Shared Key anyway.
@RestApi(baseUrl: FrontierEndpoints.authBaseUrl)
@injectable
abstract class FrontierAuthApi {
  @factoryMethod
  factory FrontierAuthApi(@Named('frontierAuth') Dio dio) = _FrontierAuthApi;

  @POST(FrontierEndpoints.tokenPath)
  @FormUrlEncoded()
  Future<TokenResponseDto> exchangeAuthorizationCode({
    @Field('grant_type') String grantType = 'authorization_code',
    @Field('client_id') required String clientId,
    @Field('code') required String code,
    @Field('code_verifier') required String codeVerifier,
    @Field('redirect_uri') required String redirectUri,
  });

  @POST(FrontierEndpoints.tokenPath)
  @FormUrlEncoded()
  Future<TokenResponseDto> refreshAccessToken({
    @Field('grant_type') String grantType = 'refresh_token',
    @Field('client_id') required String clientId,
    @Field('refresh_token') required String refreshToken,
  });

  /// Identifies the account behind an access token, without consuming a CAPI
  /// query from the one-per-minute budget.
  @GET(FrontierEndpoints.decodePath)
  Future<DecodeResponseDto> decode(
    @Header('Authorization') String authorization,
  );
}
