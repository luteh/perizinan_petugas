part of 'code_verification_cubit.dart';

@freezed
class CodeVerificationState with _$CodeVerificationState {
  const factory CodeVerificationState({
    required CodeVerificationArgs args,
    required String verificationCode,
    required ResultState<BaseResponse> verifyCodeResult,
    required ResultState<BaseResponse> requestVerificationCodeResult,
  }) = _CodeVerificationState;

  factory CodeVerificationState.initial() => const CodeVerificationState(
        args: CodeVerificationArgs(
          email: '',
        ),
        verificationCode: '',
        verifyCodeResult: ResultState.initial(),
        requestVerificationCodeResult: ResultState.initial(),
      );
}
