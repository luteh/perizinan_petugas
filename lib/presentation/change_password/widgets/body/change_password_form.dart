import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/widgets/my_form_field.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Sizes.height36,
        left: Sizes.width20,
        right: Sizes.width20,
      ),
      child: Column(
        children: [
          const MyFormField(
            hint: Strings.kataSandiBaru,
          ),
          MyFormField(
            hint: Strings.konfirmasiKataSandiBaru,
            padding: EdgeInsets.only(
              top: Sizes.height15,
            ),
          ),
        ],
      ),
    );
  }
}
