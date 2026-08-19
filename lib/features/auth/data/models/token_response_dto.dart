import 'package:json_annotation/json_annotation.dart';

part 'token_response_dto.g.dart';

/// Response of `POST https://auth.frontierstore.net/token`.
///
/// Applies to both `authorization_code` and `refresh_token` grants — Frontier
/// returns a **new refresh token every time**, so the caller must persist it.
@JsonSerializable(createToJson: false)
class TokenResponseDto {
  const TokenResponseDto({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    this.tokenType = 'Bearer',
  });

  factory TokenResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseDtoFromJson(json);

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  /// Seconds until the access token expires. Frontier returns 14400 (4 hours).
  @JsonKey(name: 'expires_in')
  final int expiresIn;

  @JsonKey(name: 'token_type', defaultValue: 'Bearer')
  final String tokenType;
}

/// Response of `GET https://auth.frontierstore.net/decode`.
///
/// Used to tie the session to a commander without spending a CAPI query.
@JsonSerializable(createToJson: false)
class DecodeResponseDto {
  const DecodeResponseDto({this.usr});

  factory DecodeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DecodeResponseDtoFromJson(json);

  final DecodeUserDto? usr;
}

@JsonSerializable(createToJson: false)
class DecodeUserDto {
  const DecodeUserDto({this.customerId, this.email, this.firstname, this.lastname});

  factory DecodeUserDto.fromJson(Map<String, dynamic> json) =>
      _$DecodeUserDtoFromJson(json);

  /// The journal's `FID` is this value prefixed with `F`.
  @JsonKey(name: 'customer_id')
  final int? customerId;

  final String? email;
  final String? firstname;
  final String? lastname;
}
