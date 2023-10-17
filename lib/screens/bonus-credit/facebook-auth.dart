import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class UserFaceBookAuth extends StatefulWidget {
  static const routeName = 'UserFaceBookAuth';
  const UserFaceBookAuth({super.key});

  @override
  State<UserFaceBookAuth> createState() => _UserFaceBookAuthState();
}

class _UserFaceBookAuthState extends State<UserFaceBookAuth> {
  bool isLoggedIn = false;
  // ignore: unused_field
  Map _userObj = {};
  // ignore: unused_field
  Map<String, dynamic>? _userData;
  // ignore: unused_field
  late AccessToken _accessToken;
  bool check = true;

  checklogin() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      check = false;
    });
    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    } else {
      _login();
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken!;
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }
    setState(() {
      check = false;
    });
  }

  logout() async {
    await FacebookAuth.instance.logOut();
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ActionButton(
            onClick: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).hoverColor,
              size: 10,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Facebook холбох',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          Lottie.asset(
            'assets/lottie/facebook.json',
            height: 150,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Text('Та Facebook account-аа холбосноор 10 оноо авах юм.'),
          ),
          GestureDetector(
            onTap: () async {
              FacebookAuth.instance.login(
                  permissions: ["public_profile", "email"]).then((value) {
                FacebookAuth.instance.getUserData().then((userData) async {
                  setState(() {
                    isLoggedIn = true;
                    _userObj = userData;
                  });
                });
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: buttonColor,
              ),
              width: MediaQuery.of(context).size.width,
              height: 42,
              child: Center(
                child: Text(
                  'Холбох',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
