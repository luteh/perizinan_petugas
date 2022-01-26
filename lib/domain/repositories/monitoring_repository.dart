import 'package:fpdart/fpdart.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/permit_detail_entity.dart';

import '../core/unions/failure.dart';
import '../entities/monitoring/monitoring_entity.dart';

abstract class MonitoringRepository {
  Future<Either<Failure, List<MonitoringEntity>>> fetchMonitoringList(
      String keyword);

  Future<Either<Failure, PermitDetailEntity>> fetchPermitDetail(int id);
}
