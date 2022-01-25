import 'package:injectable/injectable.dart';

import '../../core/serialize_helper.dart';
import '../response/base_response.dart';
import 'api/monitoring_api_service.dart';
import 'response/monitoring_response.dart';

@lazySingleton
class MonitoringRemoteDataSource with SerializeHelper {
  final MonitoringApiService _apiService;

  MonitoringRemoteDataSource(this._apiService);

  Future<BaseResponse<List<MonitoringResponse>>> fetchMonitoringList(String keyword) async {
    final _response = await _apiService.fetchMonitoringList(keyword);
    return BaseResponse.fromJson(
      _response.data,
      (json) => serializeList<MonitoringResponse>(
          json, (p0) => MonitoringResponse.fromJson(p0)),
    );
  }
}
