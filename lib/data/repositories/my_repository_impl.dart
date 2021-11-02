import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/forgot_password/verification_code_request.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/token/request_token_request.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/profile/get_profile_response.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/token/request_token_response.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';
import 'package:perizinan_petugas/domain/core/usecase/no_param.dart';
import 'package:perizinan_petugas/domain/usecases/do_verification_code_usecase.dart';
import 'package:perizinan_petugas/domain/usecases/forgot_password_usecase.dart';

import '../../domain/core/unions/failure.dart';
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

  @override
  Future<Either<Failure, BaseResponse>> doVerificationCode(
      DoVerificationCodeUseCaseParams params) async {
    final _response = await _remoteDataSource.doVerificationCode(
        request: VerificationCodeRequest(
      type: params.mapType(),
      emailAddress: params.emailAddress,
      verificationCode: params.verificationCode,
    ));

    return Right(_response);
  }

  @override
  Future<Either<Failure, BaseResponse>> forgotPassword(
      ForgotPasswordUseCaseParams params) async {
    final _response =
        await _remoteDataSource.setNewPassword(request: params.toRequest());

    return Right(_response);
  }

  @override
  Future<Either<Failure, BaseResponse<GetProfileResponse>>> getProfile(
      NoParam params) async {
    final _response = await _remoteDataSource.getProfile();

    return Right(_response);
  }
}
