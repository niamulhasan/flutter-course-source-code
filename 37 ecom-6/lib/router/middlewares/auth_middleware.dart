import 'dart:async';

import 'package:ecom/core/constaints/shared_preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route_manager.dart';

class AuthMiddleware {
  static FutureOr<String> guardWithLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString(SharedPreferenceKeys.TOKEN);
    print(token);
    if (token == null) {
      return Future.value(RouteNames.LOGIN);
    }
    return RouteNames.HOME_PAGE;
  }
}
