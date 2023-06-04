import 'package:bank_core/api/auth.dart';
import 'package:bank_core/widget/custon_button.dart';
import 'package:bank_core/screens/main/main_page.dart';
import 'package:bank_core/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:bank_core/widget/form_textfield.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:bank_core/screens/splash/index.dart';
import 'package:bank_core/screens/register/register.dart';
import '../../../models/user.dart';
import '../../../provider/user_provider.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:after_layout/after_layout.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bank_core/models/user.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "LoginPage";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      try {
        setState(() {
          isSubmit = true;
        });
        User data = User.fromJson(fbKey.currentState!.value);
        await AuthApi().login(data);
        Navigator.of(context).pushNamed(SplashPage.routeName);
      } catch (e) {
        debugPrint(e.toString());
        setState(() {
          isSubmit = false;
        });
      }
    }
  }

  bool _isVisible = true;
  bool isSubmit = false;
  bool loading = false;
  bool saveIsUsername = false;
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/1.png'), fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: FormBuilder(
                  key: fbKey,
                  child: Column(
                    children: [
                      FormTextField(
                        name: "email",
                        inputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        decoration: InputDecoration(
                          enabled: true,
                          counterText: "",
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          prefixIconColor: Colors.green,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: InputBorder.none,
                          filled: true,
                          hintStyle: const TextStyle(
                              color: Colors.black54, fontSize: 14),
                          hintText: "И-мэйл эсвэл Утасны дугаар",
                          fillColor: Colors.white,
                        ),
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Нэвтрэх нэрээ оруулна уу.')
                        ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FormTextField(
                        name: "password",
                        inputAction: TextInputAction.next,
                        obscureText: _isVisible,
                        textCapitalization: TextCapitalization.none,
                        decoration: InputDecoration(
                          enabled: true,
                          prefixIconColor: Colors.green,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: _isVisible
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: InputBorder.none,
                          filled: true,
                          hintStyle: const TextStyle(
                              color: Colors.black54, fontSize: 14),
                          hintText: "Нууц үг",
                          fillColor: Colors.white,
                        ),
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Нууц үгээ оруулна уу.')
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Center(
                    child: Text(
                      'Нэвтрэх нэр эсвэл нууц үгээ мартсан уу?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomButton(
                  labelText: 'Нэвтрэх',
                  color: Colors.greenAccent,
                  textColor: Colors.white,
                  onClick: () {
                    onSubmit(); //
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomButton(
                  labelText: 'Бүртгүүлэх',
                  color: Colors.white,
                  textColor: Colors.greenAccent,
                  onClick: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Register();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
