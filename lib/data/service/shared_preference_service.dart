import 'package:jelajah/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  Future<bool> get isAuthenticated async {
    final pref = await preferences;
    return pref.getBool("Authenticated") ?? false;
  }

  void setAuthenticated(bool value) async {
    final sharedPref = await preferences;
    sharedPref.setBool("Authenticated", value);
  }

  Future<int> get userSession async {
    final pref = await preferences;
    return pref.getInt("UserSession") ?? 0;
  }

  void setUserSession(int value) async {
    final sharedPref = await preferences;
    Constant.userSession = value;
    sharedPref.setInt("UserSession", value);
  }
}
