import 'dart:async';
import 'package:bank_core/api/auth-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/profile-page/change-password/change-password.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';

class OtpVerifyPageArguments {
  String? username;
  User? data;
  OtpVerifyPageArguments({
    this.data,
    this.username,
  });
}

class OtpVerifyPage extends StatefulWidget {
  final User? data;
  static const routeName = 'OtpVerifyPage';
  final String? username;
  const OtpVerifyPage({
    Key? key,
    this.username,
    this.data,
  }) : super(key: key);

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> with AfterLayoutMixin {
  int _counter = 120;
  TextEditingController controller = TextEditingController();
  bool isGetCode = false;
  bool isSubmit = false;
  late Timer _timer;
  String username = "";
  User user = User();

  @override
  afterFirstLayout(BuildContext context) async {
    _startTimer();
    setState(() {
      username = widget.username!;
    });
    user = await Provider.of<UserProvider>(context, listen: false).getOtp();
  }

  String intToTimeLeft(int value) {
    int h, m, s;
    h = value ~/ 3600;
    m = ((value - h * 3600)) ~/ 60;
    s = value - (h * 3600) - (m * 60);
    String result = "$m:$s";
    return result;
  }

  checkOpt(value) async {
    user.otpCode = value;
    await AuthApi().otpVerify(user);
    await Navigator.of(context).pushNamed(ChangePasswordPage.routeName,
        arguments: ChangePasswordPageArguments(isForgot: false));
  }

  void _startTimer() async {
    if (isSubmit == true) {
      setState(() {
        isGetCode = false;
      });
      _counter = 120;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_counter > 0) {
          setState(() {
            _counter--;
          });
        } else {
          setState(() {
            isGetCode = true;
          });
          _timer.cancel();
        }
      });
    } else {
      setState(() {
        isGetCode = false;
      });
      _counter = 120;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_counter > 0) {
          setState(() {
            _counter--;
          });
        } else {
          setState(() {
            isGetCode = true;
          });
          _timer.cancel();
        }
      });
    }
  }

  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: TextStyle(
        fontSize: 20, color: buttonColor, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: darkGrey,
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var text = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: 'Таны ', style: TextStyle(color: greyDark)),
          TextSpan(
            text: username,
            style: TextStyle(
              color: buttonColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
              text: ' утасны дугаарлуу явуулсан 4 оронтой тоог оруулна уу.',
              style: TextStyle(color: greyDark)),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ActionButton(
            onClick: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: white,
              size: 10,
            ),
          ),
        ),
        title: Text(
          "Баталгаажуулалт",
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
              child: Column(
                children: [
                  // Text(
                  //   "Таны ${widget.username} И-Мейл хаягруу явуулсан 6 оронтой тоог оруулна уу.",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     color: greyDark,
                  //   ),
                  // ),
                  text,
                  const SizedBox(
                    height: 20,
                  ),
                  if (isGetCode == false)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Дахин код авах ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: white),
                        ),
                        Text(
                          '0${intToTimeLeft(_counter)} ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: buttonColor,
                          ),
                        ),
                        const Text(
                          'секунд',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: white,
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            setState(() {
                              isSubmit = true;
                            });
                            _startTimer();
                          },
                          child: Column(
                            children: const [
                              Icon(
                                Icons.refresh,
                                color: buttonColor,
                              ),
                              Text(
                                "Код дахин авах",
                                style: TextStyle(color: white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Pinput(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      onCompleted: (value) => checkOpt(value),
                      // validator: (value) {
                      //   return value == "${user.otpCode}"
                      //       ? null
                      //       : "Буруу байна";
                      // },
                      length: 4,
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      defaultPinTheme: defaultPinTheme,
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: darkGrey,
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
