import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/utils/utils.dart';
import '../../../../domain/core/unions/failure.dart';
import '../../../../domain/core/unions/result_state.dart';
import '../../../../domain/entities/base_domain.dart';
import '../../../../domain/entities/monitoring/input_monitoring_data.dart';
import '../../../../domain/usecases/monitoring/submit_monitoring_result_usecase.dart';
import '../monitoring_args.dart';

part 'monitoring_cubit.freezed.dart';
part 'monitoring_state.dart';

@injectable
class MonitoringCubit extends Cubit<MonitoringState> {
  final SubmitMonitoringResultUseCase _submitMonitoringResultUseCase;
  MonitoringCubit(this._submitMonitoringResultUseCase)
      : super(MonitoringState.initial());

  onStarted(MonitoringArgs? args) {
    emit(state.copyWith(args: args));
  }

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
    emit(state.copyWith(
      inputMonitoringResult: const ResultState.loading(),
      eventType: EventType.addPhoto,
    ));
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

  simpanMonitoringData() async {
    emit(state.copyWith(eventType: EventType.save));

    validateInputMonitoringDatas();

    await state.validateInputMonitoringDataResult.maybeWhen(
      success: (_) async {
        if (state.args?.monitoringType == MonitoringType.withoutPermit) {
          NavigationUtil.popUntil(result: state.inputMonitoringDatas);
          return;
        }
        
        emit(state.copyWith(
            submitMonitoringResult: const ResultState.loading()));

        final _result = await _submitMonitoringResultUseCase(
            SubmitMonitoringResultUseCaseParams(
                state.args!.id!, state.amount, state.inputMonitoringDatas));

        _result.fold(
          (l) => emit(state.copyWith(
              submitMonitoringResult: ResultState.error(failure: l))),
          (r) => emit(state.copyWith(
              submitMonitoringResult: ResultState.success(data: r))),
        );
      },
      orElse: () => null,
    );
  }

  changeAmount(String amount) {
    emit(state.copyWith(amount: idrToInt(amount)));
  }
}
