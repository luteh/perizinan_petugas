part of 'monitoring_result_cubit.dart';

@freezed
class MonitoringResultState with _$MonitoringResultState {
  const factory MonitoringResultState({
    required ResultState<MonitoringResultDetailEntity>
        fetchMonitoringResultDetailResult,
    required MonitoringResultArgs args,
  }) = _MonitoringResultState;

  factory MonitoringResultState.initial() => MonitoringResultState(
        fetchMonitoringResultDetailResult: const ResultState.initial(),
        args: MonitoringResultArgs.initial(),
      );
}
