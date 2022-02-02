import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/unions/failure.dart';
import '../../core/usecase/future_usecase.dart';
import '../../entities/monitoring/monitoring_result_detail_entity.dart';
import '../../repositories/monitoring_repository.dart';

class FetchMonitoringResultDetailUseCaseParams {
  final int submissionId;

  FetchMonitoringResultDetailUseCaseParams(this.submissionId);
}

@lazySingleton
class FetchMonitoringResultDetailUseCase extends FutureUseCase<
    MonitoringResultDetailEntity, FetchMonitoringResultDetailUseCaseParams> {
  final MonitoringRepository monitoringRepository;

  FetchMonitoringResultDetailUseCase({required this.monitoringRepository});

  @override
  Future<Either<Failure, MonitoringResultDetailEntity>> execute(
      FetchMonitoringResultDetailUseCaseParams params) {
    return monitoringRepository
        .fetchMonitoringResultDetail(params.submissionId);
  }
}
