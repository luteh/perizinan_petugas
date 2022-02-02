import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../di/injection_container.dart';
import '../presentation/pages/change_password/change_password_args.dart';
import '../presentation/pages/change_password/change_password_page.dart';
import '../presentation/pages/change_password/cubit/change_password_cubit.dart';
import '../presentation/pages/code_verification/code_verification_args.dart';
import '../presentation/pages/code_verification/code_verification_page.dart';
import '../presentation/pages/code_verification/cubit/code_verification_cubit.dart';
import '../presentation/pages/email_verification/cubit/email_verification_cubit.dart';
import '../presentation/pages/email_verification/email_verification_page.dart';
import '../presentation/pages/login/cubit/login_cubit.dart';
import '../presentation/pages/login/login_page.dart';
import '../presentation/pages/main/cubit/main_cubit.dart';
import '../presentation/pages/main/main_page.dart';
import '../presentation/pages/main/views/home/cubit/home_cubit.dart';
import '../presentation/pages/main/views/notification/cubit/notification_cubit.dart';
import '../presentation/pages/main/views/profile/cubit/profile_cubit.dart';
import '../presentation/pages/main/views/tanpa_izin/cubit/tanpa_izin_cubit.dart';
import '../presentation/pages/monitoring/cubit/monitoring_cubit.dart';
import '../presentation/pages/monitoring/monitoring_args.dart';
import '../presentation/pages/monitoring/monitoring_page.dart';
import '../presentation/pages/monitoring_data/cubit/monitoring_data_cubit.dart';
import '../presentation/pages/monitoring_data/monitoring_data_args.dart';
import '../presentation/pages/monitoring_data/monitoring_data_page.dart';
import '../presentation/pages/monitoring_result.dart/cubit/monitoring_result_cubit.dart';
import '../presentation/pages/monitoring_result.dart/monitoring_result_args.dart';
import '../presentation/pages/monitoring_result.dart/monitoring_result_page.dart';
import '../presentation/pages/permission_detail/cubit/permission_detail_cubit.dart';
import '../presentation/pages/permission_detail/permission_detail_args.dart';
import '../presentation/pages/permission_detail/permission_detail_page.dart';
import '../presentation/pages/qr_code_scanner/cubit/qr_code_scanner_cubit.dart';
import '../presentation/pages/qr_code_scanner/qr_code_scanner_page.dart';
import '../presentation/pages/without_permit_detail/cubit/without_permit_detail_cubit.dart';
import '../presentation/pages/without_permit_detail/without_permit_detail_page.dart';

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
        final _args = Get.arguments as ChangePasswordArgs?;

        return BlocProvider<ChangePasswordCubit>(
          create: (context) => getIt.get()..onStarted(args: _args),
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
            create: (context) => getIt.get()..onStarted(),
          ),
          BlocProvider<TanpaIzinCubit>(
            create: (context) => getIt.get()..onStarted(),
          ),
          BlocProvider<ProfileCubit>(
            create: (context) => getIt.get()..onStarted(),
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
      page: () {
        final _args = Get.arguments as PermissionDetailArgs;
        return BlocProvider<PermissionDetailCubit>(
          create: (context) => getIt.get()..onStarted(_args),
          child: const PermissionDetailPage(),
        );
      },
    ),
    GetPage(
      name: MonitoringPage.routeName,
      page: () {
        final _args = Get.arguments as MonitoringArgs?;

        return BlocProvider<MonitoringCubit>(
          create: (context) => getIt.get()..onStarted(_args),
          child: MonitoringPage(
            args: _args,
          ),
        );
      },
    ),
    GetPage(
      name: MonitoringResultPage.routeName,
      page: () {
        final _args = Get.arguments as MonitoringResultArgs;

        return BlocProvider<MonitoringResultCubit>(
          create: (context) => getIt.get()..onStarted(_args),
          child: const MonitoringResultPage(),
        );
      },
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
    GetPage(
      name: QrCodeScannerPage.routeName,
      page: () => BlocProvider<QrCodeScannerCubit>(
        create: (context) => getIt.get(),
        child: const QrCodeScannerPage(),
      ),
    ),
  ];
}
