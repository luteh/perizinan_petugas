part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required ResultState<List<MonitoringEntity>> fetchMonitoringListResult,
    required String searchKeyword,
    required List<PermitTypeEntity> permitTypes,
    required List<SubmissionStatusEntity> submissionStatuses,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        fetchMonitoringListResult: ResultState.initial(),
        searchKeyword: '',
        permitTypes: [],
        submissionStatuses: [],
      );
}
