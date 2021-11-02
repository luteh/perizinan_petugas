
import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_password_request.freezed.dart';
part 'set_password_request.g.dart';

@freezed
class SetPasswordRequest with _$SetPasswordRequest {
  const factory SetPasswordRequest({
    required String emailAddress,
    required String verificationCode,
    required String password,
    required String confirmPassword,
  }) = _SetPasswordRequest;

  factory SetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$SetPasswordRequestFromJson(json);
}
