import 'package:injectable/injectable.dart';

import '../../core/serialize_helper.dart';
import '../response/base_response.dart';
import 'api/monitoring_without_submission_api_service.dart';
import 'request/submit_monitoring_data_request.dart';
import 'response/monitoring_without_submission_detail_response.dart';
import 'response/monitoring_without_submission_response.dart';

@lazySingleton
class MonitoringWithoutSubmissionRemoteDataSource with SerializeHelper {
  final MonitoringWithoutSubmissionApiService _apiService;

  MonitoringWithoutSubmissionRemoteDataSource(this._apiService);

  Future<BaseResponse<List<MonitoringWithoutSubmissionResponse>>>
      fetchMonitoringWithoutSubmissions(String keyword) async {
    final _response =
        await _apiService.fetchMonitoringWithoutSubmissions(keyword);
    return BaseResponse.fromJson(
      _response.data,
      (json) => serializeList<MonitoringWithoutSubmissionResponse>(
          json, (p0) => MonitoringWithoutSubmissionResponse.fromJson(p0)),
    );
  }

  Future<BaseResponse> submitMonitoringData(
    SubmitMonitoringDataRequest request, {
    required int? id,
  }) async {
    final _response = await _apiService.submitMonitoringData(
      request,
      id: id,
    );
    return BaseResponse.fromJson(
      _response.data,
      (json) => null,
    );
  }

  Future<BaseResponse<MonitoringWithoutSubmissionDetailResponse>>
      fetchMonitoringWithoutSubmissionDetail(int id) async {
    final _response =
        await _apiService.fetchMonitoringWithoutSubmissionDetail(id);
    return BaseResponse.fromJson(
      _response.data,
      (json) =>
          MonitoringWithoutSubmissionDetailResponse.fromJson(json as dynamic),
    );
  }
}
