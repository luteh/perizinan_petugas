import 'package:fpdart/fpdart.dart';
import 'package:perizinan_petugas/domain/entities/base_domain.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/detail_customer_entity.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/input_monitoring_data.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/permit_detail_entity.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/submit_monitoring_result.dart';

import '../core/unions/failure.dart';
import '../entities/monitoring/monitoring_entity.dart';

abstract class MonitoringRepository {
  Future<Either<Failure, List<MonitoringEntity>>> fetchMonitoringList(
    String keyword,
    String? permitStatus,
    int? permitTypeId,
    DateTime? startDate,
    DateTime? endDate,
  );

  Future<Either<Failure, PermitDetailEntity>> fetchPermitDetail(int id);
  Future<Either<Failure, DetailCustomerEntity>> fetchDetailCustomer(int id);

  Future<Either<Failure, BaseDomain>> submitMonitoringResult(
    int id,
    int amount,
    List<InputMonitoringData> inputMonitoringDatas,
  );
}
