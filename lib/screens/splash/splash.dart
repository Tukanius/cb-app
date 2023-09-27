// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/auth/login.dart';
import 'package:bank_core/screens/main-page.dart';
// import 'package:bank_core/utils/utils.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  Timer? timer;
  bool autoLogin = true;
  String? token = "";

  // @override
  // void initState() {
  //   if (token != null) backgroundTimer();
  //   super.initState();
  // }

  @override
  afterFirstLayout(BuildContext context) async {
    // DateTime now = DateTime.now().add(Duration(minutes: expireLogOut));
    // token = await UserProvider.getAccessToken();
    // if (token != null) {
    //   String formattedDate = DateFormat('yyyy-MM-dd hh:mm:ss.000').format(now);
    //   UserProvider().setApiDateExpire(formattedDate);
    // }
    try {
      await Provider.of<GeneralProvider>(context, listen: false).init(true);
      await Provider.of<UserProvider>(context, listen: false).me(false);
      Navigator.of(context).pushNamed(MainPage.routeName);
    } catch (e) {
      print(e.toString());
      Navigator.of(context).pushNamed(LoginScreen.routeName);
    }
  }

  // checkForNewSharedLists() async {
  //   DateTime? expire;
  //   if (token != null) {
  //     expire = await UserProvider().getApiDateExpire();
  //   }
  //   token = await UserProvider.getAccessToken();

  //   if (token != null) {
  //     String formattedDate =
  //         DateFormat('yyyy-MM-dd hh:mm:ss.000').format(DateTime.now());

  //     if (expire != null) {
  //       if (DateTime.parse(formattedDate).millisecondsSinceEpoch >
  //           expire.millisecondsSinceEpoch) {
  //         timer!.cancel();

  //         if (autoLogin == true && token != null) {
  //           setState(() {
  //             autoLogin = false;
  //           });
  //           await UserProvider().auth();
  //           NotificationService().showNotification(
  //             title: "T-Wallet",
  //             body: "Та идэвхгүй 5 минут болсон тул холболт саллаа",
  //             id: 1,
  //             payLoad: "payload",
  //           );
  //           Navigator.of(context).pushReplacementNamed(SplashScreen.routeName);
  //         }
  //         Future.delayed(const Duration(milliseconds: 700), () {
  //           setState(() {
  //             autoLogin = true;
  //           });
  //         });
  //         return null;
  //       }
  //     }
  //   }
  // }

  // backgroundTimer() {
  //   if (timer != null) timer!.cancel();
  //   timer = Timer.periodic(
  //     const Duration(seconds: 2),
  //     (Timer t) => checkForNewSharedLists(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: CircularProgressIndicator(
          color: buttonColor,
        ),
      ),
    );
  }
}
