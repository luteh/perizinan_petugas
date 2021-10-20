import 'package:fpdart/fpdart.dart';

import '../../core/unions/failure.dart';
import '../entities/login/login.dart';
import '../entities/login/user.dart';
import '../usecases/do_login_usecase.dart';
import '../usecases/do_logout_usecase.dart';
import '../usecases/update_profile_usecase.dart';

abstract class MyRepository {
  Future<Either<Failure, Login>> doLogin(DoLoginUseCaseParams params);
  Future<Either<Failure, dynamic>> doLogout(DoLogoutUseCaseParams params);
  User? getUser();
  Future<Either<Failure, Login>> updateProfile(
      UpdateProfileUseCaseParams params);
}
