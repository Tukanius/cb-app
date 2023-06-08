import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/auth/login.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'RegisterPage';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with AfterLayoutMixin {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  User user = User();
  bool isVisible = true;
  bool isVisible1 = true;
  String? pVal;

  @override
  void initState() {
    super.initState();
  }

  @override
  afterFirstLayout(BuildContext context) async {}

  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      try {
        User data = User.fromJson(fbKey.currentState!.value);
        await Provider.of<UserProvider>(context, listen: false).register(data);
        await show(context);
        await Navigator.of(context).pushNamed(LoginScreen.routeName);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  show(ctx) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 75),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Амжилттай',
                        style: TextStyle(
                            color: dark,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Таны бүртгэл амжилттай үүслээ.',
                        textAlign: TextAlign.center,
                      ),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              "Нэвтрэх",
                              style: TextStyle(color: dark),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Lottie.asset('assets/lottie/success.json',
                    height: 150, repeat: false),
              ],
            ),
          );
        });
  }

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: backgroundColor,
            automaticallyImplyLeading: false,
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
              'Бүртгүүлэх',
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormBuilder(
                    key: fbKey,
                    child: Column(
                      children: [
                        FormTextField(
                          labelText: "Овог",
                          inputType: TextInputType.text,
                          name: 'lastName',
                          hintText: "Овогоо оруулна уу",
                          color: darkGrey,
                          validators: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Овогоо оруулна уу')
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormTextField(
                          labelText: "Нэр",
                          inputType: TextInputType.text,
                          name: 'firstName',
                          hintText: "Нэрээ оруулна уу",
                          color: darkGrey,
                          validators: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Нэрээ оруулна уу')
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormTextField(
                          labelText: "Регистер №",
                          inputType: TextInputType.text,
                          name: 'registerNo',
                          hintText: "Регистерийн дугаар",
                          color: darkGrey,
                          validators: FormBuilderValidators.compose([
                            (value) {
                              return validateRegisterNo(
                                  value.toString(), context);
                            }
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormTextField(
                          labelText: "Утаны дугаар",
                          inputType: TextInputType.phone,
                          name: 'phone',
                          hintText: "Утасны дугаараа оруулна уу",
                          color: darkGrey,
                          validators: FormBuilderValidators.compose([
                            (value) {
                              return validatePhone(value.toString(), context);
                            }
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormTextField(
                          labelText: "И-Мейл",
                          inputType: TextInputType.emailAddress,
                          name: 'email',
                          hintText: "И-Мейлээ оруулна уу",
                          color: darkGrey,
                          validators: FormBuilderValidators.compose([
                            (value) {
                              return validateEmail(value.toString(), context);
                            }
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormTextField(
                          labelText: "Нууц үг",
                          obscureText: true,
                          name: 'password',
                          hintText: "Нууц үгээ оруулна уу",
                          color: darkGrey,
                          validators: FormBuilderValidators.compose([
                            (value) {
                              return validatePassword(
                                  value.toString(), context);
                            }
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormTextField(
                          labelText: "Нууц үг баталгаажуулалт",
                          name: "password_verify",
                          inputType: TextInputType.text,
                          hintText: "Нууц үгээ давтан оруулна уу",
                          inputAction: TextInputAction.done,
                          obscureText: true,
                          color: darkGrey,
                          validators: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: "Нууц үгээ давтан оруулна уу"),
                            (value) {
                              if (fbKey.currentState?.fields['password']
                                      ?.value !=
                                  value) {
                                return 'Оруулсан нууц үгтэй таарахгүй байна';
                              }
                              return null;
                            }
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    onClick: onSubmit,
                    labelColor: buttonColor,
                    labelText: 'Бүртгүүлэх',
                    boxShadow: false,
                    textColor: white,
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

String? validateRegisterNo(String value, context) {
  RegExp regex = RegExp(r'[а-яА-ЯёЁөӨүҮ]{2}\d{8}$');
  if (value.isEmpty) {
    return 'Регистрийн дугаараа оруулна уу';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Зөвхөн криллээр бичнэ үү';
    } else {
      return null;
    }
  }
}

String? validatePassword(String value, context) {
  RegExp regex = RegExp(r'^.{6,20}$');
  if (value.isEmpty) {
    return 'Нууц үгээ оруулна уу';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Нууц үг нь дор хаяж 6 тэмдэгтээс бүрдэх ёстой';
    } else {
      return null;
    }
  }
}

String? validatePhone(String value, context) {
  RegExp regex = RegExp(r'[(9|8]{1}[0-9]{7}$');
  if (value.isEmpty) {
    return 'Утасны дугаараа оруулна уу';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Утасны дугаараа шалгана уу';
    } else {
      return null;
    }
  }
}

String? validateEmail(String value, context) {
  RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (value.isEmpty) {
    return 'И-Мейлээ оруулна уу';
  } else {
    if (!regex.hasMatch(value)) {
      return 'И-Мейлээ шалгана уу';
    } else {
      return null;
    }
  }
}
