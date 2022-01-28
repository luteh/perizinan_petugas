import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/monitoring/response/detail_customer_response.dart';

import '../../core/serialize_helper.dart';
import '../response/base_response.dart';
import 'api/monitoring_api_service.dart';
import 'response/monitoring_response.dart';
import 'response/permit_detail_response.dart';

@lazySingleton
class MonitoringRemoteDataSource with SerializeHelper {
  final MonitoringApiService _apiService;

  MonitoringRemoteDataSource(this._apiService);

  Future<BaseResponse<List<MonitoringResponse>>> fetchMonitoringList(
    String keyword,
    String? permitStatus,
    int? permitTypeId,
    DateTime? startDate,
    DateTime? endDate,
  ) async {
    final _response = await _apiService.fetchMonitoringList(
      keyword,
      permitStatus,
      permitTypeId,
      startDate,
      endDate,
    );
    return BaseResponse.fromJson(
      _response.data,
      (json) => serializeList<MonitoringResponse>(
          json, (p0) => MonitoringResponse.fromJson(p0)),
    );
  }

  Future<BaseResponse<PermitDetailResponse>> fetchPermitDetail(int id) async {
    final _response = await _apiService.fetchPermitDetail(id);
    return BaseResponse.fromJson(
      _response.data,
      (json) => PermitDetailResponse.fromJson(json as dynamic),
    );
  }

  Future<BaseResponse<DetailCustomerResponse>> fetchCustomerDetail(
      int id) async {
    final _response = await _apiService.fetchCustomerDetail(id);
    return BaseResponse.fromJson(
      _response.data,
      (json) => DetailCustomerResponse.fromJson(json as dynamic),
    );
  }
}
