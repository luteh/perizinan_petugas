import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'without_permit_detail_cubit.freezed.dart';
part 'without_permit_detail_state.dart';

@injectable
class WithoutPermitDetailCubit extends Cubit<WithoutPermitDetailState> {
  WithoutPermitDetailCubit() : super(WithoutPermitDetailState.initial());

  changeTabIndex(int index) {
    emit(state.copyWith(tabIndex: index));
  }
}
