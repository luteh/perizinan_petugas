part of 'without_permit_detail_cubit.dart';

@freezed
class WithoutPermitDetailState with _$WithoutPermitDetailState {
  const factory WithoutPermitDetailState({
    required int tabIndex,
    required WithoutPermitDetailArgs? args,
    required ResultState<MonitoringWithoutSubmissionDetailEntity>
        fetchDetailResult,
  }) = _WithoutPermitDetailState;

  factory WithoutPermitDetailState.initial() => const WithoutPermitDetailState(
        tabIndex: 0,
        args: null,
        fetchDetailResult: ResultState.initial(),
      );
}
