import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/unions/failure.dart';
import '../../core/usecase/future_usecase.dart';
import '../../entities/monitoring/detail_customer_entity.dart';
import '../../repositories/monitoring_repository.dart';

class FetchCustomerDetailUseCaseParams {
  final int id;

  FetchCustomerDetailUseCaseParams(this.id);
}

@lazySingleton
class FetchCustomerDetailUseCase extends FutureUseCase<DetailCustomerEntity,
    FetchCustomerDetailUseCaseParams> {
  final MonitoringRepository monitoringRepository;

  FetchCustomerDetailUseCase({required this.monitoringRepository});

  @override
  Future<Either<Failure, DetailCustomerEntity>> execute(
      FetchCustomerDetailUseCaseParams params) {
    return monitoringRepository.fetchDetailCustomer(params.id);
  }
}
