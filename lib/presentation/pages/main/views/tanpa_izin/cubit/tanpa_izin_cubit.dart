import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/navigation_util.dart';
import '../../../../../../domain/core/unions/result_state.dart';
import '../../../../../../domain/entities/monitoring_without_submission/monitoring_without_submission_entity.dart';
import '../../../../../../domain/usecases/monitoring_without_submission/fetch_monitoring_without_submissions_usecase.dart';
import '../../../../without_permit_detail/without_permit_detail_args.dart';
import '../../../../without_permit_detail/without_permit_detail_page.dart';

part 'tanpa_izin_cubit.freezed.dart';
part 'tanpa_izin_state.dart';

@injectable
class TanpaIzinCubit extends Cubit<TanpaIzinState> {
  final FetchMonitoringWithoutSubmissionsUseCase
      _fetchMonitoringWithoutSubmissionsUseCase;

  TanpaIzinCubit(this._fetchMonitoringWithoutSubmissionsUseCase)
      : super(TanpaIzinState.initial());

  onStarted() {
    fetchMonitoringWithoutSubmissions();
  }

  putMarker({required LatLng latLng}) {
    emit(state.copyWith(putMarkerResult: const ResultState.loading()));

    // if (state.markers.length > 1) {
    //   state.markers.removeWhere((element) => element.markerId.value == '2');
    //   // emit(state);
    // }

    state.markers.add(
      Marker(
        markerId: const MarkerId('-1'),
        position: latLng,
        infoWindow: const InfoWindow(
          title: 'Tanpa Izin',
          // onTap: _onTapMarker,
        ),
      ),
    );
    emit(
        state.copyWith(putMarkerResult: const ResultState.success(data: null)));
  }

  _onTapInfoWindowMarker(int customerId) async {
    await NavigationUtil.pushNamed(WithoutPermitDetailPage.routeName,
        arguments: WithoutPermitDetailArgs(id: customerId));
  }

  fetchMonitoringWithoutSubmissions() async {
    emit(state.copyWith(
        fetchMonitoringWithoutSubmissionsResult: const ResultState.loading()));

    final _result = await _fetchMonitoringWithoutSubmissionsUseCase(
        FetchMonitoringWithoutSubmissionsUseCaseParams(state.searchKeyword));

    _result.fold(
      (l) => emit(state.copyWith(
          fetchMonitoringWithoutSubmissionsResult:
              ResultState.error(failure: l))),
      (r) => emit(state.copyWith(
          markers: r
              .map(
                (e) => Marker(
                  markerId: MarkerId('${e.customerId}'),
                  position: LatLng(e.lokasi.latitude, e.lokasi.longitude),
                  infoWindow: InfoWindow(
                    title: e.customerName,
                    onTap: () {
                      _onTapInfoWindowMarker(e.customerId);
                    },
                  ),
                ),
              )
              .toSet(),
          fetchMonitoringWithoutSubmissionsResult:
              ResultState.success(data: r))),
    );
  }

  changeSearchKeyword(String keyword) {
    EasyDebounce.debounce(
      'changeSearchKeyword',
      const Duration(milliseconds: 400),
      () {
        emit(state.copyWith(searchKeyword: keyword));
        fetchMonitoringWithoutSubmissions();
      },
    );
  }
}
