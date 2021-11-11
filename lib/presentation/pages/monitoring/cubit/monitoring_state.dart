part of 'monitoring_cubit.dart';

@freezed
class MonitoringState with _$MonitoringState {
  const factory MonitoringState({
    required List<InputMonitoringData> inputMonitoringDatas,
    required ResultState<dynamic> inputMonitoringResult,
    required ResultState<dynamic> validateInputMonitoringDataResult,
  }) = _MonitoringState;

  factory MonitoringState.initial() => MonitoringState(
        inputMonitoringDatas: List.of(
          [
            const InputMonitoringData(
              imageFile: null,
              keterangan: null,
            ),
          ],
          growable: true,
        ),
        inputMonitoringResult: const ResultState.initial(),
        validateInputMonitoringDataResult: const ResultState.initial(),
      );
}
