import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/form_builder_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_form_field.dart';
import 'package:perizinan_petugas/presentation/login/cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyFormField(
          hint: Strings.email,
          padding: EdgeInsets.only(
            left: Sizes.width17,
            right: Sizes.width17,
            top: Sizes.height40,
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderUtil.emptyValidator(context),
            FormBuilderUtil.emailValidator(context),
          ]),
          onChanged: (value) => _onChangeEmail(context, value),
        ),
        MyFormField(
          hint: Strings.password,
          padding: EdgeInsets.only(
            left: Sizes.width17,
            right: Sizes.width17,
            top: Sizes.height22,
          ),
          isObscure: true,
          validator: FormBuilderValidators.compose([
            FormBuilderUtil.emptyValidator(context),
            FormBuilderUtil.minLength(context),
          ]),
          onChanged: (value) => _onChangePassword(context, value),
        ),
      ],
    );
  }

  _onChangeEmail(BuildContext context, String value) {
    context.read<LoginCubit>().saveEmail(email: value);
  }

  _onChangePassword(BuildContext context, String value) {
    context.read<LoginCubit>().savePassword(password: value);
  }
}
