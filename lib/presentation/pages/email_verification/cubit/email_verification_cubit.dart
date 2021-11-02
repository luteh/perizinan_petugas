import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';
import 'package:perizinan_petugas/domain/core/unions/result_state.dart';
import 'package:perizinan_petugas/domain/usecases/do_verification_code_usecase.dart';

part 'email_verification_cubit.freezed.dart';
part 'email_verification_state.dart';

@injectable
class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final DoVerificationCodeUseCase _doVerificationCodeUseCase;
  EmailVerificationCubit(this._doVerificationCodeUseCase)
      : super(EmailVerificationState.initial());

  saveEmail({required String email}) {
    emit(state.copyWith(email: email));
  }

  requestVerificationCode() async {
    emit(state.copyWith(
        requestVerificationCodeResult: const ResultState.loading()));

    final _result = await _doVerificationCodeUseCase(
      DoVerificationCodeUseCaseParams(
        type: VerificationCodeType.request,
        emailAddress: state.email,
        verificationCode: null,
      ),
    );

    _result.fold(
      (l) => emit(state.copyWith(
          requestVerificationCodeResult: ResultState.error(failure: l))),
      (r) => emit(state.copyWith(
          requestVerificationCodeResult: ResultState.success(data: r))),
    );
  }
}
