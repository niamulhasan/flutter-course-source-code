class User {
  static String? userName = "hasan";
  static String? password = "123";
  static String? email = "hasan@email.com";

  static bool login(String uName, String pass) {
    if (uName == userName && pass == password) {
      return true;
    }
    return false;
  }

  static bool logout() {
    print("user logging out");
    return true;
  }
}
