import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/domain/core/unions/result_state.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/token/request_token_response.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';
import 'package:perizinan_petugas/domain/entities/login/login.dart';
import 'package:perizinan_petugas/domain/usecases/do_login_usecase.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final DoLoginUseCase _doLoginUseCase;
  LoginCubit(this._doLoginUseCase) : super(LoginState.initial());

  saveEmail({required String email}) {
    emit(state.copyWith(email: email));
  }

  savePassword({required String password}) {
    emit(state.copyWith(password: password));
  }

  doLogin() async {
    emit(state.copyWith(loginResultState: const ResultState.loading()));

    final _result = await _doLoginUseCase(
      DoLoginUseCaseParams(
        email: state.email,
        password: state.password,
      ),
    );

    _result.fold(
      (l) => emit(
        state.copyWith(
          loginResultState: ResultState.error(
            failure: l,
          ),
        ),
      ),
      (r) => emit(
        state.copyWith(
          loginResultState: ResultState.success(
            data: r,
          ),
        ),
      ),
    );
  }
}
