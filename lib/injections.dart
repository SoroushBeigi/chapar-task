import 'package:chapar_task/features/feature_login/data/repository/login_repository_implementation.dart';
import 'package:chapar_task/features/feature_login/data/sources/remote/login_api_provider.dart';
import 'package:chapar_task/features/feature_login/domain/repository/login_repository.dart';
import 'package:chapar_task/features/feature_login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

initialize() async {
  locator.registerSingleton<LoginApiProvider>(LoginApiProvider());

  locator.registerSingleton<LoginRepository>(LoginRepositoryImplementation(
    apiProvider: locator(),
  ));

   locator.registerSingleton<LoginBloc>(
    LoginBloc(),
  );
}
