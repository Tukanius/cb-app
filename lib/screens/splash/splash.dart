import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/auth/login.dart';
import 'package:bank_core/screens/main-page.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  afterFirstLayout(BuildContext context) async {
    try {
      await Provider.of<GeneralProvider>(context, listen: false).init(true);
      print('1');
      await Provider.of<UserProvider>(context, listen: false).me(true);
      print('2');
      Navigator.of(context).pushNamed(MainPage.routeName);
    } catch (e) {
      print('=======err======');
      print(e.toString());
      print('=======err======');
      Navigator.of(context).pushNamed(LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
