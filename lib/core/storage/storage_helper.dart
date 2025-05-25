import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future saveData(String key, dynamic value) async {
    if (value is String) {
      await sharedPreferences.setString(key, value);
    }
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
    }
    if (value is int) {
      await sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
    }
  }

  static  dynamic getData(String key) async {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData(String key) async {
   return await sharedPreferences.remove(key);
  }

  static Future<bool> clearData() async {
   return await sharedPreferences.clear();
  }
}
