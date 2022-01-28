import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'endpoint.dart';

@lazySingleton
class PermitsApiService {
  final Dio _dio;

  PermitsApiService(this._dio);

  Future<Response> fetchPermitTypes() async {
    return await _dio.get(
      Endpoint.permitTypes,
    );
  }
}
