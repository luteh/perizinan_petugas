import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/widgets/my_form_field.dart';
import 'package:perizinan_petugas/presentation/change_password/cubit/change_password_cubit.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isLoggedIn = context
        .select((ChangePasswordCubit element) => element.state.isLoggedIn);

    return Padding(
      padding: EdgeInsets.only(
        top: Sizes.height36,
        left: Sizes.width20,
        right: Sizes.width20,
      ),
      child: Column(
        children: [
          if (_isLoggedIn)
            const MyFormField(
              hint: Strings.kataSandiLama,
              isObscure: true,
            ),
          MyFormField(
            hint: Strings.kataSandiBaru,
            isObscure: true,
            padding: _isLoggedIn
                ? EdgeInsets.only(
                    top: Sizes.height15,
                  )
                : EdgeInsets.zero,
          ),
          MyFormField(
            hint: Strings.konfirmasiKataSandiBaru,
            isObscure: true,
            padding: EdgeInsets.only(
              top: Sizes.height15,
            ),
          ),
        ],
      ),
    );
  }
}
