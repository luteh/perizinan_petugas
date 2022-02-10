import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/unions/failure.dart';
import '../../domain/entities/notification/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';
import '../remote/notification/notification_remote_data_source.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;

  NotificationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<NotificationEntity>>> fetchNotifications() async {
    final _response = await _remoteDataSource.fetchNotifications();
    return Right(_response.data.map((e) => e.toDomain()).toList());
  }
}
