// To parse this JSON data, do
//
//     final monitoringResponse = monitoringResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/monitoring_entity.dart';

part 'monitoring_response.freezed.dart';
part 'monitoring_response.g.dart';

MonitoringResponse monitoringResponseFromJson(String str) =>
    MonitoringResponse.fromJson(json.decode(str));

String monitoringResponseToJson(MonitoringResponse data) =>
    json.encode(data.toJson());

@freezed
class MonitoringResponse with _$MonitoringResponse {
  const MonitoringResponse._();
  const factory MonitoringResponse({
    required int? monitoringId,
    required int? submissionId,
    required List<LokasiResponse>? lokasi,
    required String? submissionNumber,
    required String? permitName,
    required String? submissionPeriod,
    required String? statusSubmision,
    required String? submissionContactPersonName,
    required int? permitType,
    required int? amount,
  }) = _MonitoringResponse;

  factory MonitoringResponse.fromJson(Map<String, dynamic> json) =>
      _$MonitoringResponseFromJson(json);

  MonitoringEntity toDomain() => MonitoringEntity(
        monitoringId: monitoringId ?? 0,
        submissionId: submissionId ?? 0,
        lokasi: lokasi?.map((e) => e.toDomain()).toList() ?? [],
        submissionNumber: submissionNumber ?? '',
        permitName: permitName ?? '',
        submissionPeriod: submissionPeriod ?? '',
        statusSubmision: statusSubmision ?? '',
        submissionContactPersonName: submissionContactPersonName ?? '',
        permitType: permitType ?? 0,
        amount: amount ?? 0,
      );
}

@freezed
class LokasiResponse with _$LokasiResponse {
  const LokasiResponse._();
  const factory LokasiResponse({
    required String? latitude,
    required String? longitude,
  }) = _LokasiResponse;

  factory LokasiResponse.fromJson(Map<String, dynamic> json) =>
      _$LokasiResponseFromJson(json);

  LokasiEntity toDomain() => LokasiEntity(
        latitude: latitude ?? '',
        longitude: longitude ?? '',
      );
}
