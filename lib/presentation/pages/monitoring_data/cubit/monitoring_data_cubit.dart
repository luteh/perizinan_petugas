import 'package:bloc/bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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
  final CacheManager _cacheManager;
  MonitoringDataCubit(this._submitMonitoringDataUseCase, this._cacheManager)
      : super(MonitoringDataState.initial());

  onStarted(MonitoringDataArgs? args) async {
    emit(state.copyWith(args: args));

    if (args?.withoutPermitDetail != null) {
      args!.withoutPermitDetail!.images.forEach((e) async {
        final _file = await _cacheManager.getSingleFile(e.image);
        state.inputMonitoringDatas.add(
            InputMonitoringData(imageFile: _file, keterangan: e.descriptions));
      });
    }
  }

  saveInputMonitoringDatas(List<InputMonitoringData>? inputMonitoringDatas) {
    if (inputMonitoringDatas == null) return;
    emit(state.copyWith(inputMonitoringDatas: inputMonitoringDatas));
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
      id: state.args?.withoutPermitDetail?.id,
    ));

    _result.fold(
      (l) => emit(state.copyWith(
          submitMonitoringDataResult: ResultState.error(failure: l))),
      (r) => emit(state.copyWith(
          submitMonitoringDataResult: ResultState.success(data: r))),
    );
  }
}
