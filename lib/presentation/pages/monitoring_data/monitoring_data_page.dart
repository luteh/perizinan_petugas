import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_data/monitoring_data_args.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_data/widgets/body/body.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_data/widgets/footer/footer.dart';

class MonitoringDataPage extends StatefulWidget {
  static const routeName = '/monitoring-data';

  final MonitoringDataArgs? args;

  const MonitoringDataPage({Key? key, required this.args}) : super(key: key);

  @override
  State<MonitoringDataPage> createState() => _MonitoringDataPageState();
}

class _MonitoringDataPageState extends State<MonitoringDataPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

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
    );
  }
}
