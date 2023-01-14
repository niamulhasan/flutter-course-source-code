import 'dart:async';

import 'package:ecom/core/constaints/shared_preference_keys.dart';
import 'package:ecom/datasources/token_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route_manager.dart';

class AuthMiddleware {
  static FutureOr<String?> guardWithLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    TokenDatasource tokenDatasource = TokenDatasource(sharedPreferences);

    if ((await tokenDatasource.get()) == null) {
      return Future.value(RouteNames.LOGIN);
    }
    return null;
  }
}
