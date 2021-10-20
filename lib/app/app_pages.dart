import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:perizinan_petugas/di/injection_container.dart';
import 'package:perizinan_petugas/presentation/login/bloc/login_bloc.dart';
import 'package:perizinan_petugas/presentation/main/cubit/main_cubit.dart';

import '../presentation/login/login_page.dart';
import '../presentation/main/main_page.dart';

class AppPages {
  const AppPages._();

  static final List<GetPage> routes = [
    GetPage(
      name: LoginPage.routeName,
      page: () => BlocProvider<LoginBloc>(
        create: (context) => getIt.get(),
        child: const LoginPage(),
      ),
    ),
    GetPage(
      name: MainPage.routeName,
      page: () => BlocProvider<MainCubit>(
        create: (context) => getIt.get(),
        child: const MainPage(),
      ),
    ),
  ];
}
