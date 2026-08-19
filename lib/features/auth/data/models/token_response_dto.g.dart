// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponseDto _$TokenResponseDtoFromJson(Map<String, dynamic> json) =>
    TokenResponseDto(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      tokenType: json['token_type'] as String? ?? 'Bearer',
    );

DecodeResponseDto _$DecodeResponseDtoFromJson(Map<String, dynamic> json) =>
    DecodeResponseDto(
      usr: json['usr'] == null
          ? null
          : DecodeUserDto.fromJson(json['usr'] as Map<String, dynamic>),
    );

DecodeUserDto _$DecodeUserDtoFromJson(Map<String, dynamic> json) =>
    DecodeUserDto(
      customerId: (json['customer_id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );
