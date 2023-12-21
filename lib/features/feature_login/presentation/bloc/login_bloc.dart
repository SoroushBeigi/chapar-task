import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chapar_task/core/data_state.dart';
import 'package:chapar_task/core/params/login_params.dart';
import 'package:chapar_task/features/feature_login/domain/usecases/login_usecase.dart';
import 'package:chapar_task/features/feature_login/presentation/bloc/login_status.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc({required this.loginUsecase})
      : super(LoginState(loginStatus: LoginLoading())) {
    on<LoginEvent>(_login);
  }

  Future<void> _login(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(newStatus: LoginLoading()));
    DataState dataState = await loginUsecase(event.loginParams);

    if (dataState is DataSuccess) {
      emit(state.copyWith(newStatus: LoginCompleted(user: dataState.data)));
    }
    if (dataState is DataFailed) {
      emit(state.copyWith(newStatus: LoginError(error: dataState.error!)));
    }
  }
}
