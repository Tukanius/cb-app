import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/general.dart';
import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';

class AddAddressPageArguments {
  ListenController listenController;
  AddAddressPageArguments({
    required this.listenController,
  });
}

class AddAddressPage extends StatefulWidget {
  static const routeName = 'AddAddressPage';
  final ListenController listenController;
  const AddAddressPage({Key? key, required this.listenController})
      : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> with AfterLayoutMixin {
  afterFirstLayout(BuildContext context) async {}

  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  String? selectedMethod;
  User user = User();
  General general = General();
  Customer customer = Customer();

  onItemTapped() async {
    if (fbKey.currentState!.saveAndValidate()) {
      try {
        customer = Customer.fromJson(fbKey.currentState!.value);
        customer.addressTypeId = selectedMethod;
        customer.customerId = user.customerId;
        await CustomerApi().customerAddress(customer);
        widget.listenController.changeVariable("addAddress");
        await show(context);
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
    general = Provider.of<GeneralProvider>(context, listen: true).general;
    user = Provider.of<UserProvider>(context, listen: true).user;
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
        child: FormBuilder(
          key: fbKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 20),
                  child: Text(
                    'Хаяг',
                    style: TextStyle(
                      color: white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DropdownButtonFormField(
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
                      selectedMethod = value?.id;
                    });
                  },
                  dropdownColor: mainColor,
                  elevation: 2,
                  decoration: InputDecoration(
                    hintText: 'Оршин сууж байгаа хаягын төрөл',
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
                  items: general.addressTypes!
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            '${item.name}',
                            style: TextStyle(
                              color: white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                FormTextField(
                  labelText: "Аймаг / Хот",
                  inputType: TextInputType.text,
                  name: 'provinceId',
                  hintText: 'Аймаг / Хот',
                  color: darkGrey,
                  validators: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Заавал оруулна уу')
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                FormTextField(
                  labelText: "Сум / Дүүрэг",
                  inputType: TextInputType.text,
                  hintText: 'Сум / Дүүрэг',
                  name: 'districtId',
                  color: darkGrey,
                  validators: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Заавал оруулна уу')
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                FormTextField(
                  labelText: "Баг / Хороо",
                  inputType: TextInputType.text,
                  name: 'khorooId',
                  hintText: 'Баг / Хороо',
                  color: darkGrey,
                  validators: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Заавал оруулна уу')
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                FormTextField(
                  labelText: "Тоот",
                  inputType: TextInputType.text,
                  hintText: "Тоот",
                  name: 'address',
                  color: darkGrey,
                  validators: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Заавал оруулна уу')
                  ]),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
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
        ),
      ),
    );
  }
}
