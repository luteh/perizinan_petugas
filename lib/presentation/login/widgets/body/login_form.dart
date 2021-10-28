import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/form_builder_util.dart';
import 'package:perizinan_petugas/core/widgets/my_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyFormField(
          hint: Strings.email,
          padding: EdgeInsets.only(
            left: Sizes.width17,
            right: Sizes.width17,
            top: Sizes.height40,
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderUtil.emptyValidator(context),
            FormBuilderUtil.emailValidator(context),
          ]),
        ),
        MyFormField(
          hint: Strings.password,
          padding: EdgeInsets.only(
            left: Sizes.width17,
            right: Sizes.width17,
            top: Sizes.height22,
          ),
          isObscure: true,
          validator: FormBuilderValidators.compose([
            FormBuilderUtil.emptyValidator(context),
            FormBuilderUtil.minLength(context),
          ]),
        ),
      ],
    );
  }
}
