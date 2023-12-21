part of 'login_bloc.dart';

//I'm using enums to make the code more readable, we may have more than 2 fields later!
enum FieldType {email, password }

class LoginEvent {}

class LoginButtonEvent extends LoginEvent {
  final LoginParams loginParams;
  LoginButtonEvent({required this.loginParams});
}

class FieldChangedEvent extends LoginEvent {
  final FieldType fieldType;
  final String value;
  FieldChangedEvent({required this.fieldType, required this.value});
}
