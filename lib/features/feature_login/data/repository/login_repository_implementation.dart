import 'package:chapar_task/core/data_state.dart';
import 'package:chapar_task/core/params/login_params.dart';
import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/features/feature_login/data/models/user_model.dart';
import 'package:chapar_task/features/feature_login/data/sources/remote/login_api_provider.dart';
import 'package:chapar_task/features/feature_login/domain/entities/user.dart';
import 'package:chapar_task/features/feature_login/domain/repository/login_repository.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImplementation extends LoginRepository{
  LoginApiProvider apiProvider;
  LoginRepositoryImplementation({required this.apiProvider});
  @override
  Future<DataState<User>> login(LoginParams params) async{
    try{
      Response response = await apiProvider.login(params.email, params.password);
      if(response.statusCode==200){
        User user = UserModel.fromJson(response.data, 200);
        return DataSuccess(user);
      }else if(response.statusCode==401){
        return const DataFailed(Constants.wrongCredentials);
      }else{
        return const DataFailed(Constants.defaultError);
      }
  }catch(e){
    
  }
  }
}