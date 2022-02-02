import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/unions/result_state.dart';
import '../../../../domain/entities/monitoring/monitoring_result_detail_entity.dart';
import '../../../../domain/usecases/monitoring/fetch_monitoring_result_detail_usecase.dart';
import '../monitoring_result_args.dart';

part 'monitoring_result_cubit.freezed.dart';
part 'monitoring_result_state.dart';

@injectable
class MonitoringResultCubit extends Cubit<MonitoringResultState> {
  final FetchMonitoringResultDetailUseCase _fetchMonitoringResultDetailUseCase;

  MonitoringResultCubit(this._fetchMonitoringResultDetailUseCase)
      : super(MonitoringResultState.initial());

  onStarted(MonitoringResultArgs args) {
    emit(state.copyWith(args: args));
  }

  fetchMonitoringResultDetail() async {
    emit(state.copyWith(
        fetchMonitoringResultDetailResult: const ResultState.loading()));

    final _result = await _fetchMonitoringResultDetailUseCase(
        FetchMonitoringResultDetailUseCaseParams(state.args.submissionId));

    _result.fold(
      (l) => emit(state.copyWith(
          fetchMonitoringResultDetailResult: ResultState.error(failure: l))),
      (r) => emit(state.copyWith(
          fetchMonitoringResultDetailResult: ResultState.success(data: r))),
    );
  }
}
