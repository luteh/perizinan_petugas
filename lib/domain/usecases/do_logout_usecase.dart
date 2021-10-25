import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/base/usecase/future_usecase.dart';
import '../../core/unions/failure.dart';
import '../../domain/repositories/my_repository.dart';

class DoLogoutUseCaseParams extends Equatable {
  const DoLogoutUseCaseParams();

  @override
  List<Object> get props => [];
}

@lazySingleton
class DoLogoutUseCase extends FutureUseCase<dynamic, DoLogoutUseCaseParams> {
  final MyRepository myRepository;

  DoLogoutUseCase({required this.myRepository});

  @override
  Future<Either<Failure, dynamic>> execute(DoLogoutUseCaseParams params) {
    return myRepository.doLogout(params);
  }
}
