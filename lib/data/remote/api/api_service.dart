import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/forgot_password/verification_code_request.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/token/request_token_request.dart';

import 'endpoint.dart';

@lazySingleton
class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> doLogin({required RequestTokenRequest request}) async {
    return await _dio.post(
      Endpoint.requestToken,
      data: request.toJson(),
    );
  }

  Future<Response> doVerificationCode({required VerificationCodeRequest request}) async {
    return await _dio.post(
      Endpoint.verificationCode,
      data: request.toJson(),
    );
  }
}
