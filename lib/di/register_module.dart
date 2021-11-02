import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/di/injection_container.dart';
import 'package:perizinan_petugas/domain/usecases/do_logout_usecase.dart';
import 'package:perizinan_petugas/presentation/pages/login/login_page.dart';

import '../core/constants/constants.dart';
import '../data/local/hive/hive_key.dart';
import '../data/local/local_data_source.dart';

@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named("baseUrl")
  String get baseUrl => 'http://103.101.224.73:3100/customer/api';

  // url here will be injected
  @lazySingleton
  Dio dio(@Named('baseUrl') String url, LocalDataSource localDataSource) {
    final _dio = Dio(BaseOptions(
      baseUrl: url,
      connectTimeout: Constants.timeoutInMillisecond,
      receiveTimeout: Constants.timeoutInMillisecond,
      sendTimeout: Constants.timeoutInMillisecond,
    ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            final _token = localDataSource.getToken();

            if (_token?.accessToken?.value != null) {
              options.headers['Authorization'] =
                  'Bearer ${_token?.accessToken?.value}';
            }
            handler.next(options);
          },
          onError: (dioError, handler) async {
            // Do force logout when error unauthorized
            if (dioError.response?.statusCode == HttpStatus.unauthorized) {
              handler.reject(dioError);
              await getIt
                  .get<DoLogoutUseCase>()
                  .call(const DoLogoutUseCaseParams());
              NavigationUtil.pushNamedAndRemoveUntil(LoginPage.routeName);
              return;
            }

            handler.next(dioError);
          },
        ),
      )
      ..interceptors.add(
        LogInterceptor(responseBody: true, requestBody: true),
      );

    // Validate host
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return baseUrl.contains(host);
      };
      return client;
    };

    return _dio;
  }

  @lazySingleton
  Box<dynamic> hiveBoxDpg() => Hive.box(HiveKey.boxDpg);
}
