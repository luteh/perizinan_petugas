import 'package:fpdart/fpdart.dart';

import '../core/unions/failure.dart';
import '../entities/notification/notification_entity.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> fetchNotifications();
}