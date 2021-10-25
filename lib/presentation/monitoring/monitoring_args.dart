import 'package:equatable/equatable.dart';

class MonitoringArgs extends Equatable {
  final String? title;

  const MonitoringArgs({this.title});

  @override
  List<Object?> get props => [title];
}
