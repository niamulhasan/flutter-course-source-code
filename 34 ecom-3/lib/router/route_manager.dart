import 'package:ecom/pages/login_page.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';

class RouteManager {
  static final routeConfig = GoRouter(
    routes: [
      GoRoute(
        name: RouteNames.LOGIN,
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: RouteNames.HOME_PAGE,
        path: "/${RouteNames.HOME_PAGE}",
        builder: (context, state) => const HomePage(),
      )
    ],
  );
}

abstract class RouteNames {
  static String LOGIN = '/';
  static String HOME_PAGE = 'homePage';
}
