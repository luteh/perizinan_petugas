import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../hive/hive_key.dart';
import '../model/permit_type_local.dart';

@lazySingleton
class PermitsHiveManager {
  final Box<dynamic> _box;

  PermitsHiveManager(this._box);

  Future<void> savePermitTypes(List<PermitTypeLocal>? permitTypes) async {
    await _box.put(HiveKey.permitTypes, permitTypes);
  }

  Future<void> deletePermitTypes() async {
    await _box.delete(HiveKey.permitTypes);
  }

  List<PermitTypeLocal>? getPermitTypes() {
    return _box.get(HiveKey.permitTypes);
  }
}
