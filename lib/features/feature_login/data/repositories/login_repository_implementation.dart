import 'package:chapar_task/core/data_state.dart';
import 'package:chapar_task/core/params/login_params.dart';
import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/features/feature_login/data/models/user_model.dart';
import 'package:chapar_task/core/services/storage_service.dart';
import 'package:chapar_task/features/feature_login/data/sources/remote/login_api_provider.dart';
import 'package:chapar_task/features/feature_login/domain/entities/user.dart';
import 'package:chapar_task/features/feature_login/domain/repository/login_repository.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImplementation extends LoginRepository{
  final LoginApiProvider apiProvider;
  final StorageService storageProvider;
  LoginRepositoryImplementation({required this.apiProvider,required this.storageProvider});

  @override
  Future<DataState<User>> login(LoginParams params) async{
    try{
      Response response = await apiProvider.login(params.email, params.password);
        User user = UserModel.fromJson(response.data, 200);
        return DataSuccess(user);
     
  }on DioException catch(e){
    if(e.response!.statusCode==401){
      return const DataFailed(Constants.wrongCredentials);
    }
    return const DataFailed(Constants.defaultError);
    // ... 
    // More Dio exceptions can be added here, 
    // But in our case these two are the only problems that can happen.
  }
  }
  
  @override
  Future<DataState<String>> saveToken(String? param)async {
    if(param!=null){
      storageProvider.saveToken(param);
      return const DataSuccess('Saved');
    }
    return const DataFailed('No token found!');
  }
}