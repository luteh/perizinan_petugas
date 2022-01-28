import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../domain/entities/permits/permit_type_entity.dart';
import '../../core/hive_type_id.dart';

part 'permit_type_local.freezed.dart';
part 'permit_type_local.g.dart';

@freezed
class PermitTypeLocal with _$PermitTypeLocal {
  const PermitTypeLocal._();
  @HiveType(
      typeId: HiveTypeId.permitsLocal, adapterName: 'PermitTypeLocalAdapter')
  const factory PermitTypeLocal({
    @HiveField(0) required int? id,
    @HiveField(1) required String? name,
  }) = _PermitTypeLocal;

  PermitTypeEntity toDomain() => PermitTypeEntity(
        id: id ?? 0,
        name: name ?? '',
      );
}
