// To parse this JSON data, do
//
//     final submitMonitoringDataRequest = submitMonitoringDataRequestFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_monitoring_data_request.freezed.dart';
part 'submit_monitoring_data_request.g.dart';

SubmitMonitoringDataRequest submitMonitoringDataRequestFromJson(String str) =>
    SubmitMonitoringDataRequest.fromJson(json.decode(str));

String submitMonitoringDataRequestToJson(SubmitMonitoringDataRequest data) =>
    json.encode(data.toJson());

@freezed
class SubmitMonitoringDataRequest with _$SubmitMonitoringDataRequest {
  const factory SubmitMonitoringDataRequest({
    required String customerName,
    required String unitName,
    required String phoneNumber,
    required String address,
    // required String tanggal,
    required String detailKegiatan,
    required double longitude,
    required double latitude,
    required List<ImageRequest> images,
  }) = _SubmitMonitoringDataRequest;

  factory SubmitMonitoringDataRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitMonitoringDataRequestFromJson(json);
}

@freezed
class ImageRequest with _$ImageRequest {
  const factory ImageRequest({
    required String image,
    required String description,
  }) = _ImageRequest;

  factory ImageRequest.fromJson(Map<String, dynamic> json) =>
      _$ImageRequestFromJson(json);
}
