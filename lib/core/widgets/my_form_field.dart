import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/widgets/my_text.dart';

class MyFormField extends StatelessWidget {
  final String? label;
  final String hint;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final int? maxLines;
  final EdgeInsets? padding;

  const MyFormField({
    Key? key,
    this.label,
    required this.hint,
    this.keyboardType,
    this.onChanged,
    this.maxLines,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            MyText(
              text: label!,
              color: ColorPalettes.textGrey,
              margin: EdgeInsets.only(
                bottom: Sizes.height6,
              ),
            ),
          TextField(
            textInputAction: TextInputAction.done,
            keyboardType: keyboardType ?? TextInputType.text,
            maxLines: maxLines,
            decoration: InputDecoration(
              isDense: true,
              hintText: hint,
              hintStyle: TextStyle(
                color: ColorPalettes.textGrey2,
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.radius8),
              ),
            ),
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
