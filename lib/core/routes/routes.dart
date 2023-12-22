import 'package:chapar_task/features/feature_list/presentation/screens/list_screen.dart';
import 'package:chapar_task/features/feature_login/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static routes(bool loggedIn){return GoRouter(
    initialLocation: loggedIn?'/list':'/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/list',
        builder: (context, state) => const ListScreen(),
      ),
    ],
  );}
}
