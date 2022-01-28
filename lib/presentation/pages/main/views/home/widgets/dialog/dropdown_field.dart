import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';

class DropDownField extends StatelessWidget {
  final String label;
  final List<String> items;
  final Function(String?)? onChanged;
  final EdgeInsets? margin;
  final String name;
  final String? initialValue;

  const DropDownField({
    Key? key,
    required this.label,
    required this.items,
    this.onChanged,
    this.margin,
    required this.name,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: label,
            fontSize: Sizes.sp14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            margin: EdgeInsets.only(
              bottom: Sizes.height9,
            ),
          ),
          FormBuilderDropdown(
            initialValue: initialValue,
            decoration: InputDecoration(
              constraints: BoxConstraints.tightFor(
                height: Sizes.height35,
                // width: Sizes.width220,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.radius5),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.width15,
              ),
            ),
            onChanged: onChanged,
            items: items
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: MyText(
                      text: e,
                      fontSize: Sizes.sp13,
                    ),
                  ),
                )
                .toList(),
            name: name,
          ),
        ],
      ),
    );
  }
}
