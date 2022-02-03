import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'endpoint.dart';

@lazySingleton
class MonitoringWithoutSubmissionApiService {
  final Dio _dio;

  MonitoringWithoutSubmissionApiService(this._dio);

  Future<Response> fetchMonitoringWithoutSubmissions(String keyword) async {
    return await _dio.get(
      Endpoint.monitoringWithoutSubmissions,
      queryParameters: {
        if (keyword.isNotEmpty) 'keyword': keyword,
      },
    );
  }
}
