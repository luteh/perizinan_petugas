import 'package:flutter/material.dart';

import '../../../../../core/style/sizes.dart';
import '../../../../../domain/entities/monitoring_without_submission/monitoring_without_submission_detail_entity.dart';
import '../../../../core/widgets/my_cached_network_image.dart';
import '../../../../core/widgets/my_text.dart';

class HasilMonitoringListItem extends StatelessWidget {
  final ImageEntity image;
  const HasilMonitoringListItem({Key? key, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Sizes.width14,
        right: Sizes.width14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCachedNetworkImage(
            imageUrl: image.image,
          ),
          MyText(
            text: image.descriptions,
            margin: EdgeInsets.only(
              top: Sizes.height15,
            ),
          ),
        ],
      ),
    );
  }
}
