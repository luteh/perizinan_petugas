import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../request/submit_monitoring_data_request.dart';
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

  Future<Response> fetchMonitoringWithoutSubmissionDetail(int id) async {
    return await _dio.get(
      Endpoint.monitoringWithoutSubmissionDetail,
      queryParameters: {
        'id': id,
      },
    );
  }

  Future<Response> submitMonitoringData(
    SubmitMonitoringDataRequest request, {
    required int? id,
  }) async {
    final _request = request.toJson();
    if (id != null) {
      _request.addAll({
        'customerId': id,
      });
    }
    return await _dio.post(
      Endpoint.submitMonitoringData,
      data: _request,
    );
  }
}
