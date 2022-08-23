import 'dart:io';

import 'admin.dart';
import 'base_user.dart';
import 'user.dart';

void main() {
  var user1 = User();
  user1.username = "rahim";
  user1.password = "12345";
  user1.email = "rahim@email.com";
  user1.balance = 200;

  var user2 = User();
  var admin2 = Admin();
  // var another_user = BaseUser();

  print("Enter username:");
  String? username = stdin.readLineSync();
  print("Enter Password:");
  String? password = stdin.readLineSync();

  if (username != null && password != null) {
    user1.login(username, password);
  } else {
    print("You didn't enter the information");
  }

  user1.showProfile();

  var admin1 = Admin();
  admin1.username = "admin";
  admin1.password = "1234";
  admin1.isSuperAdmin = true;
}
