import 'package:chapar_task/core/params/login_params.dart';
import 'package:chapar_task/features/feature_login/presentation/bloc/login_bloc.dart';
import 'package:chapar_task/features/feature_login/presentation/bloc/login_status.dart';
import 'package:chapar_task/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<LoginBloc>(),
      child: const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen({super.key});

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: Center(
          child: BlocConsumer<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
            previous.loginStatus != current.loginStatus,
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              TextField(
                controller: _emailController,
              ),
              TextField(
                controller: _passwordController,
              ),
              ElevatedButton(
                onPressed: () => bloc.add(
                  LoginEvent(
                    loginParams: LoginParams(
                        email: _emailController.text.trim(),
                        password: _passwordController.text),
                  ),
                ),
                child: Builder(builder: (context) {
                  if(state.loginStatus is LoginLoading){
                    return const CircularProgressIndicator();
                  }else{
                    return const Text('Login');
                  }
                }),
              ),
            ],
          );
        },
      )),
    );
  }
}
