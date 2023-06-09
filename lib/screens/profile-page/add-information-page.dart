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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';

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

  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      try {
        customer = Customer.fromJson(fbKey.currentState!.value);
        customer.nationalityTypeId = nationalityType;
        customer.educationTypeId = educationType;
        customer.marriageStatusId = marriageStatuses;
        customer.genderId = genderId;
        customer.workStatusId = workStatus;
        await CustomerApi().profileUpdate(user.customerId!, customer);
        widget.listenController.changeVariable('refresh');
        await show(context);
      } catch (e) {}
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
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
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
            color: white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
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
                      labelText: "Ургийн овог",
                      inputType: TextInputType.text,
                      name: 'familyName',
                      hintText: 'Ургын овог',
                      color: darkGrey,
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал оруулна уу')
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8, top: 8),
                      child: Text(
                        'Яс үндэс сонгох',
                        style: TextStyle(
                          color: white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      dropdownColor: mainColor,
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
                        hintStyle: TextStyle(fontSize: 14, color: greyDark),
                        filled: true,
                        fillColor: darkGrey,
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
                                  color: white,
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
                          color: white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      dropdownColor: mainColor,
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
                        hintStyle: TextStyle(fontSize: 14, color: greyDark),
                        filled: true,
                        fillColor: darkGrey,
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
                                  color: white,
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
                          color: white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      dropdownColor: mainColor,
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
                        hintStyle: TextStyle(fontSize: 14, color: greyDark),
                        filled: true,
                        fillColor: darkGrey,
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
                                  color: white,
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
                      color: darkGrey,
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал оруулна уу')
                      ]),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    FormTextField(
                      labelText: "Сарын орлого",
                      inputType: TextInputType.number,
                      name: 'incomeAmountMonth',
                      hintText: 'Сарын орлого',
                      color: darkGrey,
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
                          color: white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      dropdownColor: mainColor,
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
                        hintStyle: TextStyle(fontSize: 14, color: greyDark),
                        filled: true,
                        fillColor: darkGrey,
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
                                  color: white,
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
                      color: darkGrey,
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал оруулна уу')
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8, top: 8),
                      child: Text(
                        'Ажил эрхлэлтийн байдал сонгох',
                        style: TextStyle(
                          color: white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      dropdownColor: mainColor,
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
                        hintStyle: TextStyle(fontSize: 14, color: greyDark),
                        filled: true,
                        fillColor: darkGrey,
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
                                  color: white,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                onClick: onSubmit,
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
    );
  }
}
