import 'package:injectable/injectable.dart';

import 'hive/permits_hive_manager.dart';
import 'model/permit_type_local.dart';

@lazySingleton
class PermitsLocalDataSource {
  final PermitsHiveManager _hiveManager;

  PermitsLocalDataSource(this._hiveManager);

  Future<void> savePermitTypes(List<PermitTypeLocal>? permitTypes) async {
    await _hiveManager.savePermitTypes(permitTypes);
  }

  Future<void> deletePermitTypes() async {
    await _hiveManager.deletePermitTypes();
  }

  List<PermitTypeLocal> getPermitTypes() {
    final _datas = _hiveManager.getPermitTypes();
    return _datas.map((e) => e as PermitTypeLocal).toList();
  }
}
