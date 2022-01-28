import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/unions/failure.dart';
import '../../core/usecase/future_usecase_without_params.dart';
import '../../entities/permits/permit_type_entity.dart';
import '../../repositories/permits_repository.dart';

@lazySingleton
class FetchPermitTypesLocalUseCase
    extends FutureUseCaseWithoutParams<List<PermitTypeEntity>> {
  final PermitsRepository permitsRepository;

  FetchPermitTypesLocalUseCase({required this.permitsRepository});

  @override
  Future<Either<Failure, List<PermitTypeEntity>>> execute() {
    return permitsRepository.fetchPermitTypesLocal();
  }
}
