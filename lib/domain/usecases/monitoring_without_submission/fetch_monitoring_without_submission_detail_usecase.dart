import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/unions/failure.dart';
import '../../core/usecase/future_usecase.dart';
import '../../entities/monitoring_without_submission/monitoring_without_submission_detail_entity.dart';
import '../../repositories/monitoring_without_submission_repository.dart';

class FetchMonitoringWithoutSubmissionDetailUseCaseParams {
  final int id;

  FetchMonitoringWithoutSubmissionDetailUseCaseParams(this.id);
}

@lazySingleton
class FetchMonitoringWithoutSubmissionDetailUseCase extends FutureUseCase<
    MonitoringWithoutSubmissionDetailEntity,
    FetchMonitoringWithoutSubmissionDetailUseCaseParams> {
  final MonitoringWithoutSubmissionRepository repository;

  FetchMonitoringWithoutSubmissionDetailUseCase({required this.repository});

  @override
  Future<Either<Failure, MonitoringWithoutSubmissionDetailEntity>> execute(
      FetchMonitoringWithoutSubmissionDetailUseCaseParams params) {
    return repository.fetchMonitoringWithoutSubmissionDetail(params.id);
  }
}
