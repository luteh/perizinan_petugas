// To parse this JSON data, do
//
//     final permitDetailResponse = permitDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/permit_detail_entity.dart';

part 'permit_detail_response.freezed.dart';
part 'permit_detail_response.g.dart';

PermitDetailResponse permitDetailResponseFromJson(String str) =>
    PermitDetailResponse.fromJson(json.decode(str));

String permitDetailResponseToJson(PermitDetailResponse data) =>
    json.encode(data.toJson());

@freezed
class PermitDetailResponse with _$PermitDetailResponse {
  const PermitDetailResponse._();
  const factory PermitDetailResponse({
    required String? name,
    required String? number,
    required String? startDate,
    required String? endDate,
    required List<LocationResponse>? location,
    required List<BiayaResponse>? biaya,
    required String? unitLandArea,
    required String? unitBuildingArea,
    required String? description,
    required String? landSize,
    required String? shootingTotalUnit,
    required String? shootingUnitCode,
    required int? shootingRentType,
    required String? totalVehicle,
    required String? totalTrack,
    required int? vehicleWheelType,
    required String? totalVehicleWithExtraWheel,
    required String? totalTrackWithExtraWheel,
    required String? totalBanner,
    required String? tentSize,
    required String? totalBrochure,
    required int? permitId,
    required String? imgPayment,
    required String? submissionStatus,
  }) = _PermitDetailResponse;

  factory PermitDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PermitDetailResponseFromJson(json);

  PermitDetailEntity toDomain() => PermitDetailEntity(
        name: name ?? '',
        number: number ?? '',
        startDate: startDate ?? '',
        endDate: endDate ?? '',
        location: location?.map((e) => e.toDomain()).toList() ?? [],
        biaya: biaya?.map((e) => e.toDomain()).toList() ?? [],
        unitLandArea: unitLandArea ?? '',
        unitBuildingArea: unitBuildingArea ?? '',
        description: description ?? '',
        landSize: landSize ?? '',
        shootingTotalUnit: shootingTotalUnit ?? '',
        shootingUnitCode: shootingUnitCode ?? '',
        shootingRentType: shootingRentType ?? 0,
        totalVehicle: totalVehicle ?? '',
        totalTrack: totalTrack ?? '',
        vehicleWheelType: vehicleWheelType ?? 0,
        totalVehicleWithExtraWheel: totalVehicleWithExtraWheel ?? '',
        totalTrackWithExtraWheel: totalTrackWithExtraWheel ?? '',
        totalBanner: totalBanner ?? '',
        tentSize: tentSize ?? '',
        totalBrochure: totalBrochure ?? '',
        permitId: permitId ?? 0,
        imgPayment: imgPayment ?? '',
        submissionStatus: submissionStatus ?? '',
      );
}

@freezed
class BiayaResponse with _$BiayaResponse {
  const BiayaResponse._();
  const factory BiayaResponse({
    required int? costId,
    required String? detailBiaya,
    required String? namaBiaya,
    required String? amount,
  }) = _BiayaResponse;

  factory BiayaResponse.fromJson(Map<String, dynamic> json) =>
      _$BiayaResponseFromJson(json);

  BiayaEntity toDomain() => BiayaEntity(
        costId: costId ?? 0,
        detailBiaya: detailBiaya ?? '',
        namaBiaya: namaBiaya ?? '',
        amount: amount ?? '',
      );
}

@freezed
class LocationResponse with _$LocationResponse {
  const LocationResponse._();
  const factory LocationResponse({
    required String? latitude,
    required String? longitude,
  }) = _LocationResponse;

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  LocationEntity toDomain() => LocationEntity(
        latitude: latitude ?? '',
        longitude: longitude ?? '',
      );
}
