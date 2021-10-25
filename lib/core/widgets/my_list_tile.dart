import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';

import 'my_text.dart';

class MyListTile extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String? subtitle;
  final Function()? onTap;
  const MyListTile({
    Key? key,
    required this.imageAsset,
    required this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: SvgPicture.asset(
        imageAsset,
        color: ColorPalettes.textGrey2,
      ),
      title: MyText(
        text: title,
        fontSize: Sizes.sp16,
        fontWeight: FontWeight.bold,
        color: ColorPalettes.grey2,
      ),
      subtitle: subtitle == null
          ? null
          : MyText(
              text: subtitle!,
              color: ColorPalettes.grey2,
            ),
      horizontalTitleGap: 0,
      onTap: onTap,
    );
  }
}
