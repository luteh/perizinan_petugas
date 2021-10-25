import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/core/widgets/my_text.dart';
import 'package:perizinan_petugas/presentation/email_verification/email_verification_page.dart';

class ForgotPasswordSection extends StatelessWidget {
  const ForgotPasswordSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Sizes.height26,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            text: Strings.lupaKataSandi,
            fontSize: Sizes.sp13,
            fontWeight: FontWeight.bold,
            color: ColorPalettes.textGrey,
            margin: EdgeInsets.only(
              right: Sizes.width12,
            ),
          ),
          InkWell(
            onTap: () => _onTapAturUlang(context),
            child: MyText(
              text: Strings.aturUlang,
              fontSize: Sizes.sp13,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  _onTapAturUlang(BuildContext context) async {
    await NavigationUtil.pushNamed(EmailVerificationPage.routeName);
  }
}
