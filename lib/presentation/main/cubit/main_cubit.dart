import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

@injectable
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.initial());

  changeBottomMenuItemIndex(int index) {
    emit(state.copyWith(selectedMenuItemIndex: index));
  }
}
