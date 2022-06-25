import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  static const userSession = "userSession";

  Future<String?> get getUserSession async {
    final pref = await preferences;
    return pref.getString(userSession);
  }

  void setUserSession(String value) async {
    final sharedPref = await preferences;
    sharedPref.setString(userSession, value);
  }
}
