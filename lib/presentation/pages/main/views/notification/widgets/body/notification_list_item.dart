import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../../core/constants/strings.dart';
import '../../../../../../../core/style/color_palettes.dart';
import '../../../../../../../core/style/sizes.dart';
import '../../../../../../../core/utils/navigation_util.dart';
import '../../../../../../../domain/entities/notification/notification_entity.dart';
import '../../../../../../core/widgets/my_card.dart';
import '../../../../../../core/widgets/my_text.dart';
import '../../../../../permission_detail/permission_detail_page.dart';

class NotificationListItem extends StatelessWidget {
  final NotificationEntity notification;
  const NotificationListItem({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      shadowColor: Colors.black.withOpacity(0.16),
      offset: const Offset(0, 6),
      padding: EdgeInsets.symmetric(
        vertical: Sizes.height16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Monitoring',
            fontSize: Sizes.sp12,
            fontWeight: FontWeight.bold,
            color: ColorPalettes.textGrey,
            margin: EdgeInsets.only(
              left: Sizes.width8,
            ),
          ),
          Divider(
            height: Sizes.height28,
            thickness: Sizes.height1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: Strings.descDoMonitoring,
                  fontSize: Sizes.sp12,
                  color: ColorPalettes.textGrey,
                  margin: EdgeInsets.only(
                    bottom: Sizes.height8,
                  ),
                ),
                Wrap(
                  // direction: Axis.vertical,
                  runSpacing: Sizes.height4,
                  children: [
                    // nama
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: MyText(
                            text: Strings.nama,
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: MyText(
                            text: ': Maria Genoveva Ashari',
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                      ],
                    ),
                    // unit perumahan
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: MyText(
                            text: Strings.unitPerumahan,
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: MyText(
                            text: ': SC2.10-01',
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                      ],
                    ),
                    // jenis izin
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: MyText(
                            text: Strings.jenisIzin,
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: MyText(
                            text: ': Izin Renovasi',
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                      ],
                    ),
                    // tanggal pelaksanaan
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: MyText(
                            text: Strings.tanggalPelaksanaan,
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: MyText(
                            text: ': 02 - 05 Desember 2020',
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                MyText(
                  text: Strings.lihatDetailPelanggan,
                  color: ColorPalettes.primary,
                  fontWeight: FontWeight.bold,
                  onTap: () => _onTapLihatDetailPelanggan(context),
                  margin: EdgeInsets.only(
                    top: Sizes.height20,
                  ),
                  decoration: TextDecoration.underline,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onTapLihatDetailPelanggan(BuildContext context) async {
    await NavigationUtil.pushNamed(PermissionDetailPage.routeName);
  }
}
