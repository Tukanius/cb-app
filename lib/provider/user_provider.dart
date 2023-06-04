import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/auth.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  final DefaultCacheManager cacheManager = DefaultCacheManager();

  User user = User();

  me(bool handler) async {
    user = await AuthApi().me(handler);
    print(user.toJson());
    notifyListeners();
  }

  login(User data) async {
    User res = await AuthApi().login(data);
    print(res.accessToken);
    await setAccessToken(res.accessToken);
  }

  bankAccount(User data) async {
    await AuthApi().bankAccount;
  }

  setUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("USERNAME", username);
  }

  isOriginal(User data) async {
    await AuthApi().isOriginal;
  }

  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString("USERNAME");
    return username;
  }

  setDeviceToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("DEVICE_TOKEN", token);
  }

  static Future<String?> getDeviceToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("DEVICE_TOKEN");
    return token;
  }

  register(User data) async {
    User res = await AuthApi().register(data);
    await setAccessToken(res.accessToken);
    return res;
  }

  logout() async {
    user = User();
    await AuthApi().logout();
    clearAccessToken();
    notifyListeners();
  }

  setAccessToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null) prefs.setString("ACCESS_TOKEN", token);
  }

  setSessionScope(String? sessionScope) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (sessionScope != null) prefs.setString("SESSION_SCOPE", sessionScope);
  }

  static Future<String?> getSessionScope() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sessionScope = prefs.getString("SESSION_SCOPE");

    return sessionScope;
  }

  clearSessionScopen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("SESSION_SCOPE");
  }

  clearAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("ACCESS_TOKEN");
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("ACCESS_TOKEN");

    return token;
  }
}
