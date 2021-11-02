import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/profile/update_password_request.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';

import '../../domain/repositories/my_repository.dart';
import '../core/unions/failure.dart';
import '../core/usecase/future_usecase.dart';

class UpdatePasswordUseCaseParams {
  final String oldPassword;
  final String newPassword;
  final String confirmNewPassword;

  const UpdatePasswordUseCaseParams({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  UpdatePasswordRequest toRequest() => UpdatePasswordRequest(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
      );
}

@lazySingleton
class UpdatePasswordUseCase
    extends FutureUseCase<BaseResponse, UpdatePasswordUseCaseParams> {
  final MyRepository myRepository;

  UpdatePasswordUseCase({required this.myRepository});

  @override
  Future<Either<Failure, BaseResponse>> execute(
      UpdatePasswordUseCaseParams params) {
    return myRepository.updatePassword(params);
  }
}
