import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/forgot_password/set_password_request.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/forgot_password/verification_code_request.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/profile/update_password_request.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/token/refresh_token_request.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/token/request_token_request.dart';

import 'endpoint.dart';

@lazySingleton
class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> refreshToken({required RefreshTokenRequest request}) async {
    return await _dio.post(
      Endpoint.refreshToken,
      data: request.toJson(),
    );
  }

  Future<Response> doLogin({required RequestTokenRequest request}) async {
    return await _dio.post(
      Endpoint.requestToken,
      data: request.toJson(),
    );
  }

  Future<Response> doVerificationCode(
      {required VerificationCodeRequest request}) async {
    return await _dio.post(
      Endpoint.verificationCode,
      data: request.toJson(),
    );
  }

  Future<Response> setNewPassword({required SetPasswordRequest request}) async {
    return await _dio.post(
      Endpoint.setNewPassword,
      data: request.toJson(),
    );
  }

  Future<Response> updatePassword({required UpdatePasswordRequest request}) async {
    return await _dio.put(
      Endpoint.updatePassword,
      data: request.toJson(),
    );
  }

  Future<Response> getProfile() async {
    return await _dio.get(
      Endpoint.getProfile,
    );
  }
}
