import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/general.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';
import 'package:moment_dart/moment_dart.dart';

class AddInformationPageArguments {
  ListenController listenController;
  AddInformationPageArguments({
    required this.listenController,
  });
}

class AddInformationPage extends StatefulWidget {
  final ListenController listenController;

  static const routeName = 'AddInformationPage';
  const AddInformationPage({
    Key? key,
    required this.listenController,
  }) : super(key: key);

  @override
  State<AddInformationPage> createState() => _AddInformationPageState();
}

class _AddInformationPageState extends State<AddInformationPage> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  General general = General();
  String? nationalityType;
  String? educationType;
  String? marriageStatuses;
  String? genderId;
  String? workStatus;
  Customer customer = Customer();
  User user = User();
  bool isSubmit = false;
  DateTime? dateTime;
  bool dateError = false;

  onValidate() {
    if (dateTime == null) {
      setState(() {
        dateError = true;
      });
    }
    onSubmit();
  }

  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate() && dateError == false) {
      setState(() {
        isSubmit = true;
      });
      try {
        customer = Customer.fromJson(fbKey.currentState!.value);
        customer.birthDate = dateTime.toString();
        customer.nationalityTypeId = nationalityType;
        customer.educationTypeId = educationType;
        customer.marriageStatusId = marriageStatuses;
        customer.genderId = genderId;
        customer.workStatusId = workStatus;
        await CustomerApi().profileUpdate(user.customerId!, customer);
        widget.listenController.changeVariable('refresh');
        setState(() {
          isSubmit = false;
        });
        await show(context);
      } catch (e) {
        setState(() {
          isSubmit = false;
        });
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
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text(
                              "Дуусгах",
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

  @override
  Widget build(BuildContext context) {
    general = Provider.of<GeneralProvider>(context, listen: false).general;
    user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
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
          "Нэмэлт мэдээлэл бөглөх",
          style: TextStyle(
            color: Theme.of(context).hoverColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilder(
                  key: fbKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      FormTextField(
                        labelText: "И-Мэйл",
                        inputType: TextInputType.text,
                        name: 'email',
                        hintText: 'И-мэйл оруулна уу',
                        color: Theme.of(context).splashColor,
                        textColor: Theme.of(context).iconTheme.color,
                        validators: FormBuilderValidators.compose([
                          (value) {
                            return validateEmail(value.toString(), context);
                          }
                        ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FormTextField(
                        labelText: "Ургийн овог",
                        inputType: TextInputType.text,
                        name: 'familyName',
                        hintText: 'Ургын овог',
                        color: Theme.of(context).splashColor,
                        textColor: Theme.of(context).iconTheme.color,
                        validators: FormBuilderValidators.compose([
                          (value) {
                            return isValidCryllic(value.toString(), context);
                          }
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 8),
                        child: Text(
                          'Яс үндэс сонгох',
                          style: TextStyle(
                            color: Theme.of(context).hoverColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        dropdownColor:
                            Theme.of(context).colorScheme.onBackground,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Заавал оруулна уу')
                        ]),
                        icon: Container(
                          decoration: BoxDecoration(
                            color: darkGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: white,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            nationalityType = value?.id;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Яс үндэс',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).disabledColor),
                          filled: true,
                          fillColor: Theme.of(context).splashColor,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: general.nationalityTypes!
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  '${item.name}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 8),
                        child: Text(
                          'Боловсролын зэрэг сонгох',
                          style: TextStyle(
                            color: Theme.of(context).hoverColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        dropdownColor:
                            Theme.of(context).colorScheme.onBackground,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Заавал оруулна уу')
                        ]),
                        icon: Container(
                          decoration: BoxDecoration(
                            color: darkGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: white,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            educationType = value?.id;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Боловсролын зэрэг сонгоно уу',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).disabledColor),
                          filled: true,
                          fillColor: Theme.of(context).splashColor,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: general.educationTypes!
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  '${item.name}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 8),
                        child: Text(
                          'Гэрлэлтийн байдал сонгох',
                          style: TextStyle(
                            color: Theme.of(context).hoverColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        dropdownColor:
                            Theme.of(context).colorScheme.onBackground,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Заавал оруулна уу')
                        ]),
                        icon: Container(
                          decoration: BoxDecoration(
                            color: darkGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: white,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            marriageStatuses = value?.id;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Гэрлэлтийн байдал',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).disabledColor),
                          filled: true,
                          fillColor: Theme.of(context).splashColor,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: general.marriageStatuses!
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  '${item.name}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FormTextField(
                        labelText: "Ам бүлийн тоо",
                        inputType: TextInputType.number,
                        name: 'familyCount',
                        hintText: 'Ам бүлийн тоо',
                        textColor: Theme.of(context).iconTheme.color,
                        color: Theme.of(context).splashColor,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Заавал оруулна уу')
                        ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FormTextField(
                        textColor: Theme.of(context).iconTheme.color,
                        labelText: "Сарын орлого",
                        inputType: TextInputType.number,
                        name: 'incomeAmountMonth',
                        hintText: 'Сарын орлого',
                        color: Theme.of(context).splashColor,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Заавал оруулна уу')
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 8),
                        child: Text(
                          'Хүйс сонгох',
                          style: TextStyle(
                            color: Theme.of(context).hoverColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        dropdownColor:
                            Theme.of(context).colorScheme.onBackground,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Заавал оруулна уу')
                        ]),
                        icon: Container(
                          decoration: BoxDecoration(
                            color: darkGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: white,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            genderId = value?.id;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Хүйс',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).disabledColor),
                          filled: true,
                          fillColor: Theme.of(context).splashColor,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: general.genders!
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  '${item.name}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FormTextField(
                        labelText: "Төрсөн газар",
                        inputType: TextInputType.text,
                        name: 'birthPlace',
                        hintText: 'Төрсөн газар',
                        color: Theme.of(context).splashColor,
                        textColor: Theme.of(context).iconTheme.color,
                        validators: FormBuilderValidators.compose([
                          (value) {
                            return isValidCryllic(value.toString(), context);
                          }
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 8),
                        child: Text(
                          'Ажил эрхлэлтийн байдал сонгох',
                          style: TextStyle(
                            color: Theme.of(context).hoverColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        dropdownColor:
                            Theme.of(context).colorScheme.onBackground,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Заавал оруулна уу.')
                        ]),
                        icon: Container(
                          decoration: BoxDecoration(
                            color: darkGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: white,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            workStatus = value?.id;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Ажил эрхлэлтийн байдал сонгох',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).disabledColor),
                          filled: true,
                          fillColor: Theme.of(context).splashColor,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: general.workStatus!
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  '${item.name}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 8),
                  child: Text(
                    'Төрсөн өдөр сонгоно уу',
                    style: TextStyle(
                      color: Theme.of(context).hoverColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).splashColor,
                    ),
                    child: dateTime == null
                        ? Text(
                            'Төрсөн өдөр сонгоно уу',
                            style: TextStyle(
                                color: Theme.of(context).disabledColor),
                          )
                        : Text(
                            '${dateTime?.format(payload: "YYYY-MM-DD")}',
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                              fontSize: 14,
                            ),
                          ),
                  ),
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          color: white,
                          height: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Болсон"),
                              ),
                              Expanded(
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (value) {
                                    setState(() {
                                      dateTime = value;
                                      dateError = false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                if (dateError == true)
                  Container(
                    margin: EdgeInsets.only(top: 8, left: 15),
                    child: Text(
                      "Төрсөн өдөрөө оруулна уу",
                      style: TextStyle(
                        color: red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                  isLoading: isSubmit,
                  onClick: onValidate,
                  labelColor: buttonColor,
                  labelText: 'Баталгаажуулах',
                  textColor: white,
                  boxShadow: false,
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
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
