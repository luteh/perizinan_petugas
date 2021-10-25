part of 'code_verification_cubit.dart';

@freezed
class CodeVerificationState with _$CodeVerificationState {
  const factory CodeVerificationState({
    required CodeVerificationArgs args,
  }) = _CodeVerificationState;

  factory CodeVerificationState.initial() => const CodeVerificationState(
        args: CodeVerificationArgs(
          email: '',
        ),
      );
}
