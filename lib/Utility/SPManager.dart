

import 'package:shared_preferences/shared_preferences.dart';

class SPManager {
  final String authToken = "authToken";
  //to save userinfo
  Future<void> setAuthToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.authToken, token);
  }

  //get auth token into shared preferences
  Future<String> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String val;
    val = (prefs.getString(this.authToken) ?? "");
    return val;
  }
}
