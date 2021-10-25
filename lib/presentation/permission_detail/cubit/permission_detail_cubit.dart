import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'permission_detail_state.dart';
part 'permission_detail_cubit.freezed.dart';

@injectable
class PermissionDetailCubit extends Cubit<PermissionDetailState> {
  PermissionDetailCubit() : super(PermissionDetailState.initial());
}
