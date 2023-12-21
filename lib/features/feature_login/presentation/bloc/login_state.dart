part of 'login_bloc.dart';
class LoginState {
  final LoginStatus loginStatus;
  const LoginState({required this.loginStatus});

  LoginState copyWith({LoginStatus? newStatus}) {
    return LoginState(
      loginStatus: newStatus ?? loginStatus,
    );
  }
}
