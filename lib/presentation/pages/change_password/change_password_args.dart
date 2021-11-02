class ChangePasswordArgs {
  final String? email;
  final String? verificationCode;

  ChangePasswordArgs({
    required this.email,
    required this.verificationCode,
  });
}
