import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setCity(String key, String? value) {
    sharedPreferences!.setString(key, value!);
    print(value);
  }

  static String getCity(String key) {
    String? city = sharedPreferences?.getString(key);
    if (city == null) return 'null';
    else
    return city ;
  }
}
