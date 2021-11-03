import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_cached_network_image.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';

class HasilMonitoringListItem extends StatelessWidget {
  const HasilMonitoringListItem({Key? key}) : super(key: key);

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
          const MyCachedNetworkImage(
            imageUrl: 'https://topcareer.id/wp-content/uploads/2019/09/cropped-behind-the-scenes-of-a-ryan-muirhead-photo-shoot-3-750x460.jpg',
          ),
          MyText(
            text: 'Pemotretan masih berlangsung',
            margin: EdgeInsets.only(
              top: Sizes.height15,
            ),
          ),
        ],
      ),
    );
  }
}
