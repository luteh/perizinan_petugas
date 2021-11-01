import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_cached_network_image.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_card.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';

class MonitoringListItem extends StatelessWidget {
  const MonitoringListItem({Key? key}) : super(key: key);

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
          const MyCachedNetworkImage(
            imageUrl: 'https://via.placeholder.com/153x102',
          ),
          MyText(
            text: Strings.lorem,
            margin: EdgeInsets.only(
              top: Sizes.height15,
            ),
          ),
        ],
      ),
    );
  }
}
