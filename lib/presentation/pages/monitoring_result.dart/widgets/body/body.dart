import 'package:flutter/material.dart';

import '../../../../../domain/entities/monitoring/monitoring_result_detail_entity.dart';
import 'monitoring_tab_bar.dart';
import 'monitoring_tab_bar_view.dart';

class Body extends StatefulWidget {
  final List<MonitoringResultEntity> monitoringResults;
  const Body({
    Key? key,
    required this.monitoringResults,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MonitoringTabBar(
          tabController: _tabController,
        ),
        Expanded(
          child: MonitoringTabBarView(
            tabController: _tabController,
            monitoringResults: widget.monitoringResults,
          ),
        ),
      ],
    );
  }
}
