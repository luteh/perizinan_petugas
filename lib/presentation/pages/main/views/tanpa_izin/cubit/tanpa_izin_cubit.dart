import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/domain/core/unions/result_state.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/presentation/pages/without_permit_detail/without_permit_detail_page.dart';

part 'tanpa_izin_cubit.freezed.dart';
part 'tanpa_izin_state.dart';

@injectable
class TanpaIzinCubit extends Cubit<TanpaIzinState> {
  TanpaIzinCubit() : super(TanpaIzinState.initial());

  onStarted() {
    emit(
      state.copyWith(
        markers: {
          Marker(
            markerId: const MarkerId('1'),
            position: const LatLng(-6.1777942826873335, 106.97580143809319),
            infoWindow: InfoWindow(
              title: 'Tanpa Izin 1',
              onTap: _onTapInfoWindowMarker,
            ),
          ),
        },
      ),
    );
  }

  putMarker({required LatLng latLng}) {
    emit(state.copyWith(putMarkerResult: const ResultState.loading()));

    if (state.markers.length > 1) {
      state.markers.removeWhere((element) => element.markerId.value == '2');
      // emit(state);
    }

    state.markers.add(
      Marker(
        markerId: const MarkerId('2'),
        position: latLng,
        infoWindow: const InfoWindow(
          title: 'Tanpa Izin 2',
          // onTap: _onTapMarker,
        ),
      ),
    );
    emit(
        state.copyWith(putMarkerResult: const ResultState.success(data: null)));
  }

  _onTapInfoWindowMarker() async {
    await NavigationUtil.pushNamed(WithoutPermitDetailPage.routeName);
  }
}
