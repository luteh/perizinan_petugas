// To parse this JSON data, do
//
//     final monitoringWithoutSubmissionResponse = monitoringWithoutSubmissionResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perizinan_petugas/domain/entities/monitoring_without_submission/monitoring_without_submission_entity.dart';

part 'monitoring_without_submission_response.freezed.dart';
part 'monitoring_without_submission_response.g.dart';

MonitoringWithoutSubmissionResponse monitoringWithoutSubmissionResponseFromJson(
        String str) =>
    MonitoringWithoutSubmissionResponse.fromJson(json.decode(str));

String monitoringWithoutSubmissionResponseToJson(
        MonitoringWithoutSubmissionResponse data) =>
    json.encode(data.toJson());

@freezed
class MonitoringWithoutSubmissionResponse
    with _$MonitoringWithoutSubmissionResponse {
  const MonitoringWithoutSubmissionResponse._();
  const factory MonitoringWithoutSubmissionResponse({
    required int? customerId,
    required LokasiResponse? lokasi,
    required String? unitCode,
    required String? unitName,
    required String? monitoringDate,
    required String? customerName,
    required String? description,
  }) = _MonitoringWithoutSubmissionResponse;

  factory MonitoringWithoutSubmissionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MonitoringWithoutSubmissionResponseFromJson(json);

  MonitoringWithoutSubmissionEntity toDomain() =>
      MonitoringWithoutSubmissionEntity(
        customerId: customerId ?? 0,
        lokasi: lokasi?.toDomain() ??
            const LokasiEntity(
              latitude: 0,
              longitude: 0,
            ),
        unitCode: unitCode ?? '',
        unitName: unitName ?? '',
        monitoringDate: monitoringDate ?? '',
        customerName: customerName ?? '',
        description: description ?? '',
      );
}

@freezed
class LokasiResponse with _$LokasiResponse {
  const LokasiResponse._();
  const factory LokasiResponse({
    required double? latitude,
    required double? longitude,
  }) = _LokasiResponse;

  factory LokasiResponse.fromJson(Map<String, dynamic> json) =>
      _$LokasiResponseFromJson(json);

  LokasiEntity toDomain() => LokasiEntity(
        latitude: latitude ?? 0,
        longitude: longitude ?? 0,
      );
}
