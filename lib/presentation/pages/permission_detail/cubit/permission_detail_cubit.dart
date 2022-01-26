import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/unions/result_state.dart';
import '../../../../domain/entities/monitoring/permit_detail_entity.dart';
import '../../../../domain/usecases/monitoring/fetch_permit_detail_usecase.dart';
import '../permission_detail_args.dart';

part 'permission_detail_cubit.freezed.dart';
part 'permission_detail_state.dart';

@injectable
class PermissionDetailCubit extends Cubit<PermissionDetailState> {
  final FetchPermitDetailUseCase _fetchPermitDetailUseCase;

  PermissionDetailCubit(this._fetchPermitDetailUseCase)
      : super(PermissionDetailState.initial());

  onStarted(PermissionDetailArgs args) {
    emit(state.copyWith(args: args));
  }

  fetchPermitDetail() async {
    emit(state.copyWith(fetchPermitDetailResult: const ResultState.loading()));

    final _result = await _fetchPermitDetailUseCase(
        FetchPermitDetailUseCaseParams(state.args.id));

    _result.fold(
      (l) => emit(state.copyWith(
          fetchPermitDetailResult: ResultState.error(failure: l))),
      (r) => emit(state.copyWith(
          fetchPermitDetailResult: ResultState.success(data: r))),
    );
  }
}
