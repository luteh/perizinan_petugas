class Endpoint {
  const Endpoint._();

  // Accounts
  static const refreshToken = '/accounts/token/refresh';
  static const requestToken = '/accounts/token/request';
  static const verificationCode = '/accounts/forgot-password/verification-code';
  static const setNewPassword = '/accounts/forgot-password/password';
  static const getProfile = '/admins/accounts/profile';
  static const updatePassword = '/accounts/profile/password';
}
