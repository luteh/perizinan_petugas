part of 'without_permit_detail_cubit.dart';

@freezed
class WithoutPermitDetailState with _$WithoutPermitDetailState {
  const factory WithoutPermitDetailState({
    required int tabIndex,
  }) = _WithoutPermitDetailState;
  
  factory WithoutPermitDetailState.initial() => const WithoutPermitDetailState(
        tabIndex: 0,
      );
}
