import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/widgets/my_text.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyText(
      text: Strings.logIn,
      color: Colors.white,
      fontSize: Sizes.sp30,
      fontWeight: FontWeight.w700,
      alignment: Alignment.centerLeft,
    );
  }
}
