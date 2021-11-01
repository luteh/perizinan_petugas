import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/token/request_token_response.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';

import '../core/usecase/future_usecase.dart';
import '../core/unions/failure.dart';
import '../../domain/repositories/my_repository.dart';

class DoLoginUseCaseParams extends Equatable {
  final String email;
  final String password;

  const DoLoginUseCaseParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

@lazySingleton
class DoLoginUseCase extends FutureUseCase<BaseResponse<RequestTokenResponse>,
    DoLoginUseCaseParams> {
  final MyRepository myRepository;

  DoLoginUseCase({required this.myRepository});

  @override
  Future<Either<Failure, BaseResponse<RequestTokenResponse>>> execute(
      DoLoginUseCaseParams params) {
    return myRepository.doLogin(params);
  }
}
