import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

// final sl = GetIt.instance; //sl is referred to as Service Locator
final getIt = GetIt.instance;

@injectableInit
void configureDependencies(String env) {
  $initGetIt(
    getIt,
    environment: env,
  );
}
