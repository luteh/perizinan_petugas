import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/domain/core/unions/failure.dart';
import 'package:perizinan_petugas/domain/core/unions/result_state.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/input_monitoring_data.dart';

part 'monitoring_cubit.freezed.dart';
part 'monitoring_state.dart';

@injectable
class MonitoringCubit extends Cubit<MonitoringState> {
  MonitoringCubit() : super(MonitoringState.initial());

  inputMonitoringItemImage({required int index, required File imageFile}) {
    emit(state.copyWith(inputMonitoringResult: const ResultState.loading()));
    state.inputMonitoringDatas[index] =
        state.inputMonitoringDatas[index].copyWith(imageFile: imageFile);
    emit(state.copyWith(
        inputMonitoringResult: const ResultState.success(data: null)));
  }

  inputMonitoringItemKeterangan(
      {required int index, required String keterangan}) {
    emit(state.copyWith(inputMonitoringResult: const ResultState.loading()));
    state.inputMonitoringDatas[index] =
        state.inputMonitoringDatas[index].copyWith(keterangan: keterangan);
    emit(state.copyWith(
        inputMonitoringResult: const ResultState.success(data: null)));
  }

  addMoreInputMonitoringItem() {
    emit(state.copyWith(inputMonitoringResult: const ResultState.loading()));
    state.inputMonitoringDatas.add(
      const InputMonitoringData(
        imageFile: null,
        keterangan: null,
      ),
    );
    emit(state.copyWith(
        inputMonitoringResult: const ResultState.success(data: null)));
  }

  validateInputMonitoringDatas() {
    emit(state.copyWith(
        validateInputMonitoringDataResult: const ResultState.loading()));

    for (InputMonitoringData data in state.inputMonitoringDatas) {
      if (data.isNotFilled) {
        emit(state.copyWith(
            validateInputMonitoringDataResult: const ResultState.error(
                failure:
                    Failure.defaultError(Strings.msgLengkapiMonitoringData))));
        return;
      }
    }

    emit(state.copyWith(
        validateInputMonitoringDataResult:
            const ResultState.success(data: null)));
  }

  simpanMonitoringData() {
    validateInputMonitoringDatas();

    state.validateInputMonitoringDataResult.maybeWhen(
      success: (_) {
        NavigationUtil.popUntil();
      },
      orElse: () => null,
    );
  }
}
