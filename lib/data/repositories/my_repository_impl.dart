import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/constants/constants.dart';
import '../../core/constants/strings.dart';
import '../../core/unions/failure.dart';
import '../../domain/entities/login/login.dart';
import '../../domain/entities/login/user.dart';
import '../../domain/repositories/my_repository.dart';
import '../../domain/usecases/do_login_usecase.dart';
import '../../domain/usecases/do_logout_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';
import '../local/local_data_source.dart';
import '../remote/remote_data_source.dart';

@LazySingleton(as: MyRepository)
class MyRepositoryImpl implements MyRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  MyRepositoryImpl(this._remoteDataSource, this._localDataSource);
  @override
  Future<Either<Failure, Login>> doLogin(DoLoginUseCaseParams params) async {
    final _data = await _remoteDataSource.doLogin(params);

    if (_data.status == Constants.statusError) {
      return Left(
        Failure.defaultError(_data.message ?? Strings.msgErrorGeneral),
      );
    }

    await Future.wait([
      _localDataSource.saveToken(_data.token),
      _localDataSource.saveUser(_data.user?.toEntity())
    ]);

    return Right(_data.toDomain());
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
  Future<Either<Failure, Login>> updateProfile(
      UpdateProfileUseCaseParams params) async {
    final _data = await _remoteDataSource.updateProfile(params);

    if (_data.status == Constants.statusError) {
      return Left(
        Failure.defaultError(_data.message ?? Strings.msgErrorGeneral),
      );
    }

    await _localDataSource.saveUser(_data.user?.toEntity());

    return Right(_data.toDomain());
  }
}
