import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/core/utils/get_util.dart';
import 'package:perizinan_petugas/presentation/main/main_page.dart';

part 'change_password_cubit.freezed.dart';
part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordState.initial());

  onStarted() {
    if (GetUtil.previousRoute == MainPage.routeName) {
      emit(state.copyWith(isLoggedIn: true));
    }
  }
}
