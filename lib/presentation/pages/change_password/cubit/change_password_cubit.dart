import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/core/utils/get_util.dart';
import 'package:perizinan_petugas/presentation/pages/change_password/change_password_args.dart';
import 'package:perizinan_petugas/presentation/pages/main/main_page.dart';

part 'change_password_cubit.freezed.dart';
part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordState.initial());

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
}
