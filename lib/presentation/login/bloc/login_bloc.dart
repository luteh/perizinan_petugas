import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/core/unions/result_state.dart';
import 'package:perizinan_petugas/domain/entities/login/login.dart';
import 'package:perizinan_petugas/domain/usecases/do_login_usecase.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DoLoginUseCase _doLoginUseCase;
  LoginBloc(this._doLoginUseCase) : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.map(
        started: (value) => _started(value, emit),
        saveEmail: (value) => _saveEmail(value, emit),
        savePassword: (value) => _savePassword(value, emit),
        doLogin: (value) => _doLogin(value, emit),
      );
    });
  }

  _started(_Started value, Emitter<LoginState> emit) {}

  _saveEmail(_SaveEmail value, Emitter<LoginState> emit) {
    emit(state.copyWith(email: value.email));
  }

  _savePassword(_SavePassword value, Emitter<LoginState> emit) {
    emit(state.copyWith(password: value.password));
  }

  _doLogin(_DoLogin value, Emitter<LoginState> emit) async {
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
