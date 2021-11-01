import 'package:flutter/material.dart';
import '../../../core/style/color_palettes.dart';
import '../../../core/style/sizes.dart';

class RoundedBorderCard extends StatelessWidget {
  final Widget child;

  /// Corder radius default to Sizes.radius11
  final double? radius;
  final EdgeInsetsGeometry? padding, margin;
  const RoundedBorderCard({
    Key? key,
    required this.child,
    this.radius,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius ?? Sizes.radius11),
        border: Border.all(
          color: ColorPalettes.maroon,
          width: 1,
        ),
      ),
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}
