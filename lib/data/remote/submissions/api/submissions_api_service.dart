import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'endpoint.dart';

@lazySingleton
class SubmissionsApiService {
  final Dio _dio;

  SubmissionsApiService(this._dio);

  Future<Response> fetchSubmissionStatuses() async {
    return await _dio.get(Endpoint.submissionStatuses);
  }
}
