import 'package:flutter/material.dart';

import '../../../../../domain/entities/monitoring/monitoring_result_detail_entity.dart';
import 'monitoring_list.dart';

class MonitoringTabBarView extends StatelessWidget {
  final TabController tabController;
  final List<MonitoringResultEntity> monitoringResults;
  const MonitoringTabBarView(
      {Key? key, required this.tabController, required this.monitoringResults})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        MonitoringList(
          monitoringResults: monitoringResults,
        ),
        MonitoringList(
          monitoringResults: monitoringResults
              .where((element) => element.submissionStatus != 'Done')
              .toList(),
        ),
        MonitoringList(
          monitoringResults: monitoringResults
              .where((element) => element.submissionStatus == 'Done')
              .toList(),
        ),
      ],
    );
  }
}
