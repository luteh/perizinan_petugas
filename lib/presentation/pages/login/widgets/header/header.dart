import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalettes.primary,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.height27,
              horizontal: Sizes.width30,
            ),
            child: Image.asset(
              ImageAsset.logoDamaiPutra,
              height: Sizes.height141,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: '${Strings.welcome},',
                fontSize: Sizes.sp20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              MyText(
                text: Strings.login.toUpperCase(),
                fontSize: Sizes.sp30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                margin: EdgeInsets.only(
                  top: Sizes.height13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
