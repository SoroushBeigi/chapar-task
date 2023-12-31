import 'package:chapar_task/core/routes/routes.dart';
import 'package:chapar_task/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  final bool loggedIn;
  const App({required this.loggedIn, super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerConfig: Routes.routes(loggedIn),
      ),
    );
  }
}
