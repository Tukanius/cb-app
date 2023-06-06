import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/api/general-api.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/user.dart';
import 'package:flutter/material.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/general.dart';
import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';

class AddAddressPage extends StatefulWidget {
  static const routeName = 'AddAddressPage';
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> with AfterLayoutMixin {
  afterFirstLayout(BuildContext context) async {}

  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  String? selectedMethod;
  String? selectedProvince;
  User user = User();
  General general = General();

  onItemTapped() async {
    if (fbKey.currentState!.saveAndValidate()) {
      Customer customer = Customer.fromJson(fbKey.currentState!.value);
      customer.addressTypeId = selectedMethod;
      customer.customerId = user.customerId;
      await CustomerApi().customerAddress(customer);
      await show(context);
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
                              UserProvider().logout();
                              Navigator.of(ctx).pop();
                              Navigator.of(ctx).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Lottie.asset('images/success.json', height: 150, repeat: false),
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
          'Гэрийн хаяг нэмэх',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              child: FormBuilderDropdown(
                hint: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Оршин сууж буй хаягийн төрөл",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                icon: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.arrow_drop_down,
                    color: black,
                  ),
                ),
                name: 'addressTypeId',
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: white, width: 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: white, width: 0),
                  ),
                ),
                items: general.addressTypes!
                    .map(
                      (item) => DropdownMenuItem(
                        onTap: () {
                          selectedMethod = item.id;
                          print(selectedMethod);
                        },
                        value: item,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                '${item.name}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            FormBuilder(
              key: fbKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      inputType: TextInputType.text,
                      name: 'provinceId',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Аймаг/Хот',
                        fillColor: white,
                        filled: true,
                        enabled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                      ),
                      color: white,
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал оруулна уу')
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      inputType: TextInputType.text,
                      name: 'districtId',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Дүүрэг/Сум',
                        fillColor: white,
                        filled: true,
                        enabled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                      ),
                      color: white,
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал оруулна уу')
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      inputType: TextInputType.text,
                      name: 'khorooId',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Хороо/Баг',
                        fillColor: white,
                        filled: true,
                        enabled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                      ),
                      color: white,
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал оруулна уу')
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      inputType: TextInputType.text,
                      name: 'address',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Хаяг/Тоот',
                        fillColor: white,
                        filled: true,
                        enabled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                      ),
                      color: white,
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал оруулна уу')
                      ]),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButton(
                boxShadow: false,
                labelColor: buttonColor,
                labelText: 'Нэмэх',
                onClick: onItemTapped,
                textColor: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
