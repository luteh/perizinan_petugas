part of 'permission_detail_cubit.dart';

@freezed
class PermissionDetailState with _$PermissionDetailState {
  const factory PermissionDetailState({
    required PermissionDetailArgs args,
    required ResultState<PermitAndCustomerDetailEntity> fetchPermitDetailResult,
  }) = _PermissionDetailState;

  factory PermissionDetailState.initial() => PermissionDetailState(
        args: PermissionDetailArgs.initial(),
        fetchPermitDetailResult: const ResultState.initial(),
      );
}
