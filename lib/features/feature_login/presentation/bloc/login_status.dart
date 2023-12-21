import 'package:chapar_task/features/feature_login/domain/entities/user.dart';

abstract class LoginStatus {}

class LoginLoading extends LoginStatus {}

class LoginCompleted extends LoginStatus {
  final User user;
  LoginCompleted({required this.user});
}

class LoginError extends LoginStatus {
  final String error;
  LoginError({required this.error});
}
