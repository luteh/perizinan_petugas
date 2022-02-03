import 'package:flutter/material.dart';

import '../../../../../core/style/sizes.dart';
import '../../../../../domain/entities/monitoring/monitoring_result_detail_entity.dart';
import '../../../../core/widgets/my_cached_network_image.dart';
import '../../../../core/widgets/my_card.dart';
import '../../../../core/widgets/my_text.dart';

class MonitoringListItem extends StatelessWidget {
  final ImageEntity imageEntity;
  const MonitoringListItem({Key? key, required this.imageEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.width14,
        vertical: Sizes.height20,
      ),
      blurRadius: Sizes.radius15,
      shadowColor: Colors.black.withOpacity(0.16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCachedNetworkImage(
            imageUrl: imageEntity.image,
          ),
          MyText(
            text: imageEntity.description,
            margin: EdgeInsets.only(
              top: Sizes.height15,
            ),
          ),
        ],
      ),
    );
  }
}
