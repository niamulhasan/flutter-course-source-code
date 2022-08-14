import 'dart:io';
import 'user.dart';

void main() {
  print("Input your username: ");
  String? userNameInput = stdin.readLineSync();
  print("Input Your Password: ");
  String? userPasswordInput = stdin.readLineSync();
  bool hasSucceedLogin = User.login(userNameInput!, userPasswordInput!);

  if (hasSucceedLogin) {
    print("Login Successfull");
  } else {
    print("Login Failed");
  }
}
