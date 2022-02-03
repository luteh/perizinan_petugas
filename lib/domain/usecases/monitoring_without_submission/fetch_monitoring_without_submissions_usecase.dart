import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/unions/failure.dart';
import '../../core/usecase/future_usecase.dart';
import '../../entities/monitoring_without_submission/monitoring_without_submission_entity.dart';
import '../../repositories/monitoring_without_submission_repository.dart';

class FetchMonitoringWithoutSubmissionsUseCaseParams {
  final String keyword;

  FetchMonitoringWithoutSubmissionsUseCaseParams(this.keyword);
}

@lazySingleton
class FetchMonitoringWithoutSubmissionsUseCase extends FutureUseCase<
    List<MonitoringWithoutSubmissionEntity>,
    FetchMonitoringWithoutSubmissionsUseCaseParams> {
  final MonitoringWithoutSubmissionRepository repository;

  FetchMonitoringWithoutSubmissionsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MonitoringWithoutSubmissionEntity>>> execute(
      FetchMonitoringWithoutSubmissionsUseCaseParams params) {
    return repository.fetchMonitoringWithoutSubmissions(params.keyword);
  }
}
