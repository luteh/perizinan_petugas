import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../entity/login/user_entity.dart';
import '../hive/hive_key.dart';

@lazySingleton
class HiveManager {
  final Box<dynamic> _box;

  HiveManager(this._box);

  Future<void> saveToken(String? tokenJson) async {
    await _box.put(HiveKey.token, tokenJson);
  }

  Future<void> deleteToken() async {
    await _box.delete(HiveKey.token);
  }

  String? getToken() {
    return _box.get(HiveKey.token);
  }

  Future<void> saveUser(UserEntity? userEntity) async {
    await _box.put(HiveKey.user, userEntity);
  }

  Future<void> deleteUser() async {
    await _box.delete(HiveKey.user);
  }

  UserEntity? getUser() {
    return _box.get(HiveKey.user);
  }
}
