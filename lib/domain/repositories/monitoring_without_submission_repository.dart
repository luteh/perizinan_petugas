import 'package:fpdart/fpdart.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/input_monitoring_data.dart';

import '../core/unions/failure.dart';
import '../entities/monitoring_without_submission/monitoring_without_submission_entity.dart';

abstract class MonitoringWithoutSubmissionRepository {
  Future<Either<Failure, List<MonitoringWithoutSubmissionEntity>>>
      fetchMonitoringWithoutSubmissions(String keyword);

  Future<Either<Failure, String>> submitMonitoringData({
    required String name,
    required String unitName,
    required String phoneNumber,
    required String address,
    required String description,
    required double latitude,
    required double longitude,
    required List<InputMonitoringData> inputMonitoringDatas,
  });
}
