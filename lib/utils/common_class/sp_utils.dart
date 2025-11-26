import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<String?> getSpStringValue({required String key}) async {
    final prefs = _prefs ??= await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

// String? value = await SpUtils.getSpValue(key: 'yourKey');
// savedValue = await SpUtils.getSpValue(key: 'yourKey');