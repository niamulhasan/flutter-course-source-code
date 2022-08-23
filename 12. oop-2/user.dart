import 'base_user.dart';

class User extends BaseUser {
  int? balance;

  void showProfile() {
    print("Profile of $username \n Email: $email");
  }

  void buyProduct() {
    print("Buying product");
  }

  void deleteAccount() {
    print("Deleting user account");
  }
}
