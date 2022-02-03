import 'package:freezed_annotation/freezed_annotation.dart';
part 'monitoring_without_submission_entity.freezed.dart';

@freezed
class MonitoringWithoutSubmissionEntity
    with _$MonitoringWithoutSubmissionEntity {
  const factory MonitoringWithoutSubmissionEntity({
    required int customerId,
    required LokasiEntity lokasi,
    required String unitCode,
    required String unitName,
    required String monitoringDate,
    required String customerName,
    required String description,
  }) = _MonitoringWithoutSubmissionEntity;
}

@freezed
class LokasiEntity with _$LokasiEntity {
  const factory LokasiEntity({
    required double latitude,
    required double longitude,
  }) = _LokasiEntity;
}
