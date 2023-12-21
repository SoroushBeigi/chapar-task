import 'package:chapar_task/core/data_state.dart';
import 'package:chapar_task/core/params/login_params.dart';
import 'package:chapar_task/core/usecase/usecase.dart';
import 'package:chapar_task/features/feature_login/domain/entities/user.dart';
import 'package:chapar_task/features/feature_login/domain/repository/login_repository.dart';

class LoginUsecase extends Usecase<DataState<User>, LoginParams> {
  final LoginRepository loginRepository;

  LoginUsecase({required this.loginRepository});

  @override
  Future<DataState<User>> call(LoginParams param) =>
      loginRepository.login(param);
}
