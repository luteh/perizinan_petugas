part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    required bool isLoggedIn,
    required String oldPassword,
    required String newPassword,
    required String newPasswordConfirmation,
    required ChangePasswordArgs? args,
    required ResultState<BaseResponse> setNewPasswordResult,
  }) = _ChangePasswordState;

  factory ChangePasswordState.initial() => const ChangePasswordState(
        isLoggedIn: false,
        oldPassword: '',
        newPassword: '',
        newPasswordConfirmation: '',
        args: null,
        setNewPasswordResult: ResultState.initial(),
      );
}
