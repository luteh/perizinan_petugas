import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_data/monitoring_data_args.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_data/widgets/body/body.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_data/widgets/footer/footer.dart';

class MonitoringDataPage extends StatelessWidget {
  static const routeName = '/monitoring-data';

  final MonitoringDataArgs? args;

  const MonitoringDataPage({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          Strings.dataMonitoring,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Body(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
