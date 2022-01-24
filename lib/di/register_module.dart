import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/data/remote/api/endpoint.dart';
import 'package:perizinan_petugas/di/injection_container.dart';
import 'package:perizinan_petugas/domain/core/usecase/no_param.dart';
import 'package:perizinan_petugas/domain/usecases/do_logout_usecase.dart';
import 'package:perizinan_petugas/domain/usecases/refresh_token_usecase.dart';
import 'package:perizinan_petugas/presentation/pages/login/login_page.dart';

import '../core/constants/constants.dart';
import '../data/local/hive/hive_key.dart';
import '../data/local/local_data_source.dart';

@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named("baseUrl")
  String get baseUrl => 'http://103.101.224.73:3100/admin/api';

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

    _dio.interceptors.add(
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
          final _token = localDataSource.getToken();

          // Just continue Dio process when not logged in
          if (_token?.accessToken?.value == null) {
            handler.next(dioError);
            return;
          }

          // Do refresh token when logged in & error unauthorized
          if (dioError.response?.statusCode == HttpStatus.unauthorized) {
            // Do force logout when refresh token got unauthorized / expired
            if (dioError.requestOptions.path.contains(Endpoint.refreshToken)) {
              await _doForceLogout(dioError, handler);
              return;
            }

            final _result =
                await getIt.get<RefreshTokenUseCase>().call(const NoParam());
            _result.fold(
              (l) async {
                // do force logout when refresh token expired
                await _doForceLogout(dioError, handler);
              },
              (r) async {
                // get previous request options
                final _options = Options(
                  method: dioError.requestOptions.method,
                  headers: dioError.requestOptions.headers,
                );

                // do previous request
                final _response = await _dio.request<dynamic>(
                  dioError.requestOptions.path,
                  data: dioError.requestOptions.data,
                  queryParameters: dioError.requestOptions.queryParameters,
                  options: _options,
                );

                handler.resolve(_response);
              },
            );
            return;
          }

          handler.next(dioError);
        },
      ),
    );

    return _dio;
  }

  @lazySingleton
  Box<dynamic> hiveBoxDpg() => Hive.box(HiveKey.boxDpg);

  Future<void> _doForceLogout(
      DioError dioError, ErrorInterceptorHandler handler) async {
    handler.reject(dioError);

    // do force logout when refresh token expired
    await getIt.get<DoLogoutUseCase>().call(const DoLogoutUseCaseParams());
    NavigationUtil.pushNamedAndRemoveUntil(LoginPage.routeName);
  }
}
