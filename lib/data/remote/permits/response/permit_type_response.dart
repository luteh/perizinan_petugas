// To parse this JSON data, do
//
//     final permitTypeResponse = permitTypeResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perizinan_petugas/data/local/permits/model/permit_type_local.dart';
import 'package:perizinan_petugas/domain/entities/permits/permit_type_entity.dart';

part 'permit_type_response.freezed.dart';
part 'permit_type_response.g.dart';

PermitTypeResponse permitTypeResponseFromJson(String str) =>
    PermitTypeResponse.fromJson(json.decode(str));

String permitTypeResponseToJson(PermitTypeResponse data) =>
    json.encode(data.toJson());

@freezed
class PermitTypeResponse with _$PermitTypeResponse {
  const PermitTypeResponse._();
  const factory PermitTypeResponse({
    required int? id,
    required String? name,
  }) = _PermitTypeResponse;

  factory PermitTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$PermitTypeResponseFromJson(json);

  PermitTypeEntity toDomain() => PermitTypeEntity(
        id: id ?? 0,
        name: name ?? '',
      );

  PermitTypeLocal toLocal() => PermitTypeLocal(
        id: id ?? 0,
        name: name ?? '',
      );
}
