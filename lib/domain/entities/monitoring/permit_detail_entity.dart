import 'package:freezed_annotation/freezed_annotation.dart';

part 'permit_detail_entity.freezed.dart';

@freezed
class PermitDetailEntity with _$PermitDetailEntity {
    const factory PermitDetailEntity({
        required String name,
        required String number,
        required String startDate,
        required String endDate,
        required List<LocationEntity> location,
        required List<BiayaEntity> biaya,
        required String unitLandArea,
        required String unitBuildingArea,
        required String description,
        required String landSize,
        required String shootingTotalUnit,
        required String shootingUnitCode,
        required int shootingRentType,
        required String totalVehicle,
        required String totalTrack,
        required int vehicleWheelType,
        required String totalVehicleWithExtraWheel,
        required String totalTrackWithExtraWheel,
        required String totalBanner,
        required String tentSize,
        required String totalBrochure,
        required int permitId,
        required String imgPayment,
        required String submissionStatus,
    }) = _PermitDetailEntity;
}

@freezed
class BiayaEntity with _$BiayaEntity {
    const factory BiayaEntity({
        required int costId,
        required String detailBiaya,
        required String namaBiaya,
        required String amount,
    }) = _BiayaEntity;
}

@freezed
class LocationEntity with _$LocationEntity {
    const factory LocationEntity({
        required String latitude,
        required String longitude,
    }) = _LocationEntity;
}
