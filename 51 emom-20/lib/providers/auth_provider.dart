import 'dart:convert';

import 'package:ecom/datasources/token_datasource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  String? errorMessage;

  Future<bool> login(String username, String password) async {
    isLoading = true;
    hasError = false;
    notifyListeners();
    http.Response response = await http.post(
        Uri.parse("https://fakestoreapi.com/auth/login"),
        body: {"username": username, "password": password});
    if (response.statusCode == 200) {
      //successful login
      print(response.body);
      String token = jsonDecode(response.body)["token"];

      //
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      TokenDatasource tokenDatasource = TokenDatasource(sharedPreferences);
      return await tokenDatasource.save(token);
    } else {
      //failed login
      print("Login Failed");
      hasError = true;
      errorMessage = "Failed to login";
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return false;
  }
}
