// To parse this JSON data, do
//
//     final detailCustomerResponse = detailCustomerResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/detail_customer_entity.dart';

part 'detail_customer_response.freezed.dart';
part 'detail_customer_response.g.dart';

DetailCustomerResponse detailCustomerResponseFromJson(String str) =>
    DetailCustomerResponse.fromJson(json.decode(str));

String detailCustomerResponseToJson(DetailCustomerResponse data) =>
    json.encode(data.toJson());

@freezed
class DetailCustomerResponse with _$DetailCustomerResponse {
  const DetailCustomerResponse._();
  const factory DetailCustomerResponse({
    required int? id,
    required String? name,
    required String? unitCode,
    required String? unitProjectName,
    required String? unitName,
    required String? unitCategoryName,
    required String? unitTypeName,
    required String? unitBuildingArea,
    required String? unitLandArea,
    required String? emailAddress,
    required String? phoneNumber,
    required String? idCardNumber,
    required String? idCardImageName,
  }) = _DetailCustomerResponse;

  factory DetailCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailCustomerResponseFromJson(json);

  DetailCustomerEntity toDomain() => DetailCustomerEntity(
        id: id ?? 0,
        name: name ?? '',
        unitCode: unitCode ?? '',
        unitProjectName: unitProjectName ?? '',
        unitName: unitName ?? '',
        unitCategoryName: unitCategoryName ?? '',
        unitTypeName: unitTypeName ?? '',
        unitBuildingArea: unitBuildingArea ?? '',
        unitLandArea: unitLandArea ?? '',
        emailAddress: emailAddress ?? '',
        phoneNumber: phoneNumber ?? '',
        idCardNumber: idCardNumber ?? '',
        idCardImageName: idCardImageName ?? '',
      );
}
