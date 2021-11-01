import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../../../core/style/color_palettes.dart';
import '../../../core/style/sizes.dart';
import 'my_text.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  /// Corner radius default to 10
  final double? fontSize, width, height, radius;
  final double borderWidth;
  const SecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.padding,
    this.fontSize,
    this.width,
    this.height,
    this.radius,
    this.borderWidth = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Sizes.width218,
      height: height ?? Sizes.height56,
      child: OutlinedButton(
        onPressed: onPressed,
        child: MyText(
          text: text,
          textType: TextType.button,
          color: ColorPalettes.maroon,
          fontSize: fontSize ?? Sizes.sp18,
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? Sizes.radius10),
          ),
          side: BorderSide(
            width: borderWidth,
            color: ColorPalettes.maroon,
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
