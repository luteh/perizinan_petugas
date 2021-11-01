part of 'tanpa_izin_cubit.dart';

@freezed
class TanpaIzinState with _$TanpaIzinState {
  const factory TanpaIzinState({
    required Set<Marker> markers,
    required ResultState<dynamic> putMarkerResult,
  }) = _TanpaIzinState;

  factory TanpaIzinState.initial() => const TanpaIzinState(
        markers: <Marker>{},
        putMarkerResult: ResultState.initial(),
      );
}
