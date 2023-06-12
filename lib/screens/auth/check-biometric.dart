import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/utils/secure_storage.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class CheckBiometric extends StatefulWidget {
  static const routeName = 'biocheck';

  const CheckBiometric({Key? key}) : super(key: key);

  @override
  _CheckBiometricState createState() => _CheckBiometricState();
}

class _CheckBiometricState extends State<CheckBiometric> {
  bool isLoading = false;
  final LocalAuthentication auth = LocalAuthentication();
  final SecureStorage secureStorage = SecureStorage();
  bool bioMetric = false;

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
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            boxShadow: false,
            labelColor: buttonColor,
            labelText: "Нэвтрэх",
            isLoading: isLoading,
            textColor: white,
            onClick: () {
              _authenticate();
            },
          ),
        ],
      ),
    );
  }
}
