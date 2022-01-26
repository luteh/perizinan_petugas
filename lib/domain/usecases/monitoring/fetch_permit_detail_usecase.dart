import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/unions/failure.dart';
import '../../core/usecase/future_usecase.dart';
import '../../entities/monitoring/permit_detail_entity.dart';
import '../../repositories/monitoring_repository.dart';

class FetchPermitDetailUseCaseParams {
  final int id;

  FetchPermitDetailUseCaseParams(this.id);
}

@lazySingleton
class FetchPermitDetailUseCase
    extends FutureUseCase<PermitDetailEntity, FetchPermitDetailUseCaseParams> {
  final MonitoringRepository monitoringRepository;

  FetchPermitDetailUseCase({required this.monitoringRepository});

  @override
  Future<Either<Failure, PermitDetailEntity>> execute(
      FetchPermitDetailUseCaseParams params) {
    return monitoringRepository.fetchPermitDetail(params.id);
  }
}
