import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    int? id,
    int? userRoleId,
    String? name,
    String? email,
    String? phoneNumber,
    String? avatar,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;
}
