part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    required int selectedMenuItemIndex,
  }) = _MainState;

  factory MainState.initial() => const MainState(
        selectedMenuItemIndex: 0,
      );
}
