part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required ResultState<dynamic> doLogoutResult,
    required ResultState<BaseResponse<GetProfileResponse>> getProfileResult,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState(
        doLogoutResult: ResultState.initial(),
        getProfileResult: ResultState.initial(),
      );
}
