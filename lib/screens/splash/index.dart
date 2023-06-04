import 'package:bank_core/models/user.dart';
import 'package:bank_core/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:bank_core/screens/main/main_page.dart';
import 'package:provider/provider.dart';
import '../../provider/user_provider.dart';
import '../../provider/general_provider.dart';

class SplashPage extends StatefulWidget {
  static const routeName = "/SplashPage";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with AfterLayoutMixin<SplashPage> {
  User user = User();
  @override
  void afterFirstLayout(BuildContext context) async {
    try {
      await Provider.of<GeneralProvider>(context, listen: false).init(false);
      await Provider.of<UserProvider>(context, listen: false).me(false);
      await Navigator.of(context).pushReplacementNamed(MainPage.routeName);
    } catch (e) {
      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
      print('====================ERROR============');
      print(e.toString());
      print('====================ERROR============');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
    );
  }
}
