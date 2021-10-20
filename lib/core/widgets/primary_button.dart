import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../style/color_palettes.dart';
import '../style/sizes.dart';
import '../widgets/my_text.dart';

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
      width: width ?? Sizes.width218,
      height: height ?? Sizes.height56,
      padding: padding ?? EdgeInsets.zero,
      margin: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Ink(
          width: width ?? Sizes.width218,
          height: height ?? Sizes.height56,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorPalettes.maroon,
                ColorPalettes.maroonDark,
              ],
            ),
            borderRadius: BorderRadius.circular(Sizes.radius10),
          ),
          child: MyText(
            text: text,
            textType: TextType.button,
            color: Colors.white,
            fontSize: fontSize ?? Sizes.sp16,
            fontWeight: fontWeight ?? FontWeight.w700,
            alignment: Alignment.center,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.radius10),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
      ),
    );
  }
}
