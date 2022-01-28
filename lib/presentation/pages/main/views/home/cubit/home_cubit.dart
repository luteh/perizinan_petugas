import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/core/unions/result_state.dart';
import '../../../../../../domain/entities/monitoring/monitoring_entity.dart';
import '../../../../../../domain/entities/permits/permit_type_entity.dart';
import '../../../../../../domain/entities/submissions/submission_status_entity.dart';
import '../../../../../../domain/usecases/monitoring/fetch_monitoring_list_usecase.dart';
import '../../../../../../domain/usecases/permits/fetch_permit_types_local_usecase.dart';
import '../../../../../../domain/usecases/submissions/fetch_submission_statuses_local_usecase.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final FetchMonitoringListUseCase _fetchMonitoringListUseCase;
  final FetchPermitTypesLocalUseCase _fetchPermitTypesLocalUseCase;
  final FetchSubmissionStatusesLocalUseCase
      _fetchSubmissionStatusesLocalUseCase;

  HomeCubit(
      this._fetchMonitoringListUseCase,
      this._fetchPermitTypesLocalUseCase,
      this._fetchSubmissionStatusesLocalUseCase)
      : super(HomeState.initial());

  onStarted() async {
    await Future.wait([
      fetchMonitoringList(),
      _fetchPermitTypesLocal(),
      _fetchSubmissionStatusesLocal(),
    ]);
  }

  Future<void> fetchMonitoringList() async {
    emit(
        state.copyWith(fetchMonitoringListResult: const ResultState.loading()));

    final _result = await _fetchMonitoringListUseCase(
        FetchMonitoringListUseCaseParams(state.searchKeyword));

    _result.fold(
      (l) => emit(state.copyWith(
          fetchMonitoringListResult: ResultState.error(failure: l))),
      (r) => emit(state.copyWith(
          fetchMonitoringListResult: ResultState.success(data: r))),
    );
  }

  changeSearchKeyword(String keyword) {
    EasyDebounce.debounce(
      'changeSearchKeyword',
      const Duration(milliseconds: 400),
      () {
        emit(state.copyWith(searchKeyword: keyword));
        fetchMonitoringList();
      },
    );
  }

  Future<void> _fetchPermitTypesLocal() async {
    final _result = await _fetchPermitTypesLocalUseCase();
    _result.fold(
      (l) => null,
      (r) => emit(state.copyWith(permitTypes: r)),
    );
  }

  Future<void> _fetchSubmissionStatusesLocal() async {
    final _result = await _fetchSubmissionStatusesLocalUseCase();
    _result.fold(
      (l) => null,
      (r) => emit(state.copyWith(submissionStatuses: r)),
    );
  }
}
