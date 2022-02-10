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

  const MonitoringArgs({
    this.title,
    this.id,
    this.monitoringType = MonitoringType.withoutPermit,
    this.inputMonitoringDatas = const [],
  });
}
