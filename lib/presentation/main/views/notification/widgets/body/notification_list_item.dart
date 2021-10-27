import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/widgets/my_card.dart';
import 'package:perizinan_petugas/core/widgets/my_text.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({Key? key}) : super(key: key);

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
                          child: MyText(
                            text: Strings.nama,
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                        Expanded(
                          child: MyText(
                            text: ': Value',
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
                          child: MyText(
                            text: Strings.unitPerumahan,
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                        Expanded(
                          child: MyText(
                            text: ': Value',
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
                          child: MyText(
                            text: Strings.jenisIzin,
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                        Expanded(
                          child: MyText(
                            text: ': Value',
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
                          child: MyText(
                            text: Strings.tanggalPelaksanaan,
                            fontSize: Sizes.sp12,
                            color: ColorPalettes.textGrey,
                          ),
                        ),
                        Expanded(
                          child: MyText(
                            text: ': Value',
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

  _onTapLihatDetailPelanggan(BuildContext context) {}
}
