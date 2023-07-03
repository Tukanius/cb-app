import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/auth/check-biometric.dart';
import 'package:bank_core/screens/auth/forgot.dart';
import 'package:bank_core/screens/auth/register-page.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/utils/secure_storage.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with AfterLayoutMixin {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioContoller = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();
  final SecureStorage secureStorage = SecureStorage();
  String walletIcon = "assets/svg/wallet.svg";
  String fingerPrintIcon = "assets/svg/finger-print.svg";
  String faceIdIcon = "assets/svg/face-id.svg";
  bool useBiometricAuth = false;
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  bool isVisible = true;
  bool isSubmit = false;
  bool isBioMetric = false;
  bool activeBio = false;
  String bioType = "";

  @override
  afterFirstLayout(BuildContext context) async {
    Future<String?> futureResult = secureStorage.getBioMetric();
    String result = await futureResult ?? "";
    if (result == "true") {
      setState(() {
        isBioMetric = true;
      });
    }
    // ···
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    setState(() {
      activeBio = canAuthenticate;
    });

    if (activeBio == true) {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                      child: SvgPicture.asset(
                        walletIcon,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    FormBuilder(
                      key: fbKey,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: FormTextField(
                              textColor: Theme.of(context).iconTheme.color,
                              labelText: "Утасны дугаар",
                              onChanged: (value) {
                                secureStorage.deleteAll();
                              },
                              inputType: TextInputType.text,
                              name: 'phone',
                              controller: phoneController,
                              hintText: 'Нэвтрэх нэр',
                              validators: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Нэвтрэх нэрээ оруулна уу.')
                              ]),
                              color: Theme.of(context).splashColor,
                            ),
                          ),
                          Container(
                            child: FormTextField(
                              textColor: Theme.of(context).iconTheme.color,
                              labelText: "Нууц үг",
                              controller: passwordController,
                              inputType: TextInputType.visiblePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: isVisible == true
                                    ? Icon(Icons.visibility, color: darkGrey)
                                    : Icon(Icons.visibility_off,
                                        color: darkGrey),
                              ),
                              name: 'password',
                              hintText: 'Нууц үг',
                              obscureText: isVisible,
                              color: Theme.of(context).splashColor,
                              validators: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Нууц үгээ оруулна уу.')
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => {
                            Navigator.of(context)
                                .pushNamed(ForgotPage.routeName),
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Нууц үгээ мартсан?",
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                boxShadow: false,
                                labelColor: buttonColor,
                                labelText: "Нэвтрэх",
                                isLoading: isSubmit,
                                textColor: white,
                                onClick: () {
                                  _performLogin(context);
                                },
                              ),
                            ),
                            if (isBioMetric == true)
                              GestureDetector(
                                onTap: () {
                                  loginBio();
                                },
                                child: Container(
                                  width: 42,
                                  height: 42,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    color: buttonColor,
                                  ),
                                  child: SvgPicture.asset(
                                    bioType == "FACE"
                                        ? faceIdIcon
                                        : fingerPrintIcon,
                                    height: 20,
                                    color: white,
                                    width: 20,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Бүртгэл үүсгэх бол энд дарна уу",
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RegisterPage.routeName);
                      },
                      child: Text(
                        "Бүртгүүлэх",
                        style: TextStyle(color: buttonColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _performLogin(BuildContext context) async {
    final String phone;
    final String password;
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (fbKey.currentState!.saveAndValidate()) {
      phone = fbKey.currentState?.fields['phone']?.value;
      password = fbKey.currentState?.fields['password']?.value;
      try {
        setState(() {
          isSubmit = true;
        });

        User save = User.fromJson(fbKey.currentState!.value);
        await Provider.of<UserProvider>(context, listen: false).login(save);
        await _storeCredentials(phone, password);
        if (activeBio == true && availableBiometrics.isNotEmpty) {
          Navigator.of(context).pushNamed(CheckBiometric.routeName);
        } else {
          // Navigator.of(context).pushNamed(CheckBiometric.routeName);
          Navigator.of(context).pushNamed(SplashScreen.routeName);
        }
      } catch (e) {
        debugPrint(e.toString());
        setState(() {
          isSubmit = false;
        });
      }
    }
  }

  Future<void> loginBio() async {
    bool authenticated = false;
    User save = User();
    try {
      setState(() {
        isSubmit = true;
      });
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (authenticated == true) {
        Future<String?> username = secureStorage.getUserName();
        Future<String?> password = secureStorage.getPassWord();
        String resultUsername = await username ?? "";
        String resultPassword = await password ?? "";
        save.phone = resultUsername;
        save.password = resultPassword;
        await Provider.of<UserProvider>(context, listen: false).login(save);
        Navigator.of(context).pushNamed(SplashScreen.routeName);
      }
      setState(() {
        isSubmit = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        isSubmit = false;
      });
      return;
    }
    if (!mounted) {
      return;
    }
  }

  _storeCredentials(String phone, String password) async {
    await secureStorage.setUserName(phone);
    await secureStorage.setPassWord(password);
  }
}
