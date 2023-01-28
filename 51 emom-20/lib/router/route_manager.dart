import 'package:ecom/models/product_model.dart';
import 'package:ecom/pages/details_page/ui/details_page.dart';
import 'package:ecom/pages/login_page.dart';
import 'package:ecom/pages/main_page/ui/main_page.dart';
import 'package:ecom/router/middlewares/auth_middleware.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';

class RouteManager {
  static final routeConfig = GoRouter(
    routes: [
      GoRoute(
          name: RouteNames.MAIN_PAGE,
          path: RouteNames.MAIN_PAGE,
          builder: (context, state) => const MainPage(),
          redirect: (context, state) => AuthMiddleware.guardWithLogin(),
          routes: [
            GoRoute(
              name: RouteNames.DETAILS,
              path: RouteNames.DETAILS,
              builder: (context, state) =>
                  DetailsPage(product: state.extra as ProductModel),
            )
          ]),
      GoRoute(
        name: RouteNames.LOGIN,
        path: RouteNames.LOGIN,
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}

abstract class RouteNames {
  static String MAIN_PAGE = '/main';
  static String LOGIN = '/';
  static String DETAILS = 'details';
}
