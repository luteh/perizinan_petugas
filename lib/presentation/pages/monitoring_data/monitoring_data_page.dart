import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../core/constants/strings.dart';
import '../../../core/utils/navigation_util.dart';
import '../../../domain/core/unions/failure.dart';
import '../../core/base_widget_class.dart';
import 'cubit/monitoring_data_cubit.dart';
import 'monitoring_data_args.dart';
import 'widgets/body/body.dart';
import 'widgets/footer/footer.dart';

/// Must pass arguments as [MonitoringDataArgs].
/// Maybe return result as [bool]
class MonitoringDataPage extends StatefulWidget {
  static const routeName = '/monitoring-data';

  final MonitoringDataArgs? args;

  const MonitoringDataPage({Key? key, required this.args}) : super(key: key);

  @override
  State<MonitoringDataPage> createState() => _MonitoringDataPageState();
}

class _MonitoringDataPageState extends State<MonitoringDataPage>
    with BaseWidgetClass {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MonitoringDataCubit, MonitoringDataState>(
      listenWhen: (previous, current) =>
          previous.submitMonitoringDataResult !=
          current.submitMonitoringDataResult,
      listener: (context, state) {
        state.submitMonitoringDataResult.when(
          initial: () => null,
          loading: () => showLoadingDialog(),
          success: (data) {
            dismissDialog();
            NavigationUtil.popUntil(result: true);
            showFlushbar(
              context,
              null,
              data,
              isError: false,
            );
          },
          error: (failure) {
            dismissDialog();
            showFlushbar(
              context,
              null,
              Failure.getErrorMessage(failure),
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            Strings.dataMonitoring,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Body(
                formKey: _formKey,
              ),
              Footer(
                formKey: _formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
