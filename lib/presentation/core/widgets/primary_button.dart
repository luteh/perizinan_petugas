import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../core/style/color_palettes.dart';
import '../../../core/style/sizes.dart';
import 'my_text.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? fontSize, width, height;
  final FontWeight? fontWeight;
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.padding,
    this.margin,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        child: MyText(
          text: text,
          color: Colors.white,
          fontSize: fontSize ?? Sizes.sp14,
          fontWeight: fontWeight ?? FontWeight.bold,
        ),
        style: ElevatedButton.styleFrom(
          primary: ColorPalettes.bgButtonGrey,
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.width25,
            vertical: Sizes.height9,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.radius5),
          ),
        ),
      ),
    );
  }
}
