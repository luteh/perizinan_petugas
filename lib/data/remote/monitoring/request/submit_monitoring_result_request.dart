// To parse this JSON data, do
//
//     final submitMonitoringResultRequest = submitMonitoringResultRequestFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_monitoring_result_request.freezed.dart';
part 'submit_monitoring_result_request.g.dart';

SubmitMonitoringResultRequest submitMonitoringResultRequestFromJson(
        String str) =>
    SubmitMonitoringResultRequest.fromJson(json.decode(str));

String submitMonitoringResultRequestToJson(
        SubmitMonitoringResultRequest data) =>
    json.encode(data.toJson());

@freezed
class SubmitMonitoringResultRequest with _$SubmitMonitoringResultRequest {
  const factory SubmitMonitoringResultRequest({
    required int id,
    required int? amount,
    required List<ImageRequest> images,
  }) = _SubmitMonitoringResultRequest;

  factory SubmitMonitoringResultRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitMonitoringResultRequestFromJson(json);
}

@freezed
class ImageRequest with _$ImageRequest {
  const factory ImageRequest({
    required String image,
    required String description,
  }) = _ImageRequest;

  factory ImageRequest.fromJson(Map<String, dynamic> json) => _$ImageRequestFromJson(json);
}
