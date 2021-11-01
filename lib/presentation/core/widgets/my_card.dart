import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';

class MyCard extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget child;
  final Offset? offset;
  final Color? shadowColor;
  final double? blurRadius;
  const MyCard({
    Key? key,
    this.margin,
    required this.child,
    this.offset,
    this.padding,
    this.shadowColor,
    this.blurRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.radius10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: blurRadius ?? Sizes.radius6,
            offset: offset ?? Offset.zero,
            color: shadowColor ?? ColorPalettes.shadowGrey,
          ),
        ],
      ),
      child: child,
    );
  }
}
