import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/style/color_palettes.dart';
import '../../../../core/style/sizes.dart';
import '../../../../core/utils/form_builder_util.dart';
import '../../../../core/widgets/my_text.dart';

class LoginBaseForm extends StatelessWidget {
  final String label, name;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String?) onChanged;
  const LoginBaseForm({
    Key? key,
    required this.label,
    this.keyboardType,
    this.obscureText = false,
    required this.name,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          text: label,
          fontWeight: FontWeight.w700,
          fontSize: Sizes.sp16,
          color: Colors.white,
          height: Sizes.height42,
          alignment: Alignment.centerLeft,
        ),
        FormBuilderTextField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
            fontSize: Sizes.sp16,
            // height: 3,
          ),
          decoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: Sizes.sp14,
              height: Sizes.height1,
              color: Colors.white,
            ),
            isDense: true,
            filled: true,
            contentPadding: EdgeInsets.all(Sizes.width12),
            fillColor: ColorPalettes.greyForm2,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(Sizes.radius6),
            ),
          ),
          name: name,
          validator: FormBuilderValidators.compose(
            [
              FormBuilderUtil.emptyValidator(context),
            ],
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
