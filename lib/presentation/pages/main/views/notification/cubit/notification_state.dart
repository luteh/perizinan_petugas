part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    required ResultState<List<NotificationEntity>> fetchNotifications,
  }) = _NotificationState;
  factory NotificationState.initial() => const NotificationState(
        fetchNotifications: ResultState.loading(),
      );
}
