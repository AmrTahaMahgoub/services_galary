import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future saveData(String key, dynamic value) async {
    if (value is String) {
     return await sharedPreferences?.setString(key, value);
    }
    if (value is int) {
      await sharedPreferences?.setInt(key, value);
    }
    if (value is double) {
      await sharedPreferences?.setDouble(key, value);
    }
    if (value is bool) {
      await sharedPreferences?.setBool(key, value);
    }
     if (value is List) {
      await sharedPreferences?.setStringList(key, []);
    }
    
  }

  /// Get data from SharedPreferences
  static dynamic getData(dynamic key) {
    return sharedPreferences?.get(key);
  }
   static dynamic removeData(dynamic key) {
    return sharedPreferences?.remove(key);
  }
}