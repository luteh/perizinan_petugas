// To parse this JSON data, do
//
//     final notificationResponse = notificationResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perizinan_petugas/domain/entities/notification/notification_entity.dart';

part 'notification_response.freezed.dart';
part 'notification_response.g.dart';

NotificationResponse notificationResponseFromJson(String str) =>
    NotificationResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationResponse data) =>
    json.encode(data.toJson());

@freezed
class NotificationResponse with _$NotificationResponse {
  const NotificationResponse._();
  const factory NotificationResponse({
    required int? id,
    required int? type,
    required String? title,
    required String? message,
    required bool? isRead,
    required String? createdDate,
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  NotificationEntity toDomain() => NotificationEntity(
        id: id ?? 0,
        type: type ?? 0,
        title: title ?? '',
        message: message ?? '',
        isRead: isRead ?? false,
        createdDate: createdDate ?? '',
      );
}
