import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/unions/result_state.dart';
import '../../../../domain/entities/monitoring_without_submission/monitoring_without_submission_detail_entity.dart';
import '../../../../domain/usecases/monitoring_without_submission/fetch_monitoring_without_submission_detail_usecase.dart';
import '../without_permit_detail_args.dart';

part 'without_permit_detail_cubit.freezed.dart';
part 'without_permit_detail_state.dart';

@injectable
class WithoutPermitDetailCubit extends Cubit<WithoutPermitDetailState> {
  final FetchMonitoringWithoutSubmissionDetailUseCase
      _fetchMonitoringWithoutSubmissionDetailUseCase;

  WithoutPermitDetailCubit(this._fetchMonitoringWithoutSubmissionDetailUseCase)
      : super(WithoutPermitDetailState.initial());

  onStarted(WithoutPermitDetailArgs args) {
    emit(state.copyWith(args: args));
    fetchDetail();
  }

  changeTabIndex(int index) {
    emit(state.copyWith(tabIndex: index));
  }

  fetchDetail() async {
    emit(state.copyWith(fetchDetailResult: const ResultState.loading()));

    final _result = await _fetchMonitoringWithoutSubmissionDetailUseCase(
        FetchMonitoringWithoutSubmissionDetailUseCaseParams(state.args!.id));

    _result.fold(
      (l) => emit(
          state.copyWith(fetchDetailResult: ResultState.error(failure: l))),
      (r) =>
          emit(state.copyWith(fetchDetailResult: ResultState.success(data: r))),
    );
  }
}
