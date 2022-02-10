part of 'monitoring_cubit.dart';

enum EventType { addPhoto, save }

@freezed
class MonitoringState with _$MonitoringState {
  const factory MonitoringState({
    required MonitoringArgs? args,
    required List<InputMonitoringData> inputMonitoringDatas,
    required ResultState<dynamic> inputMonitoringResult,
    required ResultState<BaseDomain> submitMonitoringResult,
    required ResultState<String> submitMonitoringWithoutPermitDetailResult,
    required ResultState<dynamic> validateInputMonitoringDataResult,
    required int amount,
    required EventType eventType,
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
        submitMonitoringResult: const ResultState.initial(),
        submitMonitoringWithoutPermitDetailResult: const ResultState.initial(),
        validateInputMonitoringDataResult: const ResultState.initial(),
        args: null,
        amount: 0,
        eventType: EventType.addPhoto,
      );
}
