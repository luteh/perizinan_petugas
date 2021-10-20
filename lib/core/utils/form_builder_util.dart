import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderUtil {
  const FormBuilderUtil._();

  static FormFieldValidator emptyValidator(BuildContext context) =>
      FormBuilderValidators.required(
        context,
      );

  static FormFieldValidator minAmountValidator(BuildContext context) =>
      FormBuilderValidators.min(
        context,
        10000,
        errorText: "Minimal jumlah pengajuan Rp10.000",
      );

  static FormFieldValidator<String> emailValidator(BuildContext context) =>
      FormBuilderValidators.email(
        context,
      );
}
