import 'package:perizinan_petugas/data/local/permits/model/permit_type_local.dart';
import 'package:perizinan_petugas/data/local/submissions/model/submission_status_local.dart';

import '../data/local/entity/login/user_entity.dart';
import '../data/local/hive/hive_key.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  Hive.registerAdapter(PermitTypeLocalAdapter());
  Hive.registerAdapter(SubmissionStatusesLocalAdapter());
  await Hive.openBox(HiveKey.boxDpg);
}
