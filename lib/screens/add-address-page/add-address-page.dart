import 'package:bank_core/api/general-api.dart';
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

  General general = General();

  onItemTapped() async {
    final form = fbKey.currentState;
    if (form?.saveAndValidate() ?? false) {
      try {
        // General data = General.fromJson(form!.value);
        print('==========Province==========');
        print(selectedProvince);
        print('==========Province==========');
        // await GeneralApi().(data);
      } catch (e) {
        print('==========err==========');
        print(e.toString());
        print('==========err==========');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    general = Provider.of<GeneralProvider>(context, listen: false).general;
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
            FormBuilder(
              key: fbKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: FormBuilderDropdown(
                        hint: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              const Text(
                                "Оршин сууж буй хаягийн төрөл",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
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
                        onChanged: (value) async {
                          setState(() {
                            selectedMethod = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: white, width: 0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: white, width: 0),
                          ),
                        ),
                        items: general.addressTypes!
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: FormBuilderDropdown(
                        hint: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              const Text(
                                "Аймаг/Хот",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
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
                        name: 'provinceId',
                        onChanged: (value) async {
                          setState(() {
                            selectedMethod = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: white, width: 0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: white, width: 0),
                          ),
                        ),
                        items: general.provinces!
                            .map(
                              (item) => DropdownMenuItem(
                                onTap: () {
                                  item.name == "Улаанбаатар"
                                      ? selectedProvince = item.name
                                      : null;
                                },
                                value: item,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
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
                    SizedBox(
                      height: 20,
                    ),
                    selectedProvince == "Улаанбаатар"
                        ? Container(
                            height: 50,
                            child: FormBuilderDropdown(
                              hint: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Дүүрэг",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
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
                              name: 'districtId',
                              onChanged: (value) async {
                                setState(() {
                                  selectedMethod = value.toString();
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: white,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: white, width: 0),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: white, width: 0),
                                ),
                              ),
                              items: general.districts!
                                  .map(
                                    (item) => DropdownMenuItem(
                                      value: item,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
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
                          )
                        : Container(
                            height: 50,
                            child: FormBuilderDropdown(
                              hint: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Баг",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
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
                              name: 'districtId',
                              onChanged: (value) async {
                                setState(() {
                                  selectedMethod = value.toString();
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: white,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: white, width: 0),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: white, width: 0),
                                ),
                              ),
                              items: general.districts!
                                  .map(
                                    (item) => DropdownMenuItem(
                                      value: item,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: FormBuilderDropdown(
                        hint: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              const Text(
                                "Хороо",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
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
                        name: 'khorooId',
                        onChanged: (value) async {
                          setState(() {
                            selectedMethod = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: white, width: 0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: white, width: 0),
                          ),
                        ),
                        items: general.khoroos!
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: FormTextField(
                        inputType: TextInputType.text,
                        name: 'address',
                        hintText: 'Хаяг/Тоот',
                        color: white,
                      ),
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
