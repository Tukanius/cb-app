import 'dart:async';

import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:after_layout/after_layout.dart';

class OtpVerifyPageArguments {
  String? username;
  OtpVerifyPageArguments({
    this.username,
  });
}

class OtpVerifyPage extends StatefulWidget {
  static const routeName = 'OtpVerifyPage';
  final String? username;
  const OtpVerifyPage({Key? key, this.username}) : super(key: key);

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

  @override
  afterFirstLayout(BuildContext context) {
    _startTimer();
    setState(() {
      username = widget.username!;
    });
  }

  String intToTimeLeft(int value) {
    int h, m, s;
    h = value ~/ 3600;
    m = ((value - h * 3600)) ~/ 60;
    s = value - (h * 3600) - (m * 60);
    String result = "$m:$s";
    return result;
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
              text: ' И-Мейл хаягруу явуулсан 6 оронтой тоог оруулна уу.',
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
                          onTap: () {
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
                      onCompleted: (value) => {
                        Navigator.of(context).pushNamed(SplashScreen.routeName),
                      },
                      validator: (value) {
                        return value == "123456" ? null : "Буруу байна";
                      },
                      length: 6,
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
