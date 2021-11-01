import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';

class MyColoredStatusBar extends StatelessWidget {
  final Color? color;
  const MyColoredStatusBar({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? ColorPalettes.statusBarGrey.withOpacity(0.73),
      height: MediaQuery.of(context).padding.top,
    );
  }
}
