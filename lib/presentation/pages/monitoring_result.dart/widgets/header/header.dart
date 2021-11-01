import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

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
                  text: 'Rp500.000',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  margin: EdgeInsets.only(
                    top: Sizes.height7,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: MyText(
              alignment: Alignment.center,
              text: '10 Desember 2020',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
