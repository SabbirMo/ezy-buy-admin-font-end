import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> storeToken(String value) async {
    await _prefs?.setString(ConstantSharedUtils.tokenKey, value);
  }

  // Read-only methods remain synchronous
  static String getToken() => _prefs?.getString(ConstantSharedUtils.tokenKey) ?? "";

  static Future<void> removerSharePrefData() async {
    await _prefs?.clear();
  }
}

class ConstantSharedUtils {
  static String tokenKey = "tokenKey";
}
