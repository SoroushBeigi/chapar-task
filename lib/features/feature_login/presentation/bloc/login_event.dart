part of 'login_bloc.dart';

@immutable
class LoginEvent {
  final LoginParams loginParams;
  const LoginEvent({required this.loginParams});
}
