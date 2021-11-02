import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_code_request.freezed.dart';
part 'verification_code_request.g.dart';

@freezed
class VerificationCodeRequest with _$VerificationCodeRequest {
  const factory VerificationCodeRequest({
    required String type, // 'request' or 'verify'
    required String emailAddress,
    required String? verificationCode,
  }) = _VerificationCodeRequest;

  factory VerificationCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerificationCodeRequestFromJson(json);
}
