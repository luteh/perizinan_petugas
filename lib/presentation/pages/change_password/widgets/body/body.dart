import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';
import 'package:perizinan_petugas/presentation/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/change_password/cubit/change_password_cubit.dart';
import 'package:perizinan_petugas/presentation/change_password/widgets/body/change_password_form.dart';
import 'package:perizinan_petugas/presentation/login/login_page.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _isLoggedIn = context
        .select((ChangePasswordCubit element) => element.state.isLoggedIn);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          text: Strings.descCreatePassword,
          fontWeight: FontWeight.bold,
          color: ColorPalettes.textGrey,
        ),
        Form(
          key: _formKey,
          child: const ChangePasswordForm(),
        ),
        PrimaryButton(
          text: Strings.simpan.toUpperCase(),
          onPressed: () => _onPressSimpan(context, _isLoggedIn),
          margin: EdgeInsets.only(
            top: Sizes.height46,
          ),
        ),
      ],
    );
  }

  _onPressSimpan(BuildContext context, bool isLoggedIn) async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    if (isLoggedIn) {
      NavigationUtil.popUntil();
      return;
    }

    await NavigationUtil.pushNamedAndRemoveUntil(LoginPage.routeName);
  }
}
