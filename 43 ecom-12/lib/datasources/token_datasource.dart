import 'package:ecom/core/constaints/shared_preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenDatasource {
  late SharedPreferences _preferences;

  TokenDatasource(this._preferences);

  Future<bool> save(String token) async {
    bool isTokenSaved =
        await _preferences.setString(SharedPreferenceKeys.TOKEN, token);
    if (isTokenSaved) {
      return true;
    }
    return false;
  }

  String? get() {
    return _preferences.getString(SharedPreferenceKeys.TOKEN);
  }

  Future<bool> delete() async {
    return await _preferences.remove(SharedPreferenceKeys.TOKEN);
  }
}
