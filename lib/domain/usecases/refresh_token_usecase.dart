import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/token/request_token_response.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';
import 'package:perizinan_petugas/domain/core/usecase/no_param.dart';

import '../../domain/repositories/my_repository.dart';
import '../core/unions/failure.dart';
import '../core/usecase/future_usecase.dart';

@lazySingleton
class RefreshTokenUseCase
    extends FutureUseCase<BaseResponse<RequestTokenResponse>, NoParam> {
  final MyRepository myRepository;

  RefreshTokenUseCase({required this.myRepository});

  @override
  Future<Either<Failure, BaseResponse<RequestTokenResponse>>> execute(
      NoParam params) {
    return myRepository.refreshToken(params);
  }
}
