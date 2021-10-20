import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/unions/failure.dart';
import 'package:perizinan_petugas/core/utils/get_util.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/core/widgets/loading_dialog.dart';
import 'package:perizinan_petugas/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/login/bloc/login_bloc.dart';
import 'package:perizinan_petugas/presentation/login/widgets/body/login_form.dart';
import 'package:perizinan_petugas/presentation/main/main_page.dart';

import '../../../../core/extensions/snackbar_ext.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.loginResultState != current.loginResultState,
      listener: (context, state) {
        state.loginResultState.maybeWhen(
          loading: () async => await GetUtil.showDialog(
            const LoadingDialog(),
          ),
          success: (data) async {
            GetUtil.dismissDialog();
            await NavigationUtil.pushReplacementNamed(MainPage.routeName);
          },
          error: (failure) {
            GetUtil.dismissDialog();
            context.showErrorSnackbar(Failure.getErrorMessage(failure));
          },
          orElse: () => null,
        );
      },
      child: PrimaryButton(
        text: Strings.logIn,
        height: Sizes.height48,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: Sizes.height97,
        ),
        onPressed: _onPressLogIn,
      ),
    );
  }

  _onPressLogIn() {
    if (formKeyLogin.currentState?.validate() ?? false) {
      GetUtil.context.read<LoginBloc>().add(const LoginEvent.doLogin());
    }
  }
}
