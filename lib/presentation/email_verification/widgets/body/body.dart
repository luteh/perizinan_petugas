import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/form_builder_util.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/core/widgets/my_form_field.dart';
import 'package:perizinan_petugas/core/widgets/my_text.dart';
import 'package:perizinan_petugas/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/code_verification/code_verification_args.dart';
import 'package:perizinan_petugas/presentation/code_verification/code_verification_page.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

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
          Form(
            key: _formKey,
            child: MyFormField(
              padding: EdgeInsets.only(
                top: Sizes.height41,
                left: Sizes.width20,
                right: Sizes.width20,
              ),
              hint: Strings.email,
              validator: FormBuilderValidators.compose([
                FormBuilderUtil.emptyValidator(context),
                FormBuilderUtil.emailValidator(context),
              ]),
            ),
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
    if (_formKey.currentState?.validate() ?? false) {
      await NavigationUtil.pushNamed(
        CodeVerificationPage.routeName,
        arguments: const CodeVerificationArgs(
          email: 'email@example.com',
        ),
      );
    }
  }
}
