import 'package:perizinan_petugas/domain/entities/monitoring_without_submission/monitoring_without_submission_detail_entity.dart';

class MonitoringDataArgs {
  final double latitude;
  final double longitude;
  final MonitoringWithoutSubmissionDetailEntity? withoutPermitDetail;

  const MonitoringDataArgs({
    required this.latitude,
    required this.longitude,
    this.withoutPermitDetail,
  });
}
