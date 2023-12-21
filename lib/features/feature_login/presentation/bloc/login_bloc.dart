import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:chapar_task/core/data_state.dart';
import 'package:chapar_task/core/params/login_params.dart';
import 'package:chapar_task/features/feature_login/domain/usecases/login_usecase.dart';
import 'package:chapar_task/features/feature_login/presentation/bloc/login_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc({required this.loginUsecase})
      : super(LoginState(loginStatus: LoginInitial(), canLogin: false)) {
    on<LoginButtonEvent>(_login);
    on<FieldChangedEvent>(_onFieldChanged);
  }

  String email = '';
  String password = '';
  bool canLogin = false;

  Future<void> _login(LoginButtonEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(newStatus: LoginLoading()));
    DataState dataState = await loginUsecase(event.loginParams);
    if (dataState is DataSuccess) {
      emit(state.copyWith(newStatus: LoginCompleted(user: dataState.data)));
    }
    if (dataState is DataFailed) {
      emit(state.copyWith(newStatus: LoginError(error: dataState.error!)));
    }
  }

  void _onFieldChanged(FieldChangedEvent event, Emitter<LoginState> emit) {
    if (event.fieldType == FieldType.email) {
      email = event.value;
    }
    if (event.fieldType == FieldType.password) {
      password = event.value;
    }
    if (email.isNotEmpty && password.isNotEmpty) {
      canLogin = true;
    } else {
      canLogin = false;
    }
    emit(state.copyWith(newCanLogin: canLogin));

    //...
    //More fields can be added easily!
  }
}
