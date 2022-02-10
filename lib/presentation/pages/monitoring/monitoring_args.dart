import 'package:perizinan_petugas/domain/entities/monitoring_without_submission/monitoring_without_submission_detail_entity.dart';

import '../../../domain/entities/monitoring/input_monitoring_data.dart';

enum MonitoringType {
  withPermit,
  withoutPermit,
  editWithoutPermit,
  editWithoutPermitImagesOnly,
}

class MonitoringArgs {
  final String? title;
  final int? id;
  final MonitoringType monitoringType;
  final List<InputMonitoringData> inputMonitoringDatas;
  final MonitoringWithoutSubmissionDetailEntity? withoutPermitDetail;
  final double? latitude;
  final double? longitude;

  const MonitoringArgs({
    this.title,
    this.id,
    this.monitoringType = MonitoringType.withoutPermit,
    this.inputMonitoringDatas = const [],
    this.withoutPermitDetail,
    this.latitude,
    this.longitude,
  });
}
