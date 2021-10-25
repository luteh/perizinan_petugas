part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required ResultState<dynamic> fetchHomeResult,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        fetchHomeResult: ResultState.initial(),
      );
}
