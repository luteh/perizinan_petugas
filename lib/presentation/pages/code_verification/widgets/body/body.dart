import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/form_builder_util.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/core/utils/theme_util.dart';
import 'package:perizinan_petugas/domain/core/unions/failure.dart';
import 'package:perizinan_petugas/presentation/core/base_widget_class.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';
import 'package:perizinan_petugas/presentation/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/pages/change_password/change_password_args.dart';
import 'package:perizinan_petugas/presentation/pages/change_password/change_password_page.dart';
import 'package:perizinan_petugas/presentation/pages/code_verification/cubit/code_verification_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with BaseWidgetClass {
  final _formKey = GlobalKey<FormState>();
  final _endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 300;
  CountdownTimerController? _timerController;

  @override
  void initState() {
    _timerController = CountdownTimerController(endTime: _endTime);
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _timerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CodeVerificationCubit, CodeVerificationState>(
      listenWhen: (previous, current) =>
          previous.verifyCodeResult != current.verifyCodeResult,
      listener: (context, state) {
        state.verifyCodeResult.maybeWhen(
          loading: () {
            showLoadingDialog();
          },
          error: (failure) {
            dismissDialog();
            showFlushbar(context, null, Failure.getErrorMessage(failure));
          },
          success: (data) async {
            dismissDialog();
            await NavigationUtil.pushNamed(ChangePasswordPage.routeName,
                arguments: ChangePasswordArgs(
                  email: state.args.email,
                  verificationCode: state.verificationCode,
                ));
          },
          orElse: () => null,
        );
      },
      child: Column(
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
            child: Form(
              key: _formKey,
              child: PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                animationDuration: ThemeUtil.shortAnimationDuration,
                onChanged: (value) => _onChangeCode(context, value),
                appContext: context,
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderUtil.emptyValidator(context),
                  FormBuilderUtil.minLength(
                    context,
                    minLength: 4,
                  ),
                ]),
              ),
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
          BlocListener<CodeVerificationCubit, CodeVerificationState>(
            listenWhen: (previous, current) =>
                previous.requestVerificationCodeResult !=
                current.requestVerificationCodeResult,
            listener: (context, state) {
              state.requestVerificationCodeResult.maybeWhen(
                loading: () {
                  showLoadingDialog();
                },
                error: (failure) {
                  dismissDialog();
                  showFlushbar(context, null, Failure.getErrorMessage(failure));
                },
                success: (data) async {
                  dismissDialog();
                  _timerController?.start();
                },
                orElse: () => null,
              );
            },
            child: CountdownTimer(
              endTime: _endTime,
              controller: _timerController,
              endWidget: MyText(
                text: Strings.kirimUlang,
                fontWeight: FontWeight.bold,
                color: ColorPalettes.darkBlue,
                onTap: () => _onTapKirimUlang(context),
              ),
              widgetBuilder: (context, time) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: Strings.descResentCode,
                      fontWeight: FontWeight.bold,
                      color: ColorPalettes.textGrey,
                    ),
                    MyText(
                      text: '${time?.min}:${time?.sec}',
                      fontWeight: FontWeight.bold,
                      color: ColorPalettes.darkBlue,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _onPressBerikutnya(BuildContext context) async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    context.read<CodeVerificationCubit>().verifyCode();
  }

  _onChangeCode(BuildContext context, String value) {
    context
        .read<CodeVerificationCubit>()
        .saveVerificationCode(verificationCode: value);
  }

  _onTapKirimUlang(BuildContext context) {
    context.read<CodeVerificationCubit>().requestVerificationCode();
  }
}
