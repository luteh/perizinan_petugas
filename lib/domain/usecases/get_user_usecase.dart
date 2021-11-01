import 'package:injectable/injectable.dart';

import '../core/usecase/no_param.dart';
import '../core/usecase/usecase.dart';
import '../../domain/entities/login/user.dart';
import '../../domain/repositories/my_repository.dart';

@lazySingleton
class GetUserUseCase extends UseCase<User?, NoParam> {
  final MyRepository myRepository;

  GetUserUseCase({required this.myRepository});

  @override
  User? call(NoParam params) {
    return myRepository.getUser();
  }
}
