import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'monitoring_result_state.dart';
part 'monitoring_result_cubit.freezed.dart';

@injectable
class MonitoringResultCubit extends Cubit<MonitoringResultState> {
  MonitoringResultCubit() : super(MonitoringResultState.initial());
}
