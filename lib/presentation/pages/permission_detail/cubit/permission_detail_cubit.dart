import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/detail_customer_entity.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/permit_and_customer_detail_entity.dart';
import 'package:perizinan_petugas/domain/usecases/monitoring/fetch_customer_detail_usecase.dart';

import '../../../../domain/core/unions/result_state.dart';
import '../../../../domain/entities/monitoring/permit_detail_entity.dart';
import '../../../../domain/usecases/monitoring/fetch_permit_detail_usecase.dart';
import '../permission_detail_args.dart';

part 'permission_detail_cubit.freezed.dart';
part 'permission_detail_state.dart';

@injectable
class PermissionDetailCubit extends Cubit<PermissionDetailState> {
  final FetchPermitDetailUseCase _fetchPermitDetailUseCase;
  final FetchCustomerDetailUseCase _fetchCustomerDetailUseCase;

  PermissionDetailCubit(
      this._fetchPermitDetailUseCase, this._fetchCustomerDetailUseCase)
      : super(PermissionDetailState.initial());

  onStarted(PermissionDetailArgs args) {
    emit(state.copyWith(args: args));
    fetchPermitAndCustomerDetail();
  }

  fetchPermitAndCustomerDetail() async {
    emit(state.copyWith(fetchPermitDetailResult: const ResultState.loading()));

    final _result = await Future.wait(
      [
        _fetchPermitDetailUseCase(
            FetchPermitDetailUseCaseParams(state.args.id)),
        _fetchCustomerDetailUseCase(
            FetchCustomerDetailUseCaseParams(state.args.id)),
      ],
    );

    _result[0].fold(
      (l) => emit(state.copyWith(
          fetchPermitDetailResult: ResultState.error(failure: l))),
      (permitDetail) {
        _result[1].fold(
          (l) => emit(state.copyWith(
              fetchPermitDetailResult: ResultState.error(failure: l))),
          (customerDetail) => emit(state.copyWith(
              fetchPermitDetailResult: ResultState.success(
                  data: PermitAndCustomerDetailEntity(
                      permitDetail as PermitDetailEntity,
                      customerDetail as DetailCustomerEntity)))),
        );
      },
    );
  }
}
