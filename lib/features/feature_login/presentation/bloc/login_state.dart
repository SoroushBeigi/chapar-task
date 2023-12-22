part of 'login_bloc.dart';
class LoginState {
  final LoginStatus loginStatus;
  final bool canLogin;
  const LoginState({required this.loginStatus,required this.canLogin});

  LoginState copyWith({LoginStatus? newStatus,bool? newCanLogin}) {
    return LoginState(
      loginStatus: newStatus ?? loginStatus,
      canLogin: newCanLogin ?? canLogin,
    );
  }
}

