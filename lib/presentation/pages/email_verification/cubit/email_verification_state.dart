part of 'email_verification_cubit.dart';

@freezed
class EmailVerificationState with _$EmailVerificationState {
  const factory EmailVerificationState({
    required String email,
    required ResultState<BaseResponse> requestVerificationCodeResult,
  }) = _EmailVerificationState;

  factory EmailVerificationState.initial() => const EmailVerificationState(
        email: '',
        requestVerificationCodeResult: ResultState.initial(),
      );
}
