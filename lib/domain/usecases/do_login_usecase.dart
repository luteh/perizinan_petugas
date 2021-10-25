import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/base/usecase/future_usecase.dart';
import '../../core/unions/failure.dart';
import '../../domain/entities/login/login.dart';
import '../../domain/repositories/my_repository.dart';

class DoLoginUseCaseParams extends Equatable {
  final String email;
  final String password;

  const DoLoginUseCaseParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

@lazySingleton
class DoLoginUseCase extends FutureUseCase<Login, DoLoginUseCaseParams> {
  final MyRepository myRepository;

  DoLoginUseCase({required this.myRepository});

  @override
  Future<Either<Failure, Login>> execute(DoLoginUseCaseParams params) {
    return myRepository.doLogin(params);
  }
}
