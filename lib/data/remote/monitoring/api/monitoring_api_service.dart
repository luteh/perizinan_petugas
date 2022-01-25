import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'endpoint.dart';

@lazySingleton
class MonitoringApiService {
  final Dio _dio;

  MonitoringApiService(this._dio);

  Future<Response> fetchMonitoringList(String keyword) async {
    return await _dio.get(
      Endpoint.monitoringList,
      queryParameters: {
        if (keyword.isNotEmpty) 'keyword': keyword,
      },
    );
  }
}
