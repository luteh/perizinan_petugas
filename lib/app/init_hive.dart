import '../data/local/entity/login/user_entity.dart';
import '../data/local/hive/hive_key.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox(HiveKey.boxMsGlow);
}
