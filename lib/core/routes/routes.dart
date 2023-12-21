import 'package:chapar_task/features/feature_list/presentation/list_screen.dart';
import 'package:chapar_task/features/feature_login/presentation/login_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final routes = GoRouter(
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
  );
}
