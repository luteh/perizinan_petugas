part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.saveEmail({required String email}) = _SaveEmail;
  const factory LoginEvent.savePassword({required String password}) = _SavePassword;
  const factory LoginEvent.doLogin() = _DoLogin;
}