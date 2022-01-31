// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perizinan_petugas/domain/entities/base_domain.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> with _$BaseResponse<T> {
  const BaseResponse._();
  const factory BaseResponse({
    required bool? succeeded,
    required String? message,
    required List<String>? errors,
    required T data,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$BaseResponseFromJson<T>(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return _$BaseResponseToJson<T>(this, toJsonT);
  }

  BaseDomain toDomain() {
    return BaseDomain(
      succeeded: succeeded ?? false,
      message: message ?? '',
    );
  }
}
