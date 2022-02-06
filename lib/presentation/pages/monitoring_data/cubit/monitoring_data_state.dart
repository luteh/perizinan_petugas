part of 'monitoring_data_cubit.dart';

@freezed
class MonitoringDataState with _$MonitoringDataState {
  const factory MonitoringDataState({
    required MonitoringDataArgs? args,
    required List<InputMonitoringData> inputMonitoringDatas,
    required ResultState<String> submitMonitoringDataResult,
  }) = _MonitoringDataState;

  factory MonitoringDataState.initial() => const MonitoringDataState(
        args: null,
        inputMonitoringDatas: [],
        submitMonitoringDataResult: ResultState.initial(),
      );
}
