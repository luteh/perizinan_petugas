import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/form_builder_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_form_field.dart';
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
            MyFormField(
              hint: Strings.kataSandiLama,
              isObscure: true,
              validator: FormBuilderValidators.compose([
                FormBuilderUtil.emptyValidator(context),
                FormBuilderUtil.minLength(context),
              ]),
              onChanged: (value) => _onChangeOldPassword(context, value),
            ),
          MyFormField(
            hint: Strings.kataSandiBaru,
            isObscure: true,
            padding: _isLoggedIn
                ? EdgeInsets.only(
                    top: Sizes.height15,
                  )
                : EdgeInsets.zero,
            validator: FormBuilderValidators.compose([
              FormBuilderUtil.emptyValidator(context),
              FormBuilderUtil.minLength(context),
            ]),
            onChanged: (value) => _onChangeNewPassword(context, value),
          ),
          BlocSelector<ChangePasswordCubit, ChangePasswordState, String>(
            selector: (state) {
              return state.newPassword;
            },
            builder: (context, state) {
              return MyFormField(
                hint: Strings.konfirmasiKataSandiBaru,
                isObscure: true,
                padding: EdgeInsets.only(
                  top: Sizes.height15,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderUtil.emptyValidator(context),
                  FormBuilderUtil.minLength(context),
                  FormBuilderUtil.equal(context, state),
                ]),
                onChanged: (value) =>
                    _onChangeNewPasswordConfirmation(context, value),
              );
            },
          ),
        ],
      ),
    );
  }

  _onChangeOldPassword(BuildContext context, String value) {
    context.read<ChangePasswordCubit>().saveOldPassword(value);
  }

  _onChangeNewPassword(BuildContext context, String value) {
    context.read<ChangePasswordCubit>().saveNewPassword(value);
  }

  _onChangeNewPasswordConfirmation(BuildContext context, String value) {
    context.read<ChangePasswordCubit>().saveNewPasswordConfirmation(value);
  }
}
