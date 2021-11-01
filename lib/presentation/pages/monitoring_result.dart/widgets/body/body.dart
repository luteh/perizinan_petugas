import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_result.dart/widgets/body/monitoring_tab_bar.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_result.dart/widgets/body/monitoring_tab_bar_view.dart';

class Body extends HookWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabController = useTabController(initialLength: 3);
    return Column(
      children: [
        MonitoringTabBar(
          tabController: _tabController,
        ),
        Expanded(
          child: MonitoringTabBarView(
            tabController: _tabController,
          ),
        ),
      ],
    );
  }
}
