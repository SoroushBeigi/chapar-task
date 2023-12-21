import 'package:chapar_task/core/data_state.dart';
import 'package:chapar_task/core/params/login_params.dart';
import 'package:chapar_task/features/feature_login/domain/entities/user.dart';

abstract class LoginRepository{
  Future<DataState<User>> login(LoginParams params);
  Future<DataState<String>> saveToken(String? param);
}