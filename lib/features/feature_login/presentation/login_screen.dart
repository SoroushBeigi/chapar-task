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

  String email = '';
  String password = '';

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController.addListener(() {
      BlocProvider.of<LoginBloc>(context).add(FieldChangedEvent(fieldType: FieldType.email,value: _emailController.text.trim()));
    });
    _passwordController.addListener(() {
      BlocProvider.of<LoginBloc>(context).add(FieldChangedEvent(fieldType: FieldType.password,value: _passwordController.text.trim()));
    });
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
            listenWhen: (previous, current) => previous.loginStatus!=current.loginStatus,
        buildWhen: (previous, current) =>
            previous.loginStatus != current.loginStatus || previous.canLogin != current.canLogin,
        listener: (context, state) {
          if(state.loginStatus is LoginError){
            //Showing errors whenever the state's status changes to LoginError
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text((state.loginStatus as LoginError).error)));
          }
        },
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
                //if canLogin is false, the ElevatedButton will be disabled until both fields are non-empty
                onPressed:bloc.canLogin? () => bloc.add(
                  LoginButtonEvent(
                    loginParams: LoginParams(
                        email: _emailController.text.trim(),
                        password: _passwordController.text),
                  ),
                ) : null,
                child: Builder(builder: (context) {
                  //Loading different widgets based on the state (loading or not!)
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
