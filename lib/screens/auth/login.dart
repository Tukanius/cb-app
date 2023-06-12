import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/auth/forgot.dart';
import 'package:bank_core/screens/auth/register-page.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  bool isVisible = true;
  bool isSubmit = false;
  String walletIcon = "assets/svg/wallet.svg";

  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      try {
        setState(() {
          isSubmit = true;
        });
        User save = User.fromJson(fbKey.currentState!.value);
        await Provider.of<UserProvider>(context, listen: false).login(save);
        Navigator.of(context).pushNamed(SplashScreen.routeName);
      } catch (e) {
        debugPrint(e.toString());
        setState(() {
          isSubmit = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Container(
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
                                labelText: "Е-Мэйл",
                                inputType: TextInputType.text,
                                name: 'email',
                                hintText: 'Нэвтрэх нэр',
                                validators: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Нэвтрэх нэрээ оруулна уу.')
                                ]),
                                color: darkGrey,
                              ),
                            ),
                            Container(
                              child: FormTextField(
                                labelText: "Нууц үг",
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
                                color: darkGrey,
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
                                  color: white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            boxShadow: false,
                            labelColor: buttonColor,
                            labelText: "Нэвтрэх",
                            textColor: white,
                            onClick: () {
                              if (isSubmit == false) {
                                onSubmit();
                              }
                            },
                          ),
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
                          color: white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RegisterPage.routeName);
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
      ),
    );
  }
}
