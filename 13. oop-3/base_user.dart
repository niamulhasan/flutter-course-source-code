abstract class BaseUser {
  String? username;
  String? password;
  String? email;
  bool isLoggedIn = false;

  BaseUser(String? this.username, String? this.password, String? this.email);

  void login(String username, String password) {
    if (this.username == username && this.password == password) {
      isLoggedIn = true;
      print("Login Successful");
    } else {
      print("Login failed");
    }
  }

  void logout() {
    print("Logging out $username");
    isLoggedIn = false;
  }

  void deleteAccount();
}
