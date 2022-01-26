import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_customer_entity.freezed.dart';

@freezed
class DetailCustomerEntity with _$DetailCustomerEntity {
  const factory DetailCustomerEntity({
    required int id,
    required String name,
    required String unitCode,
    required String unitProjectName,
    required String unitName,
    required String unitCategoryName,
    required String unitTypeName,
    required String unitBuildingArea,
    required String unitLandArea,
    required String emailAddress,
    required String phoneNumber,
    required String idCardNumber,
    required String idCardImageName,
  }) = _DetailCustomerEntity;
}
