import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_result_detail_entity.freezed.dart';

@freezed
class MonitoringResultDetailEntity with _$MonitoringResultDetailEntity {
  const factory MonitoringResultDetailEntity({
    required int submissionId,
    required int amount,
    required List<MonitoringResultEntity> monitorings,
  }) = _MonitoringResultDetailEntity;
}

@freezed
class MonitoringResultEntity with _$MonitoringResultEntity {
  const factory MonitoringResultEntity({
    required String submissionStatus,
    required String monitoringDate,
    required List<ImageEntity> images,
  }) = _MonitoringResultEntity;
}

@freezed
class ImageEntity with _$ImageEntity {
  const factory ImageEntity({
    required int id,
    required String image,
    required String description,
  }) = _ImageEntity;
}
