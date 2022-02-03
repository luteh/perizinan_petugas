import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../../core/style/color_palettes.dart';
import '../../../../../core/style/sizes.dart';
import '../../../../../core/utils/date_util.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../domain/entities/monitoring/monitoring_result_detail_entity.dart';
import '../../../../core/widgets/my_text.dart';

class Header extends StatelessWidget {
  final MonitoringResultDetailEntity monitoringResultDetailEntity;
  const Header({Key? key, required this.monitoringResultDetailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.radius10),
          topRight: Radius.circular(Sizes.radius10),
        ),
        color: ColorPalettes.primary,
      ),
      padding: EdgeInsets.symmetric(
        vertical: Sizes.height8,
      ),
      margin: EdgeInsets.only(
        top: Sizes.height28,
        bottom: Sizes.height1,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const MyText(
                  text: Strings.totalBiayaKerusakan,
                  color: Colors.white,
                ),
                MyText(
                  text: formatToIdr(monitoringResultDetailEntity.amount),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  margin: EdgeInsets.only(
                    top: Sizes.height7,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyText(
              alignment: Alignment.center,
              text: DateUtil.toFormattedDate(monitoringResultDetailEntity
                  .monitorings.lastOrNull?.monitoringDate),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
