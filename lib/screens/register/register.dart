import 'package:bank_core/components/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:bank_core/api/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  static const routeName = "RegisterPage";
  final Function? onSubmit;
  final User? user;
  final bool? isLoading;
  const Register({Key? key, this.user, this.onSubmit, this.isLoading})
      : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showPassword = true;
  bool showconfirmPassword = true;
  bool _isVisible = true;
  bool _isVisible1 = true;
  bool isSubmit = false;
  bool _isPasswordEightCharacters = false;
  bool _hasUptext = false;
  bool _hasPasswordOneNumber = false;
  bool ternAndCondition = false;
  ScrollController scrollController = ScrollController();
  String? gender;
  String? age;
  User me = User();
  String? pVal;
  DateTime? date;

  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  // onSubmit() async {
  //   if (fbKey.currentState!.saveAndValidate()) {
  //     try {
  //       setState(() {
  //         isSubmit = true;
  //       });
  //       User data = User.fromJson(fbKey.currentState!.value);
  //       User res = await Provider.of<UserProvider>(context, listen: false)
  //           .register(data);
  //     } catch (e) {
  //       debugPrint(e.toString());
  //       setState(() {
  //         isSubmit = false;
  //       });
  //     }
  //   }
  // }
  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      try {
        setState(() {
          isSubmit = true;
        });
        User data = User.fromJson(
          fbKey.currentState!.value,
        );
        await AuthApi().register(data);
      } catch (e) {
        debugPrint(e.toString());
        setState(() {
          isSubmit = false;
        });
      }
    }
  }

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(7),
          decoration: ShapeDecoration(
            color: Colors.grey.shade700,
            shape: CircleBorder(side: BorderSide(color: Colors.grey.shade500)),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 15,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Бүртгэл",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: FormBuilder(
                key: fbKey,
                child: Column(
                  children: [
                    FormTextField(
                      name: "firstName",
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
                        hintText: "Овог",
                        fillColor: Colors.white,
                      ),
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал бөглөх')
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormTextField(
                      name: "lastName",
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
                        hintText: "Нэр",
                        fillColor: Colors.white,
                      ),
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал бөглөх')
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // FormTextField(
                    //   name: "familyName",
                    //   inputAction: TextInputAction.next,
                    //   textCapitalization: TextCapitalization.none,
                    //   decoration: InputDecoration(
                    //     enabled: true,
                    //     counterText: "",
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         horizontal: 10, vertical: 5),
                    //     prefixIconColor: Colors.green,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     disabledBorder: InputBorder.none,
                    //     filled: true,
                    //     hintStyle: const TextStyle(
                    //         color: Colors.black54, fontSize: 14),
                    //     hintText: "Ургын овог",
                    //     fillColor: Colors.white,
                    //   ),
                    //   validators: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(
                    //         errorText: 'Заавал бөглөх')
                    //   ]),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    FormBuilderField(
                      name: "birthDate",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: "Заавал бөглөнө",
                        ),
                      ]),
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Төрсөн он сар өдөр",
                            errorText: field.errorText,
                          ),
                          child: date == null
                              ? InkWell(
                                  onTap: () => _showDialog(
                                    CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (DateTime newDate) {
                                        setState(() => date = newDate);
                                        String formattedDate =
                                            DateFormat('yyyy/MM/dd')
                                                .format(date!);
                                        setState(() {
                                          field.didChange(formattedDate);
                                        });
                                      },
                                    ),
                                  ),
                                  child: Container(
                                    height: 47,
                                    padding: const EdgeInsets.only(left: 0),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Төрсөн он сар өдөр',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : CupertinoButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () => _showDialog(
                                    CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (DateTime newDate) {
                                        setState(() => date = newDate);
                                        setState(() {
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(date!);
                                          field.didChange(formattedDate);
                                        });
                                      },
                                    ),
                                  ),
                                  child: Container(
                                    height: 47,
                                    padding: const EdgeInsets.only(left: 0),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${date!.year} - ${date!.month} - ${date!.day}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormTextField(
                      name: "registerNo",
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
                        hintText: "Регистерийн дугаар",
                        fillColor: Colors.white,
                      ),
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал бөглөх')
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormTextField(
                      name: "phone",
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
                        hintText: "Утасны дугаар",
                        fillColor: Colors.white,
                      ),
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал бөглөх')
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                        hintText: "И-мэйл",
                        fillColor: Colors.white,
                      ),
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал бөглөх')
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // FormTextField(
                    //   name: "signature",
                    //   inputAction: TextInputAction.next,
                    //   textCapitalization: TextCapitalization.none,
                    //   decoration: InputDecoration(
                    //     enabled: true,
                    //     counterText: "",
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         horizontal: 10, vertical: 5),
                    //     prefixIconColor: Colors.green,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     disabledBorder: InputBorder.none,
                    //     filled: true,
                    //     hintStyle: const TextStyle(
                    //         color: Colors.black54, fontSize: 14),
                    //     hintText: "Гарын үсэг",
                    //     fillColor: Colors.white,
                    //   ),
                    //   validators: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(
                    //         errorText: 'Заавал бөглөх')
                    //   ]),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // FormTextField(
                    //   name: "educationType",
                    //   inputAction: TextInputAction.next,
                    //   textCapitalization: TextCapitalization.none,
                    //   decoration: InputDecoration(
                    //     enabled: true,
                    //     counterText: "",
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         horizontal: 10, vertical: 5),
                    //     prefixIconColor: Colors.green,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     disabledBorder: InputBorder.none,
                    //     filled: true,
                    //     hintStyle: const TextStyle(
                    //         color: Colors.black54, fontSize: 14),
                    //     hintText: "Боловсрол",
                    //     fillColor: Colors.white,
                    //   ),
                    //   validators: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(
                    //         errorText: 'Заавал бөглөх')
                    //   ]),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),

                    // FormTextField(
                    //   name: "marriageStatus",
                    //   inputAction: TextInputAction.next,
                    //   textCapitalization: TextCapitalization.none,
                    //   decoration: InputDecoration(
                    //     enabled: true,
                    //     counterText: "",
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         horizontal: 10, vertical: 5),
                    //     prefixIconColor: Colors.green,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     disabledBorder: InputBorder.none,
                    //     filled: true,
                    //     hintStyle: const TextStyle(
                    //         color: Colors.black54, fontSize: 14),
                    //     hintText: "Гэрлэсэн эсэх",
                    //     fillColor: Colors.white,
                    //   ),
                    //   validators: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(
                    //         errorText: 'Заавал бөглөх')
                    //   ]),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // FormTextField(
                    //   name: "familyCount",
                    //   inputAction: TextInputAction.next,
                    //   textCapitalization: TextCapitalization.none,
                    //   decoration: InputDecoration(
                    //     enabled: true,
                    //     counterText: "",
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         horizontal: 10, vertical: 5),
                    //     prefixIconColor: Colors.green,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     disabledBorder: InputBorder.none,
                    //     filled: true,
                    //     hintStyle: const TextStyle(
                    //         color: Colors.black54, fontSize: 14),
                    //     hintText: "Гэр бүлийн тоо",
                    //     fillColor: Colors.white,
                    //   ),
                    //   validators: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(
                    //         errorText: 'Заавал бөглөх')
                    //   ]),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // FormTextField(
                    //   name: "incomeAmountMonth",
                    //   inputAction: TextInputAction.next,
                    //   textCapitalization: TextCapitalization.none,
                    //   decoration: InputDecoration(
                    //     enabled: true,
                    //     counterText: "",
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         horizontal: 10, vertical: 5),
                    //     prefixIconColor: Colors.green,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     disabledBorder: InputBorder.none,
                    //     filled: true,
                    //     hintStyle: const TextStyle(
                    //         color: Colors.black54, fontSize: 14),
                    //     hintText: "Сарын орлого",
                    //     fillColor: Colors.white,
                    //   ),
                    //   validators: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(
                    //         errorText: 'Заавал бөглөх')
                    //   ]),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // FormTextField(
                    //   name: "avatar",
                    //   inputAction: TextInputAction.next,
                    //   textCapitalization: TextCapitalization.none,
                    //   decoration: InputDecoration(
                    //     enabled: true,
                    //     counterText: "",
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         horizontal: 10, vertical: 5),
                    //     prefixIconColor: Colors.green,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     disabledBorder: InputBorder.none,
                    //     filled: true,
                    //     hintStyle: const TextStyle(
                    //         color: Colors.black54, fontSize: 14),
                    //     hintText: "Avatar",
                    //     fillColor: Colors.white,
                    //   ),
                    //   validators: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(
                    //         errorText: 'Заавал бөглөх')
                    //   ]),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // FormTextField(
                    //   name: "nationalityType",
                    //   inputAction: TextInputAction.next,
                    //   textCapitalization: TextCapitalization.none,
                    //   decoration: InputDecoration(
                    //     enabled: true,
                    //     counterText: "",
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         horizontal: 10, vertical: 5),
                    //     prefixIconColor: Colors.green,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     disabledBorder: InputBorder.none,
                    //     filled: true,
                    //     hintStyle: const TextStyle(
                    //         color: Colors.black54, fontSize: 14),
                    //     hintText: "nationalityType",
                    //     fillColor: Colors.white,
                    //   ),
                    //   validators: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(
                    //         errorText: 'Заавал бөглөх')
                    //   ]),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // FormTextField(
                    //   name: "genderId",
                    //   inputAction: TextInputAction.next,
                    //   textCapitalization: TextCapitalization.none,
                    //   decoration: InputDecoration(
                    //     enabled: true,
                    //     counterText: "",
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         horizontal: 10, vertical: 5),
                    //     prefixIconColor: Colors.green,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     disabledBorder: InputBorder.none,
                    //     filled: true,
                    //     hintStyle: const TextStyle(
                    //         color: Colors.black54, fontSize: 14),
                    //     hintText: "Хүйс",
                    //     fillColor: Colors.white,
                    //   ),
                    //   validators: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(
                    //         errorText: 'Заавал бөглөх')
                    //   ]),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // FormTextField(
                    //   name: "birthPlace",
                    //   inputAction: TextInputAction.next,
                    //   textCapitalization: TextCapitalization.none,
                    //   decoration: InputDecoration(
                    //     enabled: true,
                    //     counterText: "",
                    //     contentPadding: const EdgeInsets.symmetric(
                    //         horizontal: 10, vertical: 5),
                    //     prefixIconColor: Colors.green,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     disabledBorder: InputBorder.none,
                    //     filled: true,
                    //     hintStyle: const TextStyle(
                    //         color: Colors.black54, fontSize: 14),
                    //     hintText: "Төрсөн газар",
                    //     fillColor: Colors.white,
                    //   ),
                    //   validators: FormBuilderValidators.compose([
                    //     FormBuilderValidators.required(
                    //         errorText: 'Заавал бөглөх')
                    //   ]),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    FormTextField(
                      name: "birthPlaceNote",
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
                        hintText: "Гэрийн хаяг",
                        fillColor: Colors.white,
                      ),
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал бөглөх')
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

                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButton(
                        labelText: 'Бүртгүүлэх',
                        color: buttonColor,
                        textColor: Colors.white,
                        onClick: () {
                          onSubmit();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
