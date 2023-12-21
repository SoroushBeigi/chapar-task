import 'package:chapar_task/features/feature_login/data/models/user_model.dart';
import 'package:chapar_task/features/feature_login/data/sources/remote/login_api_provider.dart';
import 'package:chapar_task/features/feature_login/domain/entities/user.dart';
import 'package:chapar_task/features/feature_login/domain/repository/login_repository.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImplementation extends LoginRepository{
  LoginApiProvider apiProvider;
  LoginRepositoryImplementation({required this.apiProvider});
  @override
  Future<User> login(String email, String password) async{

      Response response = await apiProvider.login(email, password);
      if(response.statusCode==200){
        return UserModel.fromJson(response.data, 200);
      }else{
        return UserModel(status: response.statusCode,token: null);
      }
  }

  

}