import 'package:freezed_annotation/freezed_annotation.dart';

part 'permit_type_entity.freezed.dart';

@freezed
class PermitTypeEntity with _$PermitTypeEntity {
  const factory PermitTypeEntity({
    required int id,
    required String name,
  }) = _PermitTypeEntity;
}
