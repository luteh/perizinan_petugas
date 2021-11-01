import 'package:flutter/material.dart';
import 'package:perizinan_petugas/presentation/monitoring_result.dart/widgets/body/monitoring_list.dart';

class MonitoringTabBarView extends StatelessWidget {
  final TabController tabController;
  const MonitoringTabBarView({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: const [
        MonitoringList(),
        MonitoringList(),
        MonitoringList(),
      ],
    );
  }
}
