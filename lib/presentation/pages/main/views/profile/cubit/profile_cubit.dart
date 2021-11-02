import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/data/remote/response/accounts/profile/get_profile_response.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';
import 'package:perizinan_petugas/domain/core/unions/result_state.dart';
import 'package:perizinan_petugas/domain/core/usecase/no_param.dart';
import 'package:perizinan_petugas/domain/usecases/do_logout_usecase.dart';
import 'package:perizinan_petugas/domain/usecases/get_profile_usecase.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final DoLogoutUseCase _doLogoutUseCase;
  final GetProfileUseCase _getProfileUseCase;

  ProfileCubit(this._doLogoutUseCase, this._getProfileUseCase)
      : super(ProfileState.initial());

  onStarted() {
    getProfile();
  }

  doLogout() async {
    emit(state.copyWith(doLogoutResult: const ResultState.loading()));

    final _result = await _doLogoutUseCase(const DoLogoutUseCaseParams());

    _result.fold(
      (l) =>
          emit(state.copyWith(doLogoutResult: ResultState.error(failure: l))),
      (r) => emit(state.copyWith(doLogoutResult: ResultState.success(data: r))),
    );
  }

  getProfile() async {
    emit(state.copyWith(getProfileResult: const ResultState.loading()));

    final _result = await _getProfileUseCase(const NoParam());

    _result.fold(
      (l) =>
          emit(state.copyWith(getProfileResult: ResultState.error(failure: l))),
      (r) =>
          emit(state.copyWith(getProfileResult: ResultState.success(data: r))),
    );
  }
}
