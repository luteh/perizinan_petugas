part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    required bool isLoggedIn,
    required String oldPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) = _ChangePasswordState;

  factory ChangePasswordState.initial() => const ChangePasswordState(
        isLoggedIn: false,
        oldPassword: '',
        newPassword: '',
        newPasswordConfirmation: '',
      );
}
