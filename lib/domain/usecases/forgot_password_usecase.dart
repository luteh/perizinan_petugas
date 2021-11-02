import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/forgot_password/set_password_request.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';

import '../../domain/repositories/my_repository.dart';
import '../core/unions/failure.dart';
import '../core/usecase/future_usecase.dart';

class ForgotPasswordUseCaseParams {
  final String emailAddress;
  final String verificationCode;
  final String password;
  final String confirmPassword;

  const ForgotPasswordUseCaseParams({
    required this.emailAddress,
    required this.verificationCode,
    required this.password,
    required this.confirmPassword,
  });

  SetPasswordRequest toRequest() => SetPasswordRequest(
        emailAddress: emailAddress,
        verificationCode: verificationCode,
        password: password,
        confirmPassword: confirmPassword,
      );
}

@lazySingleton
class ForgotPasswordUseCase
    extends FutureUseCase<BaseResponse, ForgotPasswordUseCaseParams> {
  final MyRepository myRepository;

  ForgotPasswordUseCase({required this.myRepository});

  @override
  Future<Either<Failure, BaseResponse>> execute(
      ForgotPasswordUseCaseParams params) {
    return myRepository.forgotPassword(params);
  }
}
