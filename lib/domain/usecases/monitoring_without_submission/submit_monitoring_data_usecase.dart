import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/unions/failure.dart';
import '../../core/usecase/future_usecase.dart';
import '../../entities/monitoring/input_monitoring_data.dart';
import '../../repositories/monitoring_without_submission_repository.dart';

class SubmitMonitoringDataUseCaseParams {
  final String name;
  final String unitName;
  final String phoneNumber;
  final String address;
  final String description;
  final double latitude;
  final double longitude;
  final List<InputMonitoringData> inputMonitoringDatas;

  SubmitMonitoringDataUseCaseParams({
    required this.name,
    required this.unitName,
    required this.phoneNumber,
    required this.address,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.inputMonitoringDatas,
  });
}

@lazySingleton
class SubmitMonitoringDataUseCase
    extends FutureUseCase<String, SubmitMonitoringDataUseCaseParams> {
  final MonitoringWithoutSubmissionRepository repository;

  SubmitMonitoringDataUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> execute(
      SubmitMonitoringDataUseCaseParams params) {
    return repository.submitMonitoringData(
      name: params.name,
      unitName: params.unitName,
      phoneNumber: params.phoneNumber,
      address: params.address,
      description: params.description,
      latitude: params.latitude,
      longitude: params.longitude,
      inputMonitoringDatas: params.inputMonitoringDatas,
    );
  }
}
