import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/login/widgets/body/forgot_password_section.dart';
import 'package:perizinan_petugas/presentation/login/widgets/body/login_form.dart';
import 'package:perizinan_petugas/presentation/main/main_page.dart';

class LoginCard extends StatelessWidget {
  LoginCard({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Sizes.width20,
        right: Sizes.width20,
        top: Sizes.height119,
        bottom: Sizes.height119,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(Sizes.radius20),
        border: Border.all(
          color: ColorPalettes.dividerGrey2,
        ),
      ),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: const LoginForm(),
          ),
          const ForgotPasswordSection(),
          PrimaryButton(
            text: Strings.masuk,
            onPressed: () => _onPressMasuk(context),
            margin: EdgeInsets.only(
              top: Sizes.height43,
              bottom: Sizes.height73,
            ),
          ),
        ],
      ),
    );
  }

  _onPressMasuk(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      await NavigationUtil.pushNamedAndRemoveUntil(MainPage.routeName);
    }
  }
}
