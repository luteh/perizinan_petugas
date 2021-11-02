import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/profile/get_profile_response.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';
import 'package:perizinan_petugas/domain/core/usecase/no_param.dart';

import '../../domain/repositories/my_repository.dart';
import '../core/unions/failure.dart';
import '../core/usecase/future_usecase.dart';

@lazySingleton
class GetProfileUseCase
    extends FutureUseCase<BaseResponse<GetProfileResponse>, NoParam> {
  final MyRepository myRepository;

  GetProfileUseCase({required this.myRepository});

  @override
  Future<Either<Failure, BaseResponse<GetProfileResponse>>> execute(
      NoParam params) {
    return myRepository.getProfile(params);
  }
}
