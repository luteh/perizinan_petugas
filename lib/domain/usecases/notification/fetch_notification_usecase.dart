import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/unions/failure.dart';
import '../../core/usecase/future_usecase.dart';
import '../../core/usecase/no_param.dart';
import '../../entities/notification/notification_entity.dart';
import '../../repositories/notification_repository.dart';

@lazySingleton
class FetchNotificationUseCase
    extends FutureUseCase<List<NotificationEntity>, NoParam> {
  final NotificationRepository repository;

  FetchNotificationUseCase({required this.repository});

  @override
  Future<Either<Failure, List<NotificationEntity>>> execute(NoParam params) {
    return repository.fetchNotifications();
  }
}
