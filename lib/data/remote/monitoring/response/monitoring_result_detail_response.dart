// To parse this JSON data, do
//
//     final monitoringResultDetailResponse = monitoringResultDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/monitoring_result_detail_entity.dart';

part 'monitoring_result_detail_response.freezed.dart';
part 'monitoring_result_detail_response.g.dart';

MonitoringResultDetailResponse monitoringResultDetailResponseFromJson(
        String str) =>
    MonitoringResultDetailResponse.fromJson(json.decode(str));

String monitoringResultDetailResponseToJson(
        MonitoringResultDetailResponse data) =>
    json.encode(data.toJson());

@freezed
class MonitoringResultDetailResponse with _$MonitoringResultDetailResponse {
  const MonitoringResultDetailResponse._();
  const factory MonitoringResultDetailResponse({
    required int? submissionId,
    required int? amount,
    required List<MonitoringResponseResponse>? monitorings,
  }) = _MonitoringResultDetailResponse;

  factory MonitoringResultDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MonitoringResultDetailResponseFromJson(json);

  MonitoringResultDetailEntity toDomain() => MonitoringResultDetailEntity(
        submissionId: submissionId ?? 0,
        amount: amount ?? 0,
        monitorings: monitorings?.map((e) => e.toDomain()).toList() ?? [],
      );
}

@freezed
class MonitoringResponseResponse with _$MonitoringResponseResponse {
  const MonitoringResponseResponse._();
  const factory MonitoringResponseResponse({
    required String? submissionStatus,
    required String? monitoringDate,
    required List<ImageResponse>? images,
  }) = _MonitoringResponseResponse;

  factory MonitoringResponseResponse.fromJson(Map<String, dynamic> json) =>
      _$MonitoringResponseResponseFromJson(json);

  MonitoringResultEntity toDomain() => MonitoringResultEntity(
        submissionStatus: submissionStatus ?? '',
        monitoringDate: monitoringDate ?? '',
        images: images?.map((e) => e.toDomain()).toList() ?? [],
      );
}

@freezed
class ImageResponse with _$ImageResponse {
  const ImageResponse._();
  const factory ImageResponse({
    required int? id,
    required String? image,
    required String? description,
  }) = _ImageResponse;

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);

  ImageEntity toDomain() => ImageEntity(
        id: id ?? 0,
        image: image ?? '',
        description: description ?? '',
      );
}
