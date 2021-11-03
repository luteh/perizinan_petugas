import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/token/refresh_token_request.dart';

part 'request_token_response.freezed.dart';
part 'request_token_response.g.dart';

@freezed
class RequestTokenResponse with _$RequestTokenResponse {
  const RequestTokenResponse._();
  const factory RequestTokenResponse({
    required Token? accessToken,
    required Token? refreshToken,
  }) = _RequestTokenResponse;

  factory RequestTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenResponseFromJson(json);

  String toJsonString() {
    return jsonEncode(toJson());
  }

  RefreshTokenRequest toRefreshTokenRequest() {
    return RefreshTokenRequest(
      accessToken: accessToken?.value ?? '',
      refreshToken: refreshToken?.value ?? '',
    );
  }
}

@freezed
class Token with _$Token {
  const factory Token({
    required String? value,
    required String? issuedOn,
    required String? expiresOn,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
