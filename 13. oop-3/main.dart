import 'dart:io';

import 'admin.dart';
import 'base_user.dart';
import 'user.dart';

void main() {
  var user1 = User("rahim", "12345", "rahim@email.com", 200);

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

  var admin1 = Admin("admin", "12345", "admin@emai.com", true);
}
