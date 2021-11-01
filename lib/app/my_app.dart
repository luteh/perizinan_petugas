import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/constants/strings.dart';
import '../core/style/app_theme.dart';
import '../data/local/local_data_source.dart';
import '../di/injection_container.dart';
import '../presentation/pages/login/login_page.dart';
import '../presentation/pages/main/main_page.dart';
import 'app_blocs.dart';
import 'app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    // final _initialRoute = getIt.get<LocalDataSource>().getToken() == null
    //     ? LoginPage.routeName
    //     : MainPage.routeName;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        return GetMaterialApp(
          smartManagement: SmartManagement.full,
          enableLog: false,
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          theme: AppTheme.lightTheme,
          initialRoute: LoginPage.routeName,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
