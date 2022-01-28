import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/unions/failure.dart';
import '../../core/usecase/future_usecase.dart';
import '../../entities/monitoring/monitoring_entity.dart';
import '../../repositories/monitoring_repository.dart';

class FetchMonitoringListUseCaseParams {
  final String keyword;
  final String? permitStatus;
  final int? permitTypeId;
  final DateTime? startDate;
  final DateTime? endDate;

  FetchMonitoringListUseCaseParams(this.keyword, this.permitStatus,
      this.permitTypeId, this.startDate, this.endDate);
}

@lazySingleton
class FetchMonitoringListUseCase extends FutureUseCase<List<MonitoringEntity>,
    FetchMonitoringListUseCaseParams> {
  final MonitoringRepository monitoringRepository;

  FetchMonitoringListUseCase({required this.monitoringRepository});

  @override
  Future<Either<Failure, List<MonitoringEntity>>> execute(
      FetchMonitoringListUseCaseParams params) {
    return monitoringRepository.fetchMonitoringList(
      params.keyword,
      params.permitStatus,
      params.permitTypeId,
      params.startDate,
      params.endDate,
    );
  }
}
