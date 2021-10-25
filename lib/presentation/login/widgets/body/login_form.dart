import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
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
        ),
        MyFormField(
          hint: Strings.password,
          padding: EdgeInsets.only(
            left: Sizes.width17,
            right: Sizes.width17,
            top: Sizes.height22,
          ),
        ),
      ],
    );
  }
}
