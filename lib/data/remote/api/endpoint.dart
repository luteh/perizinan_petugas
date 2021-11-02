class Endpoint {
  const Endpoint._();

  // Accounts
  static const requestToken = '/v1/accounts/token/request';
  static const verificationCode = '/v1/accounts/forgot-password/verification-code';
  static const setNewPassword = '/v1/accounts/forgot-password/password';
}
