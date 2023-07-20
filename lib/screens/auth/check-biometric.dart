// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/utils/secure_storage.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:after_layout/after_layout.dart';

class CheckBiometric extends StatefulWidget {
  static const routeName = 'biocheck';

  const CheckBiometric({Key? key}) : super(key: key);

  @override
  _CheckBiometricState createState() => _CheckBiometricState();
}

class _CheckBiometricState extends State<CheckBiometric> with AfterLayoutMixin {
  bool isLoading = false;
  final LocalAuthentication auth = LocalAuthentication();
  final SecureStorage secureStorage = SecureStorage();
  bool bioMetric = false;
  final String fingerPrintIcon = "assets/svg/finger-print.svg";
  final String faceIdIcon = "assets/svg/face-id.svg";
  String bioType = "";

  Future<void> _authenticate() async {
    try {
      setState(() {
        isLoading = true;
      });
      bioMetric = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        isLoading = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
      return;
    }
    if (!mounted) {
      return;
    }

    secureStorage.setBioMetric(bioMetric);

    Navigator.of(context).pushNamed(SplashScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 80),
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: darkGrey,
                ),
                alignment: Alignment.center,
                child: bioType == "FACE"
                    ? SvgPicture.asset(
                        faceIdIcon,
                        color: buttonColor,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset(
                        fingerPrintIcon,
                        color: buttonColor,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )),
            SizedBox(
              height: 20,
            ),
            Text(
              "Та тохиргоог идэвхжүүлснээр цаашид апп руу нэвтрэхэд нэвтрэх нэр нууц үг хийх шаардлагагүй.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              boxShadow: false,
              labelColor: buttonColor,
              labelText: "Зөвшөөрөх",
              isLoading: isLoading,
              textColor: white,
              onClick: () {
                _authenticate();
              },
            ),
            SizedBox(
              height: 8,
            ),
            CustomButton(
              boxShadow: false,
              borderWidth: 1,
              borderColor: buttonColor,
              labelColor: backgroundColor,
              labelText: "Алгасах",
              isLoading: isLoading,
              textColor: white,
              onClick: () {
                Navigator.of(context).pushNamed(SplashScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  afterFirstLayout(BuildContext context) async {
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (availableBiometrics.contains(BiometricType.face)) {
      setState(() {
        bioType = "FACE";
      });
    }
    if (availableBiometrics.contains(BiometricType.fingerprint)) {
      setState(() {
        bioType = "FINGER_PRINT";
      });
    }
  }
}
