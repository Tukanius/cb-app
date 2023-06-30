import 'package:bank_core/api/auth-api.dart';
import 'package:bank_core/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  User user = User();
  bool isView = false;
  bool check = false;

  //
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool value) {
    themeMode = value ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  toggleDarkMode(value) {
    check = value;
    notifyListeners();
  }
//

  static Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("ACCESS_TOKEN");

    return token;
  }

  setView(value) {
    isView = value;
    notifyListeners();
  }

  me(bool handler) async {
    user = await AuthApi().me(handler);
    notifyListeners();
  }

  login(User data) async {
    user = await AuthApi().login(data);
    setAccessToken(user.accessToken);
    notifyListeners();
  }

  setAccessToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null) prefs.setString("ACCESS_TOKEN", token);
  }

  clearAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("ACCESS_TOKEN");
  }

  logout() async {
    user = User();
    clearAccessToken();
  }

  register(User data) async {
    user = await AuthApi().register(data);
    setAccessToken(user.accessToken);
    return user;
  }

  getOtp() async {
    User res = await AuthApi().getOtp();
    await setAccessToken(res.accessToken);
    return res;
  }

  forgot(User data) async {
    User res = await AuthApi().forgot(data);
    await setAccessToken(res.accessToken);
    return res;
  }
}
