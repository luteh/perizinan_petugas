import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/monitoring_without_submission/request/submit_monitoring_data_request.dart';

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

  Future<Response> submitMonitoringData(
      SubmitMonitoringDataRequest request) async {
    return await _dio.post(
      Endpoint.submitMonitoringData,
      data: request.toJson(),
    );
  }
}
