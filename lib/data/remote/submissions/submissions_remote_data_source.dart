import 'package:injectable/injectable.dart';

import '../../core/serialize_helper.dart';
import '../response/base_response.dart';
import 'api/submissions_api_service.dart';
import 'response/submission_status_response.dart';

@lazySingleton
class SubmissionsRemoteDataSource with SerializeHelper {
  final SubmissionsApiService _apiService;

  SubmissionsRemoteDataSource(this._apiService);

  Future<BaseResponse<List<SubmissionStatusResponse>>>
      fetchSubmissionStatuses() async {
    final _response = await _apiService.fetchSubmissionStatuses();
    return BaseResponse.fromJson(
      _response.data,
      (json) => serializeList<SubmissionStatusResponse>(
          json, (p0) => SubmissionStatusResponse.fromJson(p0)),
    );
  }
}
