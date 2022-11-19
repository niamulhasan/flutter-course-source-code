import 'package:go_router/go_router.dart';
import 'package:routing_with_go_routuer/pages/home_page.dart';
import 'package:routing_with_go_routuer/pages/second_page.dart';
import 'package:routing_with_go_routuer/pages/third_page.dart';

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
              path: 'secondPage/:name',
              builder: (context, state) =>
                  SecondPage(name: state.params["name"]!),
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
