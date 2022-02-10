import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/core/unions/result_state.dart';
import '../../../../../../domain/core/usecase/no_param.dart';
import '../../../../../../domain/entities/notification/notification_entity.dart';
import '../../../../../../domain/usecases/notification/fetch_notification_usecase.dart';

part 'notification_cubit.freezed.dart';
part 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final FetchNotificationUseCase _fetchNotificationUseCase;
  NotificationCubit(this._fetchNotificationUseCase)
      : super(NotificationState.initial());

  onStarted() {
    fetchNotifications();
  }

  fetchNotifications() async {
    emit(state.copyWith(fetchNotifications: const ResultState.loading()));

    final _result = await _fetchNotificationUseCase(const NoParam());

    _result.fold(
      (l) => emit(
          state.copyWith(fetchNotifications: ResultState.error(failure: l))),
      (r) => emit(
          state.copyWith(fetchNotifications: ResultState.success(data: r))),
    );
  }
}
