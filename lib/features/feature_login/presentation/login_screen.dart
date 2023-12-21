import 'package:chapar_task/core/params/login_params.dart';
import 'package:chapar_task/core/widgets/snackbar.dart';
import 'package:chapar_task/features/feature_login/presentation/bloc/login_bloc.dart';
import 'package:chapar_task/features/feature_login/presentation/bloc/login_status.dart';
import 'package:chapar_task/features/feature_login/presentation/widgets/field.dart';
import 'package:chapar_task/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
  const _LoginScreen();

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
    _emailController.addListener(() {
      BlocProvider.of<LoginBloc>(context).add(FieldChangedEvent(
          fieldType: FieldType.email, value: _emailController.text.trim()));
    });
    _passwordController.addListener(() {
      BlocProvider.of<LoginBloc>(context).add(FieldChangedEvent(
          fieldType: FieldType.password,
          value: _passwordController.text.trim()));
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
      body: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (previous, current) =>
            previous.loginStatus != current.loginStatus,
        buildWhen: (previous, current) =>
            previous.loginStatus != current.loginStatus ||
            previous.canLogin != current.canLogin,
        listener: (context, state) {
          if (state.loginStatus is LoginError) {
            //Showing errors whenever the state's status changes to LoginError
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                  type: SnackbarType.error,
                  text: (state.loginStatus as LoginError).error),
            );
          }

          //Going to the next page, whenever the LoginCompleted status emitted
          if (state.loginStatus is LoginCompleted) {
            context.pushReplacement('/list');
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: Card(
                color: Colors.white,
                child: SizedBox(
                  height: 47.h,
                  width: 80.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              maxRadius: 10.w,
                              //The most relevant Icon I could find =)
                              child: Icon(Icons.delivery_dining_rounded,
                                  size: 17.w, color: Colors.white)),
                        ),
                        Field(
                          controller: _emailController,
                          hint: 'Enter your email',
                          prefixIconData: Icons.email,
                          isObscure: false,
                        ),
                        SizedBox(height: 1.h,),
                        Field(
                          controller: _passwordController,
                          hint: 'Enter your password',
                          isObscure: true,
                          prefixIconData: Icons.password,
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          height: 7.h,
                          width: 32.w,
                          child: ElevatedButton(
                            //if canLogin is false, the ElevatedButton will be disabled until both fields are non-empty
                            onPressed: bloc.canLogin
                                ? () => bloc.add(
                                      LoginButtonEvent(
                                        loginParams: LoginParams(
                                            email: _emailController.text.trim(),
                                            password: _passwordController.text),
                                      ),
                                    )
                                : null,
                            child: Builder(builder: (context) {
                              //Loading different widgets based on the state (loading or not!)
                              if (state.loginStatus is LoginLoading) {
                                return SizedBox(
                                    height: 4.h,
                                    width: 4.h,
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ));
                              } else {
                                return const Text('Login');
                              }
                            }),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
