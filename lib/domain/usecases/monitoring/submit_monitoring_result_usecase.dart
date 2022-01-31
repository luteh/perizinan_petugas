import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/unions/failure.dart';
import '../../core/usecase/future_usecase.dart';
import '../../entities/base_domain.dart';
import '../../entities/monitoring/input_monitoring_data.dart';
import '../../repositories/monitoring_repository.dart';

class SubmitMonitoringResultUseCaseParams {
  final int id;
  final int amount;
  final List<InputMonitoringData> inputMonitoringDatas;

  SubmitMonitoringResultUseCaseParams(
      this.id, this.amount, this.inputMonitoringDatas);
}

@lazySingleton
class SubmitMonitoringResultUseCase
    extends FutureUseCase<BaseDomain, SubmitMonitoringResultUseCaseParams> {
  final MonitoringRepository monitoringRepository;

  SubmitMonitoringResultUseCase({required this.monitoringRepository});

  @override
  Future<Either<Failure, BaseDomain>> execute(
      SubmitMonitoringResultUseCaseParams params) {
    return monitoringRepository.submitMonitoringResult(
      params.id,
      params.amount,
      params.inputMonitoringDatas,
    );
  }
}
