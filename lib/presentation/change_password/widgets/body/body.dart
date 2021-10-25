import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/core/widgets/my_text.dart';
import 'package:perizinan_petugas/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/change_password/widgets/body/change_password_form.dart';
import 'package:perizinan_petugas/presentation/login/login_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          text: Strings.descCreatePassword,
          fontWeight: FontWeight.bold,
          color: ColorPalettes.textGrey,
        ),
        const ChangePasswordForm(),
        PrimaryButton(
          text: Strings.simpan.toUpperCase(),
          onPressed: () => _onPressSimpan(context),
          margin: EdgeInsets.only(
            top: Sizes.height46,
          ),
        ),
      ],
    );
  }

  _onPressSimpan(BuildContext context) async {
    await NavigationUtil.pushNamedAndRemoveUntil(LoginPage.routeName);
  }
}
