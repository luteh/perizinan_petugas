import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/core/utils/get_util.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';
import 'package:perizinan_petugas/domain/core/unions/result_state.dart';
import 'package:perizinan_petugas/domain/usecases/forgot_password_usecase.dart';
import 'package:perizinan_petugas/domain/usecases/update_password_usecase.dart';
import 'package:perizinan_petugas/presentation/pages/change_password/change_password_args.dart';
import 'package:perizinan_petugas/presentation/pages/main/main_page.dart';

part 'change_password_cubit.freezed.dart';
part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final UpdatePasswordUseCase _updatePasswordUseCase;

  ChangePasswordCubit(this._forgotPasswordUseCase, this._updatePasswordUseCase)
      : super(ChangePasswordState.initial());

  onStarted({required ChangePasswordArgs? args}) {
    emit(state.copyWith(args: args));
    if (GetUtil.previousRoute == MainPage.routeName) {
      emit(state.copyWith(isLoggedIn: true));
    }
  }

  saveOldPassword(String oldPassword) {
    emit(state.copyWith(oldPassword: oldPassword));
  }

  saveNewPassword(String newPassword) {
    emit(state.copyWith(newPassword: newPassword));
  }

  saveNewPasswordConfirmation(String newPasswordConfirmation) {
    emit(state.copyWith(newPasswordConfirmation: newPasswordConfirmation));
  }

  setNewPassword() async {
    emit(state.copyWith(setNewPasswordResult: const ResultState.loading()));

    final _result = await _forgotPasswordUseCase(ForgotPasswordUseCaseParams(
      emailAddress: state.args?.email ?? '',
      verificationCode: state.args?.verificationCode ?? '',
      password: state.newPassword,
      confirmPassword: state.newPasswordConfirmation,
    ));

    _result.fold(
      (l) => emit(
          state.copyWith(setNewPasswordResult: ResultState.error(failure: l))),
      (r) => emit(
          state.copyWith(setNewPasswordResult: ResultState.success(data: r))),
    );
  }

  updatePassword() async {
    emit(state.copyWith(updatePasswordResult: const ResultState.loading()));

    final _result = await _updatePasswordUseCase(
      UpdatePasswordUseCaseParams(
        oldPassword: state.oldPassword,
        newPassword: state.newPassword,
        confirmNewPassword: state.newPasswordConfirmation,
      ),
    );

    _result.fold(
      (l) => emit(
          state.copyWith(updatePasswordResult: ResultState.error(failure: l))),
      (r) => emit(
          state.copyWith(updatePasswordResult: ResultState.success(data: r))),
    );
  }
}
