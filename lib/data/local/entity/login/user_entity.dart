import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../domain/entities/login/user.dart';
import '../../hive/hive_type_id.dart';

part 'user_entity.g.dart';

@HiveType(typeId: HiveTypeId.userEntity)
class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.userRoleId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
  });

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final int? userRoleId;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final String? phoneNumber;
  @HiveField(5)
  final String? avatar;
  @HiveField(6)
  final DateTime? createdAt;
  @HiveField(7)
  final DateTime? updatedAt;

  @override
  List<Object?> get props {
    return [
      id,
      userRoleId,
      name,
      email,
      phoneNumber,
      avatar,
      createdAt,
      updatedAt,
    ];
  }

  User toDomain() => User(
        id: id,
        userRoleId: userRoleId,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        avatar: avatar,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
