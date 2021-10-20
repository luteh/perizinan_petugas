import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/login/bloc/login_bloc.dart';

import 'login_base_form.dart';

final formKeyLogin = GlobalKey<FormBuilderState>();

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Sizes.height31,
      ),
      child: FormBuilder(
        key: formKeyLogin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginBaseForm(
              label: Strings.usernameOrEmail,
              keyboardType: TextInputType.emailAddress,
              name: 'username',
              onChanged: (String? value) {
                context
                    .read<LoginBloc>()
                    .add(LoginEvent.saveEmail(email: value ?? ''));
              },
            ),
            SizedBox(
              height: Sizes.height17,
            ),
            LoginBaseForm(
              label: Strings.password,
              obscureText: true,
              name: 'password',
              onChanged: (String? value) {
                context
                    .read<LoginBloc>()
                    .add(LoginEvent.savePassword(password: value ?? ''));
              },
            ),
          ],
        ),
      ),
    );
  }
}
