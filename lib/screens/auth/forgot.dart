import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/otp/otp-page.dart';
import 'package:bank_core/utils/is_device_size.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/register-number/letter.dart';
import 'package:bank_core/widgets/register-number/letters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class ForgotPage extends StatefulWidget {
  static const routeName = 'ForgotPage';
  const ForgotPage({Key? key}) : super(key: key);

  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  TextEditingController regnumController = TextEditingController();
  bool isSubmit = false;

  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      setState(() {
        isSubmit = true;
      });
      try {
        User data = User.fromJson(fbKey.currentState!.value);
        data.registerNo =
            '${letters.join()}${fbKey.currentState?.value["registerNo"]}';
        await Provider.of<UserProvider>(context, listen: false).forgot(data);
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

  List<String> letters = [
    CYRILLIC_ALPHABETS_LIST[0],
    CYRILLIC_ALPHABETS_LIST[0]
  ];
  String registerNo = "";

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
              'Нууц үг сэргээх',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormTextField(
                        labelText: "Утасны дугаар",
                        inputType: TextInputType.emailAddress,
                        name: 'phone',
                        hintText: "Утасны дугаар оруулна уу",
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
                                    height: DeviceSize.height(90, context),
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
                                    height: DeviceSize.height(90, context),
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
                    ],
                  ),
                  CustomButton(
                    labelColor: buttonColor,
                    labelText: "Үргэлжлүүлэх",
                    onClick: () {
                      if (isSubmit == false) {
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
