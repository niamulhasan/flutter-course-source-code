import '../route_manager.dart';

class AuthMiddleware {
  static guardWithLogin() {
    //if user is alredy loggedin
    if (false) {
      return RouteNames.HOME_PAGE;
    }
    //if user is not loggedin
    return RouteNames.LOGIN;
  }
}
