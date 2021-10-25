import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/core/widgets/my_form_field.dart';
import 'package:perizinan_petugas/core/widgets/my_text.dart';
import 'package:perizinan_petugas/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/code_verification/code_verification_args.dart';
import 'package:perizinan_petugas/presentation/code_verification/code_verification_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyText(
            text: Strings.descEnterRegisteredEmail,
            fontWeight: FontWeight.bold,
            color: ColorPalettes.textGrey,
            textAlign: TextAlign.center,
            margin: EdgeInsets.symmetric(
              horizontal: Sizes.width70,
            ),
          ),
          MyFormField(
            padding: EdgeInsets.only(
              top: Sizes.height41,
              left: Sizes.width20,
              right: Sizes.width20,
            ),
            hint: Strings.email,
          ),
          PrimaryButton(
            text: Strings.berikutnya,
            onPressed: () => _onPressBerikutnya(context),
            margin: EdgeInsets.only(
              top: Sizes.height88,
            ),
          ),
        ],
      ),
    );
  }

  _onPressBerikutnya(BuildContext context) async {
    await NavigationUtil.pushNamed(
      CodeVerificationPage.routeName,
      arguments: const CodeVerificationArgs(
        email: 'email@example.com',
      ),
    );
  }
}
