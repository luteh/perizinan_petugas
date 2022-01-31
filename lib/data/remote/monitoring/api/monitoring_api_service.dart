import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/monitoring/request/submit_monitoring_result_request.dart';

import 'endpoint.dart';

@lazySingleton
class MonitoringApiService {
  final Dio _dio;

  MonitoringApiService(this._dio);

  Future<Response> fetchMonitoringList(
    String keyword,
    String? permitStatus,
    int? permitTypeId,
    DateTime? startDate,
    DateTime? endDate,
  ) async {
    return await _dio.get(
      Endpoint.monitoringList,
      queryParameters: {
        if (keyword.isNotEmpty) 'keyword': keyword,
        if (permitTypeId != null) 'permitId': permitTypeId,
        if (permitStatus != null) 'submissionStatus': permitStatus,
        if (startDate != null) 'startDate': startDate,
        if (endDate != null) 'endDate': endDate,
      },
    );
  }

  Future<Response> fetchPermitDetail(int id) async {
    return await _dio.get(
      Endpoint.permitDetail(id),
    );
  }

  Future<Response> fetchCustomerDetail(int id) async {
    return await _dio.get(
      Endpoint.customerDetail(id),
    );
  }

  Future<Response> submitMonitoringResult(
      SubmitMonitoringResultRequest request) async {
    return await _dio.post(
      Endpoint.submitMonitoringResult,
      data: request.toJson(),
    );
  }
}
