import 'package:chapar_task/features/feature_login/domain/entities/user.dart';

abstract class LoginRepository{
  Future<User> login(String email,String password);
}