import 'base_user.dart';

class Admin extends BaseUser {
  bool? isSuperAdmin;

  Admin(
      String? username, String? password, String? email, bool this.isSuperAdmin)
      : super(username, password, email);

  void createProduct() {
    print("Createing product");
  }

  void deleteAccount() {
    print("Delete Admin Account");
  }
}
