import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_without_submission_detail_entity.freezed.dart';

@freezed
class MonitoringWithoutSubmissionDetailEntity
    with _$MonitoringWithoutSubmissionDetailEntity {
  const factory MonitoringWithoutSubmissionDetailEntity({
    required int id,
    required String name,
    required String unitCode,
    required String unitName,
    required String address,
    required String phoneNumber,
    required String monitoringDate,
    required String description,
    required List<ImageEntity> images,
  }) = _MonitoringWithoutSubmissionDetailEntity;
}

@freezed
class ImageEntity with _$ImageEntity {
  const factory ImageEntity({
    required int id,
    required String image,
    required String descriptions,
  }) = _ImageEntity;
}
