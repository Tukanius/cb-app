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

class ChangePasswordPageArguments {
  bool? isForgot;
  ChangePasswordPageArguments({
    this.isForgot,
  });
}

class ChangePasswordPage extends StatefulWidget {
  static const routeName = 'ChangePasswordPage';
  final bool? isForgot;
  const ChangePasswordPage({
    Key? key,
    this.isForgot,
  }) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  TextEditingController password1 = TextEditingController();
  bool isLoading = false;
  bool isCheked = false;

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
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text(
                              "Буцах",
                              style: TextStyle(color: dark),
                            ),
                            onPressed: () {
                              if (widget.isForgot != false) {
                                Navigator.of(context).pop();
                                Navigator.of(ctx).pop();
                              } else {
                                Navigator.of(context).pop();
                                Navigator.of(ctx).pop();
                                Navigator.of(ctx).pop();
                                Navigator.of(ctx).pop();
                              }
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
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text(
                              "Буцах",
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
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        bottom: true,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.background,
            automaticallyImplyLeading: false,
            leading: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ActionButton(
                onClick: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Theme.of(context).hoverColor,
                  size: 10,
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              'Нууц үг',
              style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          body: isLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: buttonColor,
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: FormBuilder(
                    key: fbKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            // Text(
                            //     'Нууц үг нь хамгийн багадаа 8-н тэмдэг, 1 тоо, 1 тусгай тэмдэгт, 1 том үсэгнээс бүрдсэн байх ёстой'),
                            widget.isForgot == true || widget.isForgot == null
                                ? FormTextField(
                                    labelText: "Хуучин нууц үг",
                                    inputType: TextInputType.text,
                                    obscureText: true,
                                    name: 'oldPassword',
                                    hintText: "Хуучин нууц үгээ оруулна уу",
                                    textColor:
                                        Theme.of(context).iconTheme.color,
                                    color: Theme.of(context).splashColor,
                                    validators: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText:
                                              'Хуучин нууц үгээ оруулна уу')
                                    ]),
                                  )
                                : SizedBox(),

                            FormTextField(
                              controller: password1,
                              labelText: "Нууц үг",
                              inputType: TextInputType.text,
                              obscureText: true,
                              textColor: Theme.of(context).iconTheme.color,
                              name: 'password',
                              hintText: "Нууц үг",
                              color: Theme.of(context).splashColor,
                              validators: FormBuilderValidators.compose([
                                (value) {
                                  return validatePassword(
                                      value.toString(), context);
                                }
                              ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            FormTextField(
                              textColor: Theme.of(context).iconTheme.color,
                              labelText: "Нууц үг баталгаажуулалт",
                              inputType: TextInputType.text,
                              obscureText: true,
                              name: 'passwordVerify',
                              hintText: "Нууц үгээ давтан оруулна уу",
                              color: Theme.of(context).splashColor,
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
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 23,
                                  height: 23,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1.5,
                                      color: Theme.of(context).splashColor,
                                    ),
                                    color: password1.text.length <= 8
                                        ? buttonColor
                                        : transparent,
                                  ),
                                  child: password1.text.length <= 8
                                      ? Icon(
                                          Icons.check,
                                          size: 20.0,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                      'Нууц үг 8 болон түүнээс дээш тэмдэгттэй байх'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isCheked = !isCheked;
                                    });
                                  },
                                  child: Container(
                                    width: 23,
                                    height: 23,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1.5,
                                        color: Theme.of(context).splashColor,
                                      ),
                                      color: isCheked == false
                                          ? buttonColor
                                          : transparent,
                                    ),
                                    child: isCheked == false
                                        ? Icon(
                                            Icons.check,
                                            size: 20.0,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                      'Ядаж 1 том, жижиг үсэг, 1 тоо агуулсан байх'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isCheked = !isCheked;
                                    });
                                  },
                                  child: Container(
                                    width: 23,
                                    height: 23,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1.5,
                                        color: Theme.of(context).splashColor,
                                      ),
                                      color: isCheked == false
                                          ? buttonColor
                                          : transparent,
                                    ),
                                    child: isCheked == false
                                        ? Icon(
                                            Icons.check,
                                            size: 20.0,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                      'Ядаж 1 тусгай тэмдэгт агуулсан байх !@#%^&*'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        CustomButton(
                          isLoading: isLoading,
                          labelColor: buttonColor,
                          labelText: "Үргэлжлүүлэх",
                          onClick: () {
                            onSubmit();
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
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return 'Нууц үгээ оруулна уу';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Нууц үг багадаа 1 том үсэг 1 тэмдэгт авна';
    } else {
      return null;
    }
  }
}
