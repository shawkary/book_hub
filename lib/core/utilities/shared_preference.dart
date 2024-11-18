import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static saveList(String key, List<String> value) async {
    await prefs.setStringList(key, value);
  }

  static getList({
    required String key,
  }) {
    return prefs.getStringList(key);
  }

  static removeData()async {
    return await prefs.clear();
  }
}
