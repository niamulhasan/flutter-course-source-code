import 'package:go_router/go_router.dart';
import 'package:go_router_new_test/pages/home_page.dart';
import 'package:go_router_new_test/pages/second_page.dart';
import 'package:go_router_new_test/pages/third_page.dart';

class RouteManager {
  static final routeConfig = GoRouter(
    routes: [
      GoRoute(
          name: RouteNames.HOME,
          path: '/',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              name: RouteNames.SECOND_PAGE,
              path: 'secondPage',
              builder: (context, state) =>
                  SecondPage(name: state.uri.queryParameters["naam"]!),
            ),
            GoRoute(
              name: RouteNames.THIRD_PAGE,
              path: 'thirdPage',
              builder: (context, state) => const ThirdPage(),
            )
          ])
    ],
  );
}

class RouteNames {
  static String HOME = '/';
  static String SECOND_PAGE = 'secondPage';
  static String THIRD_PAGE = 'thirdPage';
}
