import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/core/unions/result_state.dart';
import '../../../../../../domain/entities/monitoring/monitoring_entity.dart';
import '../../../../../../domain/usecases/monitoring/fetch_monitoring_list_usecase.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final FetchMonitoringListUseCase _fetchMonitoringListUseCase;

  HomeCubit(this._fetchMonitoringListUseCase) : super(HomeState.initial());

  onStarted() {
    fetchMonitoringList();
  }

  fetchMonitoringList() async {
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
}
