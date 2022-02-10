part of 'monitoring_data_cubit.dart';

@freezed
class MonitoringDataState with _$MonitoringDataState {
  const factory MonitoringDataState({
    required MonitoringDataArgs? args,
    required List<InputMonitoringData> inputMonitoringDatas,
    required ResultState<String> submitMonitoringDataResult,
  }) = _MonitoringDataState;

  factory MonitoringDataState.initial() => MonitoringDataState(
        args: null,
        inputMonitoringDatas: List.empty(growable: true),
        submitMonitoringDataResult: const ResultState.initial(),
      );
}
