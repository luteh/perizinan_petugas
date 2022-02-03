import 'package:injectable/injectable.dart';

import '../../core/serialize_helper.dart';
import '../response/base_response.dart';
import 'api/monitoring_without_submission_api_service.dart';
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
}
