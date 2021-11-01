import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/presentation/pages/code_verification/code_verification_args.dart';

part 'code_verification_cubit.freezed.dart';
part 'code_verification_state.dart';

@injectable
class CodeVerificationCubit extends Cubit<CodeVerificationState> {
  CodeVerificationCubit() : super(CodeVerificationState.initial());

  onStarted({required CodeVerificationArgs args}) {
    emit(state.copyWith(args: args));
  }
}
