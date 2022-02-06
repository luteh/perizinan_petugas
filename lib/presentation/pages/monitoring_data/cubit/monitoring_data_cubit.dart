import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/unions/failure.dart';
import '../../../../domain/core/unions/result_state.dart';
import '../../../../domain/entities/monitoring/input_monitoring_data.dart';
import '../../../../domain/usecases/monitoring_without_submission/submit_monitoring_data_usecase.dart';
import '../monitoring_data_args.dart';

part 'monitoring_data_cubit.freezed.dart';
part 'monitoring_data_state.dart';

@injectable
class MonitoringDataCubit extends Cubit<MonitoringDataState> {
  final SubmitMonitoringDataUseCase _submitMonitoringDataUseCase;
  MonitoringDataCubit(this._submitMonitoringDataUseCase)
      : super(MonitoringDataState.initial());

  onStarted(MonitoringDataArgs? args) {
    emit(state.copyWith(args: args));
  }

  saveInputMonitoringDatas(List<InputMonitoringData>? inputMonitoringDatas) {
    emit(state.copyWith(inputMonitoringDatas: inputMonitoringDatas ?? []));
  }

  submitMonitoringData({
    required String name,
    required String unitName,
    required String phoneNumber,
    required String address,
    required String description,
  }) async {
    emit(state.copyWith(
        submitMonitoringDataResult: const ResultState.loading()));

    if (state.inputMonitoringDatas.isEmpty) {
      emit(state.copyWith(
          submitMonitoringDataResult: const ResultState.error(
              failure:
                  Failure.defaultError('Harap lampirkan foto monitoring!'))));
      return;
    }

    final _result =
        await _submitMonitoringDataUseCase(SubmitMonitoringDataUseCaseParams(
      name: name,
      unitName: unitName,
      phoneNumber: phoneNumber,
      address: address,
      description: description,
      latitude: state.args?.latitude ?? 0,
      longitude: state.args?.longitude ?? 0,
      inputMonitoringDatas: state.inputMonitoringDatas,
    ));

    _result.fold(
      (l) => emit(state.copyWith(
          submitMonitoringDataResult: ResultState.error(failure: l))),
      (r) => emit(state.copyWith(
          submitMonitoringDataResult: ResultState.success(data: r))),
    );
  }
}
