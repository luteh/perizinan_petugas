import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../core/constants/constants.dart';
import '../data/local/hive/hive_key.dart';
import '../data/local/local_data_source.dart';

@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named("baseUrl")
  String get baseUrl => 'http://dpg/api';

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

            if (_token != null) {
              options.headers['Authorization'] = 'Bearer $_token';
            }
            handler.next(options);
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
