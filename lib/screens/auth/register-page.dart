import 'dart:async';

import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/otp/otp-page.dart';
import 'package:bank_core/utils/is_device_size.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:bank_core/widgets/register-number/letter.dart';
import 'package:bank_core/widgets/register-number/letters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'RegisterPage';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  TextEditingController regnumController = TextEditingController();
  User user = User();
  bool isVisible = true;
  bool isVisible1 = true;
  bool isSubmit = false;
  bool? registerNoError = true;
  String? pVal;
  Timer? timer;
  List<String> letters = [
    CYRILLIC_ALPHABETS_LIST[0],
    CYRILLIC_ALPHABETS_LIST[0]
  ];
  String registerNo = "";

  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      setState(() {
        isSubmit = true;
      });
      try {
        User data = User.fromJson(fbKey.currentState!.value);
        data.registerNo =
            '${letters.join()}${fbKey.currentState?.value["registerNo"]}';
        await Provider.of<UserProvider>(context, listen: false).register(data);
        // await show(context);
        setState(() {
          isSubmit = false;
        });
        await Navigator.of(context).pushNamed(OtpVerifyPage.routeName,
            arguments: OtpVerifyPageArguments(username: data.phone));
      } catch (e) {
        setState(() {
          isSubmit = false;
        });
        print(e.toString());
      }
    }
  }

  // show(ctx) async {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (context) {
  //       return Container(
  //         alignment: Alignment.center,
  //         margin: const EdgeInsets.symmetric(horizontal: 20),
  //         child: Stack(
  //           alignment: Alignment.topCenter,
  //           children: <Widget>[
  //             Container(
  //               margin: const EdgeInsets.only(top: 75),
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   const Text(
  //                     'Амжилттай',
  //                     style: TextStyle(
  //                         color: dark,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 24),
  //                   ),
  //                   const SizedBox(
  //                     height: 16,
  //                   ),
  //                   const Text(
  //                     'Таны бүртгэл амжилттай үүслээ.',
  //                     textAlign: TextAlign.center,
  //                   ),
  //                   ButtonBar(
  //                     buttonMinWidth: 100,
  //                     alignment: MainAxisAlignment.spaceEvenly,
  //                     children: <Widget>[
  //                       TextButton(
  //                         child: const Text(
  //                           "Нэвтрэх",
  //                           style: TextStyle(color: dark),
  //                         ),
  //                         onPressed: () {
  //                           Navigator.of(context).pop();
  //                         },
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Lottie.asset('assets/lottie/success.json',
  //                 height: 150, repeat: false),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  DateTime dateTime = DateTime.now();

  void onChangeLetter(String item, index) {
    Navigator.pop(context);

    setState(() {
      letters[index] = item;
    });
  }

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
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormBuilder(
                  key: fbKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FormTextField(
                      //   labelText: "И-Мейл",
                      //   inputType: TextInputType.emailAddress,
                      //   name: 'email',
                      //   hintText: "И-Мейлээ оруулна уу",
                      //   color: darkGrey,
                      //   validators: FormBuilderValidators.compose([
                      //     (value) {
                      //       return validateEmail(value.toString(), context);
                      //     }
                      //   ]),
                      // ),
                      FormTextField(
                        labelText: "Утаны дугаар",
                        maxLenght: 8,
                        inputType: TextInputType.phone,
                        showCounter: false,
                        name: 'phone',
                        hintText: "Утасны дугаараа оруулна уу",
                        color: darkGrey,
                        validators: FormBuilderValidators.compose([
                          (value) {
                            return validatePhone(value.toString(), context);
                          }
                        ]),
                      ),

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
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Регистерийн дугаар",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      FormBuilderField(
                        autovalidateMode: AutovalidateMode.disabled,
                        name: "registerNo",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Заавал бөглөнө үү'),
                          (dynamic value) => value.toString() != ""
                              ? (validateStructure(
                                      letters.join(), value.toString())
                                  ? null
                                  : "Регистерийн дугаараа оруулна уу!")
                              : null,
                        ]),
                        builder: (FormFieldState<dynamic> field) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              errorText: field.errorText,
                              fillColor: darkGrey,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 15),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  RegisterLetters(
                                    width: DeviceSize.width(3, context),
                                    height: DeviceSize.height(80, context),
                                    oneTitle: "Регистер сонгох",
                                    hideOnPressed: false,
                                    title: letters[0],
                                    backgroundColor: transparent,
                                    length: CYRILLIC_ALPHABETS_LIST.length,
                                    itemBuilder: (ctx, i) => RegisterLetter(
                                      text: CYRILLIC_ALPHABETS_LIST[i],
                                      onPressed: () {
                                        onChangeLetter(
                                            CYRILLIC_ALPHABETS_LIST[i], 0);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  RegisterLetters(
                                    width: DeviceSize.width(3, context),
                                    height: DeviceSize.height(80, context),
                                    title: letters[1],
                                    oneTitle: "Регистер сонгох",
                                    hideOnPressed: false,
                                    backgroundColor: transparent,
                                    length: CYRILLIC_ALPHABETS_LIST.length,
                                    itemBuilder: (ctx, i) => RegisterLetter(
                                      text: CYRILLIC_ALPHABETS_LIST[i],
                                      onPressed: () {
                                        onChangeLetter(
                                            CYRILLIC_ALPHABETS_LIST[i], 1);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: FormTextField(
                                      labelText: "",
                                      textColor: white,
                                      onChanged: (value) {
                                        setState(() {
                                          registerNo = value;
                                        });
                                        // ignore: invalid_use_of_protected_member
                                        field.setValue(value);
                                      },
                                      controller: regnumController,
                                      onComplete: () {
                                        print(123);
                                      },
                                      inputType: TextInputType.number,
                                      name: 'registerNumber',
                                      hintText: 'Регистерийн дугаар',
                                      color: transparent,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),

                      // FormTextField(
                      //   labelText: "Нууц үг",
                      //   obscureText: true,
                      //   name: 'password',
                      //   hintText: "Нууц үгээ оруулна уу",
                      //   color: darkGrey,
                      //   validators: FormBuilderValidators.compose([
                      //     (value) {
                      //       return validatePassword(
                      //           value.toString(), context);
                      //     }
                      //   ]),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // FormTextField(
                      //   labelText: "Нууц үг баталгаажуулалт",
                      //   name: "password_verify",
                      //   inputType: TextInputType.text,
                      //   hintText: "Нууц үгээ давтан оруулна уу",
                      //   inputAction: TextInputAction.done,
                      //   obscureText: true,
                      //   color: darkGrey,
                      //   validators: FormBuilderValidators.compose([
                      //     FormBuilderValidators.required(
                      //         errorText: "Нууц үгээ давтан оруулна уу"),
                      //     (value) {
                      //       if (fbKey.currentState?.fields['password']
                      //               ?.value !=
                      //           value) {
                      //         return 'Оруулсан нууц үгтэй таарахгүй байна';
                      //       }
                      //       return null;
                      //     }
                      //   ]),
                      // ),
                    ],
                  ),
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

bool validateStructure(String value, String number) {
  if (number.length < 8) return false;
  if (isNumeric(number)) {
    return true;
  }
  return true;
}

bool isNumeric(String s) {
  if (s.isEmpty) {
    return false;
  }

  return !int.parse(s).isNaN;
}
