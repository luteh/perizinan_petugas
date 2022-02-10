import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'endpoint.dart';

@lazySingleton
class NotificationApiService {
  final Dio _dio;

  NotificationApiService(this._dio);

  Future<Response> fetchNotifications() async {
    return await _dio.get(
      Endpoint.notifications,
    );
  }
}
