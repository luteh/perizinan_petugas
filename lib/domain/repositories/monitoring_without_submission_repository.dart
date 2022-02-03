import 'package:fpdart/fpdart.dart';

import '../core/unions/failure.dart';
import '../entities/monitoring_without_submission/monitoring_without_submission_entity.dart';

abstract class MonitoringWithoutSubmissionRepository {
  Future<Either<Failure, List<MonitoringWithoutSubmissionEntity>>>
      fetchMonitoringWithoutSubmissions(String keyword);
}
