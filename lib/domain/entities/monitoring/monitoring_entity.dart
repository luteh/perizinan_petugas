import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_entity.freezed.dart';

@freezed
class MonitoringEntity with _$MonitoringEntity {
  const MonitoringEntity._();
  const factory MonitoringEntity({
    required int monitoringId,
    required int submissionId,
    required List<LokasiEntity> lokasi,
    required String submissionNumber,
    required String permitName,
    required String submissionPeriod,
    required String statusSubmision,
    required String submissionContactPersonName,
    required int permitType,
    required int amount,
  }) = _MonitoringEntity;

  double get latitude => double.parse(lokasi.first.latitude);
  double get longitude => double.parse(lokasi.first.longitude);
}

@freezed
class LokasiEntity with _$LokasiEntity {
  const factory LokasiEntity({
    required String latitude,
    required String longitude,
  }) = _LokasiEntity;
}
