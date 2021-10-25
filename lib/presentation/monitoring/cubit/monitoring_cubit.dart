import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'monitoring_state.dart';
part 'monitoring_cubit.freezed.dart';

@injectable
class MonitoringCubit extends Cubit<MonitoringState> {
  MonitoringCubit() : super(MonitoringState.initial());
}
