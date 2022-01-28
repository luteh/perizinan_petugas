import 'package:fpdart/fpdart.dart';

import '../core/unions/failure.dart';
import '../entities/permits/permit_type_entity.dart';

abstract class PermitsRepository {
  Future<Either<Failure, List<PermitTypeEntity>>> fetchPermitTypes();

  Future<Either<Failure, List<PermitTypeEntity>>> fetchPermitTypesLocal();
}
