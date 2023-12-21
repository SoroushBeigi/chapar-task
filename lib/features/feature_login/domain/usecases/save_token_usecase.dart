import 'package:chapar_task/core/data_state.dart';
import 'package:chapar_task/core/usecase/usecase.dart';
import 'package:chapar_task/features/feature_login/domain/repository/login_repository.dart';

class SaveTokenUsecase extends Usecase<DataState<String>, String?> {
  final LoginRepository loginRepository;
  SaveTokenUsecase({required this.loginRepository});

  @override
  Future<DataState<String>> call(String? param) =>
      loginRepository.saveToken(param);
}
