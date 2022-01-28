part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required ResultState<List<MonitoringEntity>> fetchMonitoringListResult,
    required String searchKeyword,
    required List<PermitTypeEntity> permitTypes,
    required List<SubmissionStatusEntity> submissionStatuses,
    required String? permitStatus,
    required String? permitType,
    required DateTimeRange? dateTimeRange,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        fetchMonitoringListResult: ResultState.initial(),
        searchKeyword: '',
        permitTypes: [],
        submissionStatuses: [],
        permitStatus: null,
        permitType: null,
        dateTimeRange: null,
      );
}
