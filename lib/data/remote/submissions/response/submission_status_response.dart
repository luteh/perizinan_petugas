// To parse this JSON data, do
//
//     final submissionStatusResponse = submissionStatusResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perizinan_petugas/data/local/submissions/model/submission_status_local.dart';
import 'package:perizinan_petugas/domain/entities/submissions/submission_status_entity.dart';

part 'submission_status_response.freezed.dart';
part 'submission_status_response.g.dart';

SubmissionStatusResponse submissionStatusResponseFromJson(String str) =>
    SubmissionStatusResponse.fromJson(json.decode(str));

String submissionStatusResponseToJson(SubmissionStatusResponse data) =>
    json.encode(data.toJson());

@freezed
class SubmissionStatusResponse with _$SubmissionStatusResponse {
  const SubmissionStatusResponse._();
  const factory SubmissionStatusResponse({
    required int? id,
    required String? name,
    required String? status,
  }) = _SubmissionStatusResponse;

  factory SubmissionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmissionStatusResponseFromJson(json);

  SubmissionStatusEntity toDomain() => SubmissionStatusEntity(
        id: id ?? 0,
        name: name ?? '',
        status: status ?? '',
      );

  SubmissionStatusLocal toLocal() => SubmissionStatusLocal(
        id: id ?? 0,
        name: name ?? '',
        status: status ?? '',
      );
}
