import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/unions/failure.dart';
import '../../domain/entities/monitoring_without_submission/monitoring_without_submission_entity.dart';
import '../../domain/repositories/monitoring_without_submission_repository.dart';
import '../remote/monitoring_without_submission/monitoring_without_submission_remote_data_source.dart';

@LazySingleton(as: MonitoringWithoutSubmissionRepository)
class MonitoringWithoutSubmissionRepositoryImpl
    implements MonitoringWithoutSubmissionRepository {
  final MonitoringWithoutSubmissionRemoteDataSource _remoteDataSource;

  MonitoringWithoutSubmissionRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<MonitoringWithoutSubmissionEntity>>>
      fetchMonitoringWithoutSubmissions(String keyword) async {
    final _response =
        await _remoteDataSource.fetchMonitoringWithoutSubmissions(keyword);
    return Right(_response.data.map((e) => e.toDomain()).toList());
  }
}
