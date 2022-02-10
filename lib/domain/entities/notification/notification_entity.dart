import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';

@freezed
class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required int id,
    required int type,
    required String title,
    required String message,
    required bool isRead,
    required String createdDate,
  }) = _NotificationEntity;
}
