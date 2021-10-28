import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:perizinan_petugas/di/injection_container.dart';
import 'package:perizinan_petugas/presentation/change_password/change_password_page.dart';
import 'package:perizinan_petugas/presentation/change_password/cubit/change_password_cubit.dart';
import 'package:perizinan_petugas/presentation/code_verification/code_verification_args.dart';
import 'package:perizinan_petugas/presentation/code_verification/code_verification_page.dart';
import 'package:perizinan_petugas/presentation/code_verification/cubit/code_verification_cubit.dart';
import 'package:perizinan_petugas/presentation/email_verification/cubit/email_verification_cubit.dart';
import 'package:perizinan_petugas/presentation/email_verification/email_verification_page.dart';
import 'package:perizinan_petugas/presentation/login/bloc/login_cubit.dart';
import 'package:perizinan_petugas/presentation/main/cubit/main_cubit.dart';
import 'package:perizinan_petugas/presentation/main/views/home/cubit/home_cubit.dart';
import 'package:perizinan_petugas/presentation/main/views/notification/cubit/notification_cubit.dart';
import 'package:perizinan_petugas/presentation/main/views/profile/cubit/profile_cubit.dart';
import 'package:perizinan_petugas/presentation/main/views/tanpa_izin/cubit/tanpa_izin_cubit.dart';
import 'package:perizinan_petugas/presentation/monitoring/cubit/monitoring_cubit.dart';
import 'package:perizinan_petugas/presentation/monitoring/monitoring_args.dart';
import 'package:perizinan_petugas/presentation/monitoring/monitoring_page.dart';
import 'package:perizinan_petugas/presentation/monitoring_data/cubit/monitoring_data_cubit.dart';
import 'package:perizinan_petugas/presentation/monitoring_data/monitoring_data_args.dart';
import 'package:perizinan_petugas/presentation/monitoring_data/monitoring_data_page.dart';
import 'package:perizinan_petugas/presentation/monitoring_result.dart/cubit/monitoring_result_cubit.dart';
import 'package:perizinan_petugas/presentation/monitoring_result.dart/monitoring_result_page.dart';
import 'package:perizinan_petugas/presentation/permission_detail/cubit/permission_detail_cubit.dart';
import 'package:perizinan_petugas/presentation/permission_detail/permission_detail_page.dart';
import 'package:perizinan_petugas/presentation/without_permit_detail/cubit/without_permit_detail_cubit.dart';
import 'package:perizinan_petugas/presentation/without_permit_detail/without_permit_detail_page.dart';

import '../presentation/login/login_page.dart';
import '../presentation/main/main_page.dart';

class AppPages {
  const AppPages._();

  static final List<GetPage> routes = [
    GetPage(
      name: LoginPage.routeName,
      page: () => BlocProvider<LoginCubit>(
        create: (context) => getIt.get(),
        child: const LoginPage(),
      ),
    ),
    GetPage(
      name: EmailVerificationPage.routeName,
      page: () => BlocProvider<EmailVerificationCubit>(
        create: (context) => getIt.get(),
        child: const EmailVerificationPage(),
      ),
    ),
    GetPage(
      name: CodeVerificationPage.routeName,
      page: () {
        final _args = Get.arguments as CodeVerificationArgs;

        return BlocProvider<CodeVerificationCubit>(
          create: (context) => getIt.get()..onStarted(args: _args),
          child: const CodeVerificationPage(),
        );
      },
    ),
    GetPage(
      name: ChangePasswordPage.routeName,
      page: () {
        // final _args = Get.arguments as ChangePasswordArgs;

        return BlocProvider<ChangePasswordCubit>(
          create: (context) => getIt.get()..onStarted(),
          child: const ChangePasswordPage(),
        );
      },
    ),
    GetPage(
      name: MainPage.routeName,
      page: () => MultiBlocProvider(
        providers: [
          BlocProvider<MainCubit>(
            create: (context) => getIt.get(),
          ),
          BlocProvider<HomeCubit>(
            create: (context) => getIt.get(),
          ),
          BlocProvider<TanpaIzinCubit>(
            create: (context) => getIt.get()..onStarted(),
          ),
          BlocProvider<ProfileCubit>(
            create: (context) => getIt.get(),
          ),
          BlocProvider<NotificationCubit>(
            create: (context) => getIt.get(),
          ),
        ],
        child: const MainPage(),
      ),
    ),
    GetPage(
      name: PermissionDetailPage.routeName,
      page: () => BlocProvider<PermissionDetailCubit>(
        create: (context) => getIt.get(),
        child: const PermissionDetailPage(),
      ),
    ),
    GetPage(
      name: MonitoringPage.routeName,
      page: () {
        final _args = Get.arguments as MonitoringArgs?;

        return BlocProvider<MonitoringCubit>(
          create: (context) => getIt.get(),
          child: MonitoringPage(
            args: _args,
          ),
        );
      },
    ),
    GetPage(
      name: MonitoringResultPage.routeName,
      page: () => BlocProvider<MonitoringResultCubit>(
        create: (context) => getIt.get(),
        child: const MonitoringResultPage(),
      ),
    ),
    GetPage(
        name: MonitoringDataPage.routeName,
        page: () {
          final _args = Get.arguments as MonitoringDataArgs?;

          return BlocProvider<MonitoringDataCubit>(
            create: (context) => getIt.get(),
            child: MonitoringDataPage(
              args: _args,
            ),
          );
        }),
    GetPage(
      name: WithoutPermitDetailPage.routeName,
      page: () => BlocProvider<WithoutPermitDetailCubit>(
        create: (context) => getIt.get(),
        child: const WithoutPermitDetailPage(),
      ),
    ),
  ];
}
