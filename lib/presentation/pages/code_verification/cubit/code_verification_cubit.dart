import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';
import 'package:perizinan_petugas/domain/core/unions/result_state.dart';
import 'package:perizinan_petugas/domain/usecases/do_verification_code_usecase.dart';
import 'package:perizinan_petugas/presentation/pages/code_verification/code_verification_args.dart';

part 'code_verification_cubit.freezed.dart';
part 'code_verification_state.dart';

@injectable
class CodeVerificationCubit extends Cubit<CodeVerificationState> {
  final DoVerificationCodeUseCase _doVerificationCodeUseCase;
  CodeVerificationCubit(this._doVerificationCodeUseCase)
      : super(CodeVerificationState.initial());

  onStarted({required CodeVerificationArgs args}) {
    emit(state.copyWith(args: args));
  }

  saveVerificationCode({required String verificationCode}) {
    emit(state.copyWith(verificationCode: verificationCode));
  }

  verifyCode() async {
    emit(state.copyWith(verifyCodeResult: const ResultState.loading()));

    final _result = await _doVerificationCodeUseCase(
      DoVerificationCodeUseCaseParams(
        type: VerificationCodeType.verify,
        emailAddress: state.args.email,
        verificationCode: state.verificationCode,
      ),
    );

    _result.fold(
      (l) =>
          emit(state.copyWith(verifyCodeResult: ResultState.error(failure: l))),
      (r) =>
          emit(state.copyWith(verifyCodeResult: ResultState.success(data: r))),
    );
  }

  requestVerificationCode() async {
    emit(state.copyWith(
        requestVerificationCodeResult: const ResultState.loading()));

    final _result = await _doVerificationCodeUseCase(
      DoVerificationCodeUseCaseParams(
        type: VerificationCodeType.request,
        emailAddress: state.args.email,
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
