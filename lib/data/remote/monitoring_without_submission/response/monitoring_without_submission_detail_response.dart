// To parse this JSON data, do
//
//     final monitoringWithoutSubmissionDetailResponse = monitoringWithoutSubmissionDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perizinan_petugas/domain/entities/monitoring_without_submission/monitoring_without_submission_detail_entity.dart';

part 'monitoring_without_submission_detail_response.freezed.dart';
part 'monitoring_without_submission_detail_response.g.dart';

MonitoringWithoutSubmissionDetailResponse
    monitoringWithoutSubmissionDetailResponseFromJson(String str) =>
        MonitoringWithoutSubmissionDetailResponse.fromJson(json.decode(str));

String monitoringWithoutSubmissionDetailResponseToJson(
        MonitoringWithoutSubmissionDetailResponse data) =>
    json.encode(data.toJson());

@freezed
class MonitoringWithoutSubmissionDetailResponse
    with _$MonitoringWithoutSubmissionDetailResponse {
  const MonitoringWithoutSubmissionDetailResponse._();
  const factory MonitoringWithoutSubmissionDetailResponse({
    required int? id,
    required String? name,
    required String? unitCode,
    required String? unitName,
    required String? address,
    required String? phoneNumber,
    required String? monitoringDate,
    required String? description,
    required List<ImageResponse>? images,
  }) = _MonitoringWithoutSubmissionDetailResponse;

  factory MonitoringWithoutSubmissionDetailResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MonitoringWithoutSubmissionDetailResponseFromJson(json);

  MonitoringWithoutSubmissionDetailEntity toDomain() =>
      MonitoringWithoutSubmissionDetailEntity(
        id: id ?? 0,
        name: name ?? '',
        unitCode: unitCode ?? '',
        unitName: unitName ?? '',
        address: address ?? '',
        phoneNumber: phoneNumber ?? '',
        monitoringDate: monitoringDate ?? '',
        description: description ?? '',
        images: images?.map((e) => e.toDomain()).toList() ?? [],
      );
}

@freezed
class ImageResponse with _$ImageResponse {
  const ImageResponse._();
  const factory ImageResponse({
    required int? id,
    required String? image,
    required String? descriptions,
  }) = _ImageResponse;

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);

  ImageEntity toDomain() => ImageEntity(
        id: id ?? 0,
        image: image ?? '',
        descriptions: descriptions ?? '',
      );
}
