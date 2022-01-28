import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_status_entity.freezed.dart';

@freezed
class SubmissionStatusEntity with _$SubmissionStatusEntity {
  const factory SubmissionStatusEntity({
    required int id,
    required String name,
    required String status,
  }) = _SubmissionStatusEntity;
}
