import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../domain/entities/submissions/submission_status_entity.dart';
import '../../core/hive_type_id.dart';

part 'submission_status_local.freezed.dart';
part 'submission_status_local.g.dart';

@freezed
class SubmissionStatusLocal with _$SubmissionStatusLocal {
  const SubmissionStatusLocal._();
  @HiveType(
      typeId: HiveTypeId.submissionsLocal,
      adapterName: 'SubmissionStatusesLocalAdapter')
  const factory SubmissionStatusLocal({
    @HiveField(0) required int? id,
    @HiveField(1) required String? name,
    @HiveField(2) required String? status,
  }) = _SubmissionStatusLocal;

  SubmissionStatusEntity toDomain() => SubmissionStatusEntity(
        id: id ?? 0,
        name: name ?? '',
        status: status ?? '',
      );
}
