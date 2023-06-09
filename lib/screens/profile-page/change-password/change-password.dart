import 'package:bank_core/api/auth-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';

class ChangePasswordPage extends StatefulWidget {
  static const routeName = 'ChangePasswordPage';
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;

  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      setState(() {
        isLoading = true;
      });
      try {
        User data = User.fromJson(fbKey.currentState!.value);
        await AuthApi().changePassword(data);
        showSuccess(context);
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        print(e.toString());
      }
    }
  }

  showSuccess(ctx) async {
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
                        'Нууц үг амжилттай солигдлоо.',
                        textAlign: TextAlign.center,
                      ),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              "За",
                              style: TextStyle(color: dark),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(ctx).pop();
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

  showError(ctx) async {
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
                        'Амжилтгүй',
                        style: TextStyle(
                            color: dark,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Та мэдээлэлээ дахин шалгана уу.',
                        textAlign: TextAlign.center,
                      ),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              "За",
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
                Lottie.asset('assets/lottie/error.json',
                    height: 150, repeat: false),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SafeArea(
        bottom: true,
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
              'Нууц үг солих',
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: FormBuilder(
              key: fbKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      FormTextField(
                        labelText: "Хуучин нууц үг",
                        inputType: TextInputType.text,
                        obscureText: true,
                        name: 'oldPassword',
                        hintText: "Хуучин нууц үгээ оруулна уу",
                        color: darkGrey,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Хуучин нууц үгээ оруулна уу')
                        ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FormTextField(
                        labelText: "Шинэ нууц үг",
                        inputType: TextInputType.text,
                        obscureText: true,
                        name: 'password',
                        hintText: "Шинэ нууц үг",
                        color: darkGrey,
                        validators: FormBuilderValidators.compose([
                          (value) {
                            return validatePassword(value.toString(), context);
                          }
                        ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FormTextField(
                        labelText: "Нууц үг баталгаажуулалт",
                        inputType: TextInputType.text,
                        obscureText: true,
                        name: 'passwordVerify',
                        hintText: "Шинэ нууц үгээ давтан оруулна уу",
                        color: darkGrey,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "Нууц үгээ давтан оруулна уу"),
                          (value) {
                            if (fbKey.currentState?.fields['password']?.value !=
                                value) {
                              return 'Оруулсан нууц үгтэй таарахгүй байна';
                            }
                            return null;
                          }
                        ]),
                      ),
                    ],
                  ),
                  CustomButton(
                    labelColor: buttonColor,
                    labelText: "Үргэлжлүүлэх",
                    onClick: () {
                      if (isLoading == false) {
                        onSubmit();
                      }
                    },
                    textColor: white,
                    boxShadow: true,
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
