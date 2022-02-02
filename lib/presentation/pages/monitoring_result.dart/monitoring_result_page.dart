import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/strings.dart';
import '../../../core/style/sizes.dart';
import '../../core/widgets/my_error_widget.dart';
import 'cubit/monitoring_result_cubit.dart';
import 'widgets/body/body.dart';
import 'widgets/header/header.dart';

/// Must pass arguments as [MonitoringResultArgs]
class MonitoringResultPage extends StatelessWidget {
  static const routeName = '/monitoring-result';
  const MonitoringResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.hasilMonitoring,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: Sizes.width32,
            ),
            child: InkWell(
              onTap: () => _onTapDatePickerAction(context),
              child: const Icon(
                Icons.date_range_outlined,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<MonitoringResultCubit, MonitoringResultState>(
        buildWhen: (previous, current) =>
            previous.fetchMonitoringResultDetailResult !=
            current.fetchMonitoringResultDetailResult,
        builder: (context, state) {
          return state.fetchMonitoringResultDetailResult.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) {
              return Column(
                children: const [
                  Header(),
                  Expanded(
                    child: Body(),
                  ),
                ],
              );
            },
            error: (failure) {
              return MyErrorWidget(
                failure: failure,
                onPressRetry: () {
                  context
                      .read<MonitoringResultCubit>()
                      .fetchMonitoringResultDetail();
                },
              );
            },
          );
        },
      ),
    );
  }

  _onTapDatePickerAction(BuildContext context) {}
}
