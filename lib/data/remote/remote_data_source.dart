import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/core/serialize_helper.dart';
import 'package:perizinan_petugas/data/remote/request/accounts/token/request_token_request.dart';
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
}
