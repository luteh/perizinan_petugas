
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_token_request.freezed.dart';
part 'request_token_request.g.dart';

@freezed
class RequestTokenRequest with _$RequestTokenRequest {
  const factory RequestTokenRequest({
    required String emailAddress,
    required String password,
    required String firebaseToken,
  }) = _RequestTokenRequest;

  factory RequestTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenRequestFromJson(json);
}
