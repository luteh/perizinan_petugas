import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/data/remote/response/base_response.dart';
import 'package:perizinan_petugas/domain/core/unions/failure.dart';
import 'package:perizinan_petugas/domain/core/unions/result_state.dart';
import 'package:perizinan_petugas/presentation/core/base_widget_class.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';
import 'package:perizinan_petugas/presentation/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/pages/change_password/cubit/change_password_cubit.dart';
import 'package:perizinan_petugas/presentation/pages/change_password/widgets/body/change_password_form.dart';
import 'package:perizinan_petugas/presentation/pages/login/login_page.dart';

class Body extends StatelessWidget with BaseWidgetClass {
  Body({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _isLoggedIn = context
        .select((ChangePasswordCubit element) => element.state.isLoggedIn);

    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listenWhen: (previous, current) =>
          previous.setNewPasswordResult != current.setNewPasswordResult ||
          previous.updatePasswordResult != current.updatePasswordResult,
      listener: (context, state) {
        handleUpdatePasswordResult(context, state.updatePasswordResult);
        handleSetNewPasswordResult(context, state.setNewPasswordResult);
      },
      child: Column(
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
      ),
    );
  }

  _onPressSimpan(BuildContext context, bool isLoggedIn) async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    if (isLoggedIn) {
      context.read<ChangePasswordCubit>().updatePassword();
      return;
    }

    context.read<ChangePasswordCubit>().setNewPassword();
  }

  void handleUpdatePasswordResult(
      BuildContext context, ResultState<BaseResponse> updatePasswordResult) {
    updatePasswordResult.maybeWhen(
      loading: () {
        showLoadingDialog();
      },
      error: (failure) {
        dismissDialog();
        showFlushbar(context, null, Failure.getErrorMessage(failure));
      },
      success: (data) async {
        dismissDialog();
        NavigationUtil.popUntil();
      },
      orElse: () => null,
    );
  }

  void handleSetNewPasswordResult(
      BuildContext context, ResultState<BaseResponse> setNewPasswordResult) {
    setNewPasswordResult.maybeWhen(
      loading: () {
        showLoadingDialog();
      },
      error: (failure) {
        dismissDialog();
        showFlushbar(context, null, Failure.getErrorMessage(failure));
      },
      success: (data) async {
        dismissDialog();

        await NavigationUtil.pushNamedAndRemoveUntil(LoginPage.routeName);
      },
      orElse: () => null,
    );
  }
}
