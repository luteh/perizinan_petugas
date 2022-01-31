import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../../core/style/sizes.dart';
import '../../../../../core/utils/navigation_util.dart';
import '../../../../../domain/core/unions/failure.dart';
import '../../../../core/base_widget_class.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../cubit/monitoring_cubit.dart';

class Footer extends StatelessWidget with BaseWidgetClass {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MonitoringCubit, MonitoringState>(
      listenWhen: (previous, current) =>
          previous.submitMonitoringResult != current.submitMonitoringResult,
      listener: (context, state) {
        state.submitMonitoringResult.when(
          initial: () => null,
          loading: () {
            showLoadingDialog();
          },
          success: (data) {
            dismissDialog();
            NavigationUtil.popUntil();
            showFlushbar(
              context,
              null,
              data.message,
              isError: false,
            );
          },
          error: (failure) {
            dismissDialog();
            showFlushbar(context, null, Failure.getErrorMessage(failure));
          },
        );
      },
      child: PrimaryButton(
        margin: EdgeInsets.only(
          top: Sizes.height61,
          bottom: Sizes.height70,
        ),
        text: Strings.simpan.toUpperCase(),
        onPressed: () => _onPressSimpan(context),
      ),
    );
  }

  _onPressSimpan(BuildContext context) {
    context.read<MonitoringCubit>().simpanMonitoringData();
  }
}
