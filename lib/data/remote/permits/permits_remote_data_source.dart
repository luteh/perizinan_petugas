import 'package:injectable/injectable.dart';

import '../../core/serialize_helper.dart';
import '../response/base_response.dart';
import 'api/permits_api_service.dart';
import 'response/permit_type_response.dart';

@lazySingleton
class PermitsRemoteDataSource with SerializeHelper {
  final PermitsApiService _apiService;

  PermitsRemoteDataSource(this._apiService);

  Future<BaseResponse<List<PermitTypeResponse>>> fetchPermitTypes() async {
    final _response = await _apiService.fetchPermitTypes();
    return BaseResponse.fromJson(
      _response.data,
      (json) => serializeList<PermitTypeResponse>(
          json, (p0) => PermitTypeResponse.fromJson(p0)),
    );
  }
}
