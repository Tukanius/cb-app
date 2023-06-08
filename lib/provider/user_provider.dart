import 'package:bank_core/api/auth-api.dart';
import 'package:bank_core/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  final DefaultCacheManager cacheManager = DefaultCacheManager();

  User user = User();
  bool isView = false;

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
    User res = await AuthApi().register(data);
    setAccessToken(res.accessToken);
    return res;
  }
}
