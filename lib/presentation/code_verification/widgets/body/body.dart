import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/core/utils/theme_util.dart';
import 'package:perizinan_petugas/core/widgets/my_text.dart';
import 'package:perizinan_petugas/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/change_password/change_password_page.dart';
import 'package:perizinan_petugas/presentation/code_verification/cubit/code_verification_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          text: Strings.descCodeSent,
          fontWeight: FontWeight.bold,
          color: ColorPalettes.textGrey,
        ),
        BlocSelector<CodeVerificationCubit, CodeVerificationState, String>(
          selector: (state) {
            return state.args.email;
          },
          builder: (context, state) {
            return MyText(
              text: state,
              fontWeight: FontWeight.bold,
              color: ColorPalettes.darkBlue,
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Sizes.width70,
            right: Sizes.width70,
            top: Sizes.height70,
          ),
          child: PinCodeTextField(
            length: 4,
            obscureText: false,
            animationType: AnimationType.fade,
            animationDuration: ThemeUtil.shortAnimationDuration,
            onChanged: (value) {},
            appContext: context,
            keyboardType: TextInputType.number,
          ),
        ),
        PrimaryButton(
          text: Strings.berikutnya.toUpperCase(),
          onPressed: () => _onPressBerikutnya(context),
          margin: EdgeInsets.only(
            top: Sizes.height70,
            bottom: Sizes.height25,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              text: Strings.descResentCode,
              fontWeight: FontWeight.bold,
              color: ColorPalettes.textGrey,
            ),
            MyText(
              text: '05:00',
              fontWeight: FontWeight.bold,
              color: ColorPalettes.darkBlue,
            )
          ],
        ),
      ],
    );
  }

  _onPressBerikutnya(BuildContext context) async {
    await NavigationUtil.pushNamed(ChangePasswordPage.routeName);
  }
}
