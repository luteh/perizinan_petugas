import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/token/request_token_response.dart';

import 'entity/login/user_entity.dart';
import 'hive/hive_manager.dart';

@lazySingleton
class LocalDataSource {
  final HiveManager _hiveManager;

  LocalDataSource(this._hiveManager);

  Future<void> saveToken(String? tokenJson) async {
    await _hiveManager.saveToken(tokenJson);
  }

  Future<void> deleteToken() async {
    await _hiveManager.deleteToken();
  }

  RequestTokenResponse? getToken() {
    if (_hiveManager.getToken() == null) return null;

    return RequestTokenResponse.fromJson(jsonDecode(_hiveManager.getToken()!));
  }

  Future<void> saveUser(UserEntity? userEntity) async {
    await _hiveManager.saveUser(userEntity);
  }

  Future<void> deleteUser() async {
    await _hiveManager.deleteUser();
  }

  UserEntity? getUser() {
    return _hiveManager.getUser();
  }
}
