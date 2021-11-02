import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/domain/core/unions/result_state.dart';
import 'package:perizinan_petugas/domain/usecases/do_logout_usecase.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final DoLogoutUseCase _doLogoutUseCase;
  ProfileCubit(this._doLogoutUseCase) : super(ProfileState.initial());

  doLogout() async {
    emit(state.copyWith(doLogoutResult: const ResultState.loading()));

    final _result = await _doLogoutUseCase(const DoLogoutUseCaseParams());

    _result.fold(
      (l) =>
          emit(state.copyWith(doLogoutResult: ResultState.error(failure: l))),
      (r) => emit(state.copyWith(doLogoutResult: ResultState.success(data: r))),
    );
  }
}
