import 'package:fpdart/fpdart.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/token/request_token_response.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';

import '../core/unions/failure.dart';
import '../entities/login/user.dart';
import '../usecases/do_login_usecase.dart';
import '../usecases/do_logout_usecase.dart';

abstract class MyRepository {
  Future<Either<Failure, BaseResponse<RequestTokenResponse>>> doLogin(
      DoLoginUseCaseParams params);

  Future<Either<Failure, dynamic>> doLogout(DoLogoutUseCaseParams params);
  User? getUser();
}
