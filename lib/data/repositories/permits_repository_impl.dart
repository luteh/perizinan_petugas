import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/unions/failure.dart';
import '../../domain/entities/permits/permit_type_entity.dart';
import '../../domain/repositories/permits_repository.dart';
import '../local/permits/permits_local_data_source.dart';
import '../remote/permits/permits_remote_data_source.dart';

@LazySingleton(as: PermitsRepository)
class PermitsRepositoryImpl implements PermitsRepository {
  final PermitsRemoteDataSource _remoteDataSource;
  final PermitsLocalDataSource _localDataSource;

  PermitsRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<PermitTypeEntity>>> fetchPermitTypes() async {
    final _response = await _remoteDataSource.fetchPermitTypes();
    await _localDataSource
        .savePermitTypes(_response.data.map((e) => e.toLocal()).toList());
    return Right(_response.data.map((e) => e.toDomain()).toList());
  }

  @override
  Future<Either<Failure, List<PermitTypeEntity>>>
      fetchPermitTypesLocal() async {
    return Right(
        _localDataSource.getPermitTypes()?.map((e) => e.toDomain()).toList() ??
            []);
  }
}
