import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'monitoring_data_state.dart';
part 'monitoring_data_cubit.freezed.dart';

@injectable
class MonitoringDataCubit extends Cubit<MonitoringDataState> {
  MonitoringDataCubit() : super(MonitoringDataState.initial());
}
