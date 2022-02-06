import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/monitoring_args.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/widgets/body/body.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/widgets/footer/footer.dart';

/// Must send arguments as [MonitoringArgs].
/// Maybe return result as [List<<InputMonitoringData>>]
class MonitoringPage extends StatelessWidget {
  static const routeName = '/monitoring';

  final MonitoringArgs? args;
  const MonitoringPage({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args?.title ?? Strings.monitoring,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [Body(), Footer()],
        ),
      ),
    );
  }
}
