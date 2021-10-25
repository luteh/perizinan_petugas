import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';

import '/app/init_hive.dart';
import 'app/my_app.dart';
import 'app/my_bloc_observer.dart';
import 'di/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');

  Bloc.observer = MyBlocObserver();
  await initHive();
  configureDependencies(Environment.dev);
  runApp(const MyApp());
}
