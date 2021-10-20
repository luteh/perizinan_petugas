import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/constants.dart';
import '../../../domain/usecases/do_login_usecase.dart';
import '../../../domain/usecases/update_profile_usecase.dart';
import 'endpoint.dart';

@lazySingleton
class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> doLogin(DoLoginUseCaseParams params) async {
    return await _dio.post(
      Endpoint.login,
      data: {
        'email': params.email,
        'password': params.password,
      },
    );
  }

  Future<Response> updateProfile(UpdateProfileUseCaseParams params) async {
    Map<String, dynamic> _dataMap = {
      'name': params.name,
      'email': params.email,
      'phone_number': params.phoneNumber,
    };

    if (params.password != Constants.placeholderPassword &&
        params.password.isNotEmpty) {
      _dataMap['password'] = params.password;
    }

    if (params.imageFile != null) {
      _dataMap['avatar'] = MultipartFile.fromFileSync(params.imageFile!.path);
    }

    return await _dio.post(
      Endpoint.editProfile,
      data: FormData.fromMap(_dataMap),
    );
  }
}
