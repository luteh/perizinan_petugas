import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/cubit/monitoring_cubit.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      margin: EdgeInsets.only(
        top: Sizes.height61,
        bottom: Sizes.height70,
      ),
      text: Strings.simpan.toUpperCase(),
      onPressed: () => _onPressSimpan(context),
    );
  }

  _onPressSimpan(BuildContext context) {
    context.read<MonitoringCubit>().simpanMonitoringData();
  }
}
