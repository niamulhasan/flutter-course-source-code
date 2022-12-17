import 'package:ecom/pages/login_page.dart';
import 'package:ecom/router/middlewares/auth_middleware.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';

class RouteManager {
  static final routeConfig = GoRouter(
    routes: [
      GoRoute(
        name: RouteNames.HOME_PAGE,
        path: "/",
        builder: (context, state) => const HomePage(),
        redirect: (context, state) => AuthMiddleware.guardWithLogin(),
      ),
      GoRoute(
        name: RouteNames.LOGIN,
        path: RouteNames.LOGIN,
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}

abstract class RouteNames {
  static String HOME_PAGE = '/';
  static String LOGIN = '/login';
}
