import 'package:injectable/injectable.dart';

import '../../../domain/usecases/do_login_usecase.dart';
import '../../../domain/usecases/update_profile_usecase.dart';
import 'api/api_service.dart';
import 'response/login/login_response.dart';

@lazySingleton
class RemoteDataSource {
  final ApiService _apiService;

  RemoteDataSource(this._apiService);

  Future<LoginResponse> doLogin(DoLoginUseCaseParams params) async {
    final _response = await _apiService.doLogin(params);
    return LoginResponse.fromJson(_response.data);
  }

  Future<LoginResponse> updateProfile(UpdateProfileUseCaseParams params) async {
    final _response = await _apiService.updateProfile(params);
    return LoginResponse.fromJson(_response.data);
  }
}
