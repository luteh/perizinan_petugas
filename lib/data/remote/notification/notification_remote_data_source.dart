import 'package:injectable/injectable.dart';

import '../../core/serialize_helper.dart';
import '../response/base_response.dart';
import 'api/notification_api_service.dart';
import 'response/notification_response.dart';

@lazySingleton
class NotificationRemoteDataSource with SerializeHelper {
  final NotificationApiService _apiService;

  NotificationRemoteDataSource(this._apiService);

  Future<BaseResponse<List<NotificationResponse>>> fetchNotifications() async {
    final _response = await _apiService.fetchNotifications();
    return BaseResponse.fromJson(
      _response.data,
      (json) => serializeList<NotificationResponse>(
          json, (p0) => NotificationResponse.fromJson(p0)),
    );
  }
}
