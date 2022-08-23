import 'base_user.dart';

class Admin extends BaseUser {
  bool? isSuperAdmin;

  void createProduct() {
    print("Createing product");
  }

  void deleteAccount() {
    print("Delete Admin Account");
  }
}
