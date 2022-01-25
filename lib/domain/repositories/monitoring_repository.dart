import 'package:fpdart/fpdart.dart';

import '../core/unions/failure.dart';
import '../entities/monitoring/monitoring_entity.dart';

abstract class MonitoringRepository {
  Future<Either<Failure, List<MonitoringEntity>>> fetchMonitoringList(
      String keyword);
}
