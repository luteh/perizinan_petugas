import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderUtil {
  const FormBuilderUtil._();

  static FormFieldValidator emptyValidator(BuildContext context) =>
      FormBuilderValidators.required(context, errorText: 'Harap diisi');

  static FormFieldValidator minAmountValidator(BuildContext context) =>
      FormBuilderValidators.min(
        context,
        10000,
        errorText: "Minimal jumlah pengajuan Rp10.000",
      );

  static FormFieldValidator<String> emailValidator(BuildContext context) =>
      FormBuilderValidators.email(context, errorText: 'Email tidak valid');

  static FormFieldValidator<String> minLength(
    BuildContext context, {
    int minLength = 6,
  }) =>
      FormBuilderValidators.minLength(
        context,
        minLength,
        errorText: 'Minimal $minLength karakter',
      );

  static FormFieldValidator<String> equal(BuildContext context, String value) =>
      FormBuilderValidators.equal(
        context,
        value,
        errorText: 'Tidak sama',
      );
}
