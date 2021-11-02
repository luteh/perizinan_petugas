import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';

import '../../domain/repositories/my_repository.dart';
import '../core/unions/failure.dart';
import '../core/usecase/future_usecase.dart';

enum VerificationCodeType { request, verify }

class DoVerificationCodeUseCaseParams {
  final VerificationCodeType type;
  final String emailAddress;
  final String? verificationCode;

  const DoVerificationCodeUseCaseParams({
    required this.type,
    required this.emailAddress,
    required this.verificationCode,
  });

  String mapType() {
    switch (type) {
      case VerificationCodeType.request:
        return 'request';
      case VerificationCodeType.verify:
        return 'verify';
    }
  }
}

@lazySingleton
class DoVerificationCodeUseCase
    extends FutureUseCase<BaseResponse, DoVerificationCodeUseCaseParams> {
  final MyRepository myRepository;

  DoVerificationCodeUseCase({required this.myRepository});

  @override
  Future<Either<Failure, BaseResponse>> execute(
      DoVerificationCodeUseCaseParams params) {
    return myRepository.doVerificationCode(params);
  }
}
