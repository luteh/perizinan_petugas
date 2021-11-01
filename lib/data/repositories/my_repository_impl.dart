import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/token/request_token_request.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/token/request_token_response.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';

import '../../core/unions/failure.dart';
import '../../domain/entities/login/user.dart';
import '../../domain/repositories/my_repository.dart';
import '../../domain/usecases/do_login_usecase.dart';
import '../../domain/usecases/do_logout_usecase.dart';
import '../local/local_data_source.dart';
import '../remote/remote_data_source.dart';

@LazySingleton(as: MyRepository)
class MyRepositoryImpl implements MyRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  MyRepositoryImpl(this._remoteDataSource, this._localDataSource);
  @override
  Future<Either<Failure, BaseResponse<RequestTokenResponse>>> doLogin(
      DoLoginUseCaseParams params) async {
    final _response = await _remoteDataSource.doLogin(
        request: RequestTokenRequest(
      emailAddress: params.email,
      password: params.password,
      firebaseToken: 'firebaseToken',
    ));

    await _localDataSource.saveToken(_response.data.toJsonString());

    return Right(_response);
  }

  @override
  Future<Either<Failure, dynamic>> doLogout(
      DoLogoutUseCaseParams params) async {
    await Future.wait(
      [
        _localDataSource.deleteUser(),
        _localDataSource.deleteToken(),
      ],
    );

    return const Right(null);
  }

  @override
  User? getUser() {
    return _localDataSource.getUser()?.toDomain();
  }
}
