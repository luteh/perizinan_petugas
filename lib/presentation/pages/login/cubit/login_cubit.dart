import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/remote/response/accounts/token/request_token_response.dart';
import '../../../../data/remote/response/base_response.dart';
import '../../../../domain/core/unions/result_state.dart';
import '../../../../domain/usecases/do_login_usecase.dart';
import '../../../../domain/usecases/permits/fetch_permit_types_usecase.dart';
import '../../../../domain/usecases/submissions/fetch_submission_statuses_usecase.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final DoLoginUseCase _doLoginUseCase;
  final FetchPermitTypesUseCase _fetchPermitTypesUseCase;
  final FetchSubmissionStatusesUseCase _fetchSubmissionStatusesUseCase;

  LoginCubit(this._doLoginUseCase, this._fetchPermitTypesUseCase,
      this._fetchSubmissionStatusesUseCase)
      : super(LoginState.initial());

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
      (r) async {
        await Future.wait([
          _fetchPermitTypes(),
          _fetchSubmissionStatuses(),
        ]);
        
        emit(
          state.copyWith(
            loginResultState: ResultState.success(
              data: r,
            ),
          ),
        );
      },
    );
  }

  Future<void> _fetchPermitTypes() async {
    await _fetchPermitTypesUseCase();
  }

  Future<void> _fetchSubmissionStatuses() async {
    await _fetchSubmissionStatusesUseCase();
  }
}
