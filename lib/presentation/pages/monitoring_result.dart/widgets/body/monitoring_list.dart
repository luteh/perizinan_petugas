import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../../core/style/sizes.dart';
import '../../../../../domain/entities/monitoring/monitoring_result_detail_entity.dart';
import '../../../../core/widgets/my_text.dart';
import 'monitoring_list_item.dart';

class MonitoringList extends StatelessWidget {
  final List<MonitoringResultEntity> monitoringResults;
  const MonitoringList({Key? key, required this.monitoringResults})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    monitoringResults
        .sort((a, b) => a.submissionStatus.compareTo(b.submissionStatus));
    return ListView.builder(
      itemCount: monitoringResults.length,
      itemBuilder: (BuildContext context, int parentIndex) {
        return Column(
          children: [
            Builder(builder: (context) {
              if (parentIndex > 0 &&
                  monitoringResults[parentIndex].submissionStatus ==
                      monitoringResults[parentIndex - 1].submissionStatus) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: EdgeInsets.only(
                  left: Sizes.width20,
                  top: Sizes.height40,
                ),
                child: Row(
                  children: [
                    const MyText(
                      text: '${Strings.statusPelaksanaan} : ',
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      text: monitoringResults[parentIndex].submissionStatus,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ],
                ),
              );
            }),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.width20,
                vertical: Sizes.height16,
              ),
              itemBuilder: (context, index) {
                return MonitoringListItem(
                  imageEntity: monitoringResults[parentIndex].images[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: Sizes.height20,
                );
              },
              itemCount: monitoringResults[parentIndex].images.length,
            ),
          ],
        );
      },
    );
  }
}
