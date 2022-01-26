import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/detail_customer_entity.dart';

import '../../domain/core/unions/failure.dart';
import '../../domain/entities/monitoring/monitoring_entity.dart';
import '../../domain/entities/monitoring/permit_detail_entity.dart';
import '../../domain/repositories/monitoring_repository.dart';
import '../remote/monitoring/monitoring_remote_data_source.dart';

@LazySingleton(as: MonitoringRepository)
class MonitoringRepositoryImpl implements MonitoringRepository {
  final MonitoringRemoteDataSource _remoteDataSource;

  MonitoringRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<MonitoringEntity>>> fetchMonitoringList(
      String keyword) async {
    final _response = await _remoteDataSource.fetchMonitoringList(keyword);
    return Right(_response.data.map((e) => e.toDomain()).toList());
  }

  @override
  Future<Either<Failure, PermitDetailEntity>> fetchPermitDetail(int id) async {
    final _response = await _remoteDataSource.fetchPermitDetail(id);
    return Right(_response.data.toDomain());
  }

  @override
  Future<Either<Failure, DetailCustomerEntity>> fetchDetailCustomer(int id) async {
    final _response = await _remoteDataSource.fetchCustomerDetail(id);
    return Right(_response.data.toDomain());
  }
}
