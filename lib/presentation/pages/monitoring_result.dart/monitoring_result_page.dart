import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_result.dart/widgets/body/body.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_result.dart/widgets/header/header.dart';

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
      body: Column(
        children: const [
          Header(),
          Expanded(
            child: Body(),
          ),
        ],
      ),
    );
  }

  _onTapDatePickerAction(BuildContext context) {}
}
