import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/core/serialize_helper.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/forgot_password/set_password_request.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/forgot_password/verification_code_request.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/profile/update_password_request.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/token/request_token_request.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/profile/get_profile_response.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/token/request_token_response.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';

import 'api/api_service.dart';

@lazySingleton
class RemoteDataSource with SerializeHelper {
  final ApiService _apiService;

  RemoteDataSource(this._apiService);

  Future<BaseResponse<RequestTokenResponse>> doLogin({
    required RequestTokenRequest request,
  }) async {
    final _response = await _apiService.doLogin(request: request);
    return BaseResponse.fromJson(
      _response.data,
      (json) => RequestTokenResponse.fromJson(json as dynamic),
    );
  }

  Future<BaseResponse> doVerificationCode({
    required VerificationCodeRequest request,
  }) async {
    final _response = await _apiService.doVerificationCode(request: request);
    return BaseResponse.fromJson(
      _response.data,
      (json) => null,
    );
  }

  Future<BaseResponse> setNewPassword({
    required SetPasswordRequest request,
  }) async {
    final _response = await _apiService.setNewPassword(request: request);
    return BaseResponse.fromJson(
      _response.data,
      (json) => null,
    );
  }

  Future<BaseResponse> updatePassword({
    required UpdatePasswordRequest request,
  }) async {
    final _response = await _apiService.updatePassword(request: request);
    return BaseResponse.fromJson(
      _response.data,
      (json) => null,
    );
  }

  Future<BaseResponse<GetProfileResponse>> getProfile() async {
    final _response = await _apiService.getProfile();
    return BaseResponse.fromJson(
      _response.data,
      (json) => GetProfileResponse.fromJson(json as dynamic),
    );
  }
}
