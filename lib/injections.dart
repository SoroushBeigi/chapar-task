import 'package:chapar_task/features/feature_delivery/presentation/bloc/delivery_bloc.dart';
import 'package:chapar_task/features/feature_list/data/repositories/list_repository_implementation.dart';
import 'package:chapar_task/features/feature_list/data/sources/remote/list_api_provider.dart';
import 'package:chapar_task/features/feature_list/domain/repository/list_repository.dart';
import 'package:chapar_task/features/feature_list/domain/usecases/load_list_usecase.dart';
import 'package:chapar_task/features/feature_list/presentation/bloc/list_bloc.dart';
import 'package:chapar_task/features/feature_login/data/repositories/login_repository_implementation.dart';
import 'package:chapar_task/core/services/storage_service.dart';
import 'package:chapar_task/features/feature_login/data/sources/remote/login_api_provider.dart';
import 'package:chapar_task/features/feature_login/domain/repository/login_repository.dart';
import 'package:chapar_task/features/feature_login/domain/usecases/login_usecase.dart';
import 'package:chapar_task/features/feature_login/domain/usecases/save_token_usecase.dart';
import 'package:chapar_task/features/feature_login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

initialize() async {
  //Data Providers
  locator.registerSingleton<LoginApiProvider>(LoginApiProvider());
  locator.registerSingleton<ListApiProvider>(ListApiProvider());
  locator.registerSingleton<StorageService>(StorageService());

  //Repositories
  locator.registerSingleton<LoginRepository>(LoginRepositoryImplementation(
      apiProvider: locator(), storageService: locator()));
  locator.registerSingleton<ListRepository>(ListRepositoryImplementation(
      apiProvider: locator(), storageService: locator()));

  //Usecases
  locator.registerSingleton<LoginUsecase>(
      LoginUsecase(loginRepository: locator()));
  locator.registerSingleton<SaveTokenUsecase>(
      SaveTokenUsecase(loginRepository: locator()));
  locator.registerSingleton<LoadListUsecase>(
      LoadListUsecase(listRepository: locator()));

  //Blocs
  locator.registerSingleton<LoginBloc>(
    LoginBloc(loginUsecase: locator(), saveTokenUsecase: locator()),
  );
  locator.registerSingleton<ListBloc>(ListBloc(
    loadListUsecase: locator(),
  ));
  locator.registerSingleton<DeliveryBloc>(DeliveryBloc());
}
