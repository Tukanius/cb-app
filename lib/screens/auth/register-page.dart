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
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
  bool isCheck = false;
  bool isLoading = false;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  bool termValidate = false;

  @override
  void initState() {
    super.initState();
  }

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

  show() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            centerTitle: true,
            title: Text(
              'Үйлчилгээний нөхцөл',
              style: TextStyle(color: Theme.of(context).iconTheme.color),
            ),
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
          ),
          body: Stack(
            children: [
              Container(
                child: SfPdfViewer.asset(
                  'assets/svg/term-condition.pdf',
                  key: _pdfViewerKey,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 30,
                left: 30,
                child: CustomButton(
                  boxShadow: false,
                  labelColor: backgroundColor,
                  isLoading: false,
                  labelText: "Зөвшөөрөх",
                  onClick: () {
                    setState(() {
                      isCheck = true;
                      termValidate = false;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  checkValidate() {
    if (isCheck != true) {
      setState(() {
        termValidate = true;
      });
    } else if (isCheck == true) {
      onSubmit();
    } else {
      show();
    }
  }

  DateTime dateTime = DateTime.now();

  void onChangeLetter(String item, index) {
    Navigator.pop(context);

    setState(() {
      letters[index] = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
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
                'Бүртгүүлэх',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FormBuilder(
                      key: fbKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormTextField(
                            labelText: "Утаны дугаар",
                            maxLenght: 8,
                            inputType: TextInputType.phone,
                            showCounter: false,
                            name: 'phone',
                            hintText: "Утасны дугаараа оруулна уу",
                            color: Theme.of(context).splashColor,
                            textColor: Theme.of(context).iconTheme.color,
                            validators: FormBuilderValidators.compose([
                              (value) {
                                return validatePhone(value.toString(), context);
                              }
                            ]),
                          ),
                          FormTextField(
                            color: Theme.of(context).splashColor,
                            textColor: Theme.of(context).iconTheme.color,
                            labelText: "Овог",
                            inputType: TextInputType.text,
                            name: 'lastName',
                            hintText: "Овогоо оруулна уу",
                            validators: FormBuilderValidators.compose([
                              (value) {
                                return isValidCryllic(
                                    value.toString(), context);
                              }
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FormTextField(
                            color: Theme.of(context).splashColor,
                            textColor: Theme.of(context).iconTheme.color,
                            labelText: "Нэр",
                            inputType: TextInputType.text,
                            name: 'firstName',
                            hintText: "Нэрээ оруулна уу",
                            validators: FormBuilderValidators.compose([
                              (value) {
                                return isValidCryllic(
                                    value.toString(), context);
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
                                color: Theme.of(context).iconTheme.color,
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
                                  fillColor: Theme.of(context).splashColor,
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
                                        backgroundColor:
                                            Theme.of(context).splashColor,
                                        textColor:
                                            Theme.of(context).iconTheme.color,
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
                                        backgroundColor:
                                            Theme.of(context).splashColor,
                                        textColor:
                                            Theme.of(context).iconTheme.color,
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
                                          textColor:
                                              Theme.of(context).iconTheme.color,
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
                          Row(
                            children: [
                              Checkbox(
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                    color: buttonColor,
                                    width: 2,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                activeColor: buttonColor,
                                value: isCheck,
                                onChanged: (value) {
                                  show();
                                },
                              ),
                              Text(
                                'Үйлчилгээний нөхцөлтэй  ',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  show();
                                },
                                child: Text(
                                  'ТАНИЛЦАХ',
                                  style: TextStyle(color: buttonColor),
                                ),
                              )
                            ],
                          ),
                          termValidate == true
                              ? Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Үйлчилгээний нөхцөл зөвшөөрөөгүй байна',
                                    style: TextStyle(
                                      color: Colors.redAccent.withOpacity(0.6),
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    CustomButton(
                      isLoading: isSubmit,
                      onClick: () {
                        checkValidate();
                      },
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

String? isValidCryllic(String name, BuildContext context) {
  String pattern = r'(^[а-яА-ЯӨөҮүЁёӨө -]+$)';
  RegExp isValidName = RegExp(pattern);
  if (name.isEmpty) {
    return "Заавар оруулна";
  } else {
    if (!isValidName.hasMatch(name)) {
      return "Зөвхөн крилл үсэг ашиглана";
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
    return 'И-Мэйлээ оруулна уу';
  } else {
    if (!regex.hasMatch(value)) {
      return 'И-Мэйл буруу байна';
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
