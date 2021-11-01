import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';

class FilledField extends StatelessWidget {
  final String label;
  final String value;
  final EdgeInsets? padding;
  final bool isDividerVisible;
  const FilledField({
    Key? key,
    required this.label,
    required this.value,
    this.padding,
    this.isDividerVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: label,
                color: ColorPalettes.textGrey,
                fontSize: Sizes.sp14,
                fontWeight: FontWeight.bold,
              ),
              MyText(
                text: value,
                margin: EdgeInsets.only(
                  top: Sizes.height5,
                ),
                color: ColorPalettes.textGrey,
                fontSize: Sizes.sp16,
              ),
            ],
          ),
        ),
        Visibility(
          visible: isDividerVisible,
          child: Divider(
            height: Sizes.height13,
            thickness: Sizes.height1,
          ),
        ),
      ],
    );
  }
}
