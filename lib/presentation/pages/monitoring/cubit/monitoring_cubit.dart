import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/utils/navigation_util.dart';
import '../../../../core/utils/utils.dart';
import '../../../../domain/core/unions/failure.dart';
import '../../../../domain/core/unions/result_state.dart';
import '../../../../domain/entities/base_domain.dart';
import '../../../../domain/entities/monitoring/input_monitoring_data.dart';
import '../../../../domain/usecases/monitoring/submit_monitoring_result_usecase.dart';
import '../../../../domain/usecases/monitoring_without_submission/submit_monitoring_data_usecase.dart';
import '../monitoring_args.dart';

part 'monitoring_cubit.freezed.dart';
part 'monitoring_state.dart';

@injectable
class MonitoringCubit extends Cubit<MonitoringState> {
  final SubmitMonitoringResultUseCase _submitMonitoringResultUseCase;
  final SubmitMonitoringDataUseCase _submitMonitoringDataUseCase;
  final CacheManager _cacheManager;

  MonitoringCubit(this._submitMonitoringResultUseCase,
      this._submitMonitoringDataUseCase, this._cacheManager)
      : super(MonitoringState.initial());

  onStarted(MonitoringArgs? args) async {
    emit(state.copyWith(
      args: args,
    ));

    if (args?.monitoringType == MonitoringType.editWithoutPermitImagesOnly) {
      emit(state.copyWith(inputMonitoringResult: const ResultState.loading()));

      state.inputMonitoringDatas.clear();
      args!.withoutPermitDetail!.images.forEach((e) async {
        final _file = await _cacheManager.getSingleFile(e.image);
        state.inputMonitoringDatas.add(
            InputMonitoringData(imageFile: _file, keterangan: e.descriptions));

        if (args.withoutPermitDetail!.images.indexOf(e) ==
            args.withoutPermitDetail!.images.length - 1) {
          emit(state.copyWith(
              inputMonitoringResult: const ResultState.success(data: null)));
        }
      });
    } else {
      emit(state.copyWith(
        inputMonitoringDatas:
            args?.inputMonitoringDatas ?? state.inputMonitoringDatas,
      ));
    }
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
        } else if (state.args?.monitoringType ==
            MonitoringType.editWithoutPermitImagesOnly) {
          await _submitMonitoringWithoutPermitDetail();
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

  Future<void> _submitMonitoringWithoutPermitDetail() async {
    emit(state.copyWith(
        submitMonitoringWithoutPermitDetailResult:
            const ResultState.loading()));

    final _result =
        await _submitMonitoringDataUseCase(SubmitMonitoringDataUseCaseParams(
      id: state.args!.withoutPermitDetail!.id,
      name: state.args!.withoutPermitDetail!.name,
      unitName: state.args!.withoutPermitDetail!.unitName,
      phoneNumber: state.args!.withoutPermitDetail!.phoneNumber,
      address: state.args!.withoutPermitDetail!.address,
      description: state.args!.withoutPermitDetail!.description,
      latitude: state.args!.latitude!,
      longitude: state.args!.longitude!,
      inputMonitoringDatas: state.inputMonitoringDatas,
    ));

    _result.fold(
      (l) => emit(state.copyWith(
          submitMonitoringWithoutPermitDetailResult:
              ResultState.error(failure: l))),
      (r) => emit(state.copyWith(
          submitMonitoringWithoutPermitDetailResult:
              ResultState.success(data: r))),
    );
  }
}
