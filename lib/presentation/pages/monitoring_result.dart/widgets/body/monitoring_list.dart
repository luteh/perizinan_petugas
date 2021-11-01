import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';
import 'package:perizinan_petugas/presentation/monitoring_result.dart/widgets/body/monitoring_list_item.dart';

class MonitoringList extends StatelessWidget {
  const MonitoringList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Sizes.width20,
                top: Sizes.height40,
              ),
              child: Row(
                children: const [
                  MyText(
                    text: '${Strings.statusPelaksanaan} : ',
                    fontWeight: FontWeight.bold,
                  ),
                  MyText(
                    text: Strings.selesai,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.width20,
                vertical: Sizes.height16,
              ),
              itemBuilder: (context, index) {
                return const MonitoringListItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: Sizes.height20,
                );
              },
              itemCount: 2,
            ),
          ],
        );
      },
    );
  }
}
