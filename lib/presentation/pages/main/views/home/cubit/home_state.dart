part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required ResultState<List<MonitoringEntity>> fetchMonitoringListResult,
    required String searchKeyword,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        fetchMonitoringListResult: ResultState.initial(),
        searchKeyword: '',
      );
}
