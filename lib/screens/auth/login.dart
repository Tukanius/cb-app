import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/register-page/register-page.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: darkGrey,
                ),
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 100,
              ),
              FormBuilder(
                key: fbKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: FormTextField(
                        inputType: TextInputType.text,
                        name: 'email',
                        hintText: 'Нэвтрэх нэр',
                        color: white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: FormTextField(
                        inputType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: isVisible == true
                              ? Icon(Icons.visibility, color: darkGrey)
                              : Icon(Icons.visibility_off, color: darkGrey),
                        ),
                        name: 'password',
                        hintText: 'Нууц үг',
                        obscureText: isVisible,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Нууц үгээ мартсан уу?',
                      style: TextStyle(
                        color: grey,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: CustomButton(
                      boxShadow: false,
                      labelColor: darkGrey,
                      labelText: "Нэвтрэх",
                      textColor: white,
                      onClick: () {
                        onSubmit();
                      },
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: CustomButton(
                      boxShadow: false,
                      labelColor: white,
                      labelText: "Бүртгүүлэх",
                      textColor: black,
                      onClick: () {
                        Navigator.of(context).pushNamed(RegisterPage.routeName);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
