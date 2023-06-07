import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/general.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class AddBankAccountPage extends StatefulWidget {
  static const routeName = 'AddBankAccountPage';
  const AddBankAccountPage({Key? key}) : super(key: key);

  @override
  State<AddBankAccountPage> createState() => _AddBankAccountPageState();
}

class _AddBankAccountPageState extends State<AddBankAccountPage> {
  String? selectedMethod;
  TextEditingController textController = TextEditingController();
  General general = General();
  User user = User();

  Customer save = Customer();

  onSubmit() async {
    try {
      save.bankId = selectedMethod;
      save.customerId = user.customerId;
      save.accountNumber = textController.text;
      await CustomerApi().createBankAccount(save);
      await show(context);
    } catch (e) {
      print(e.toString());
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
          'Данс холбох',
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
            Container(
              margin: const EdgeInsets.only(left: 15, bottom: 10, top: 20),
              child: Text(
                'Банк сонгох',
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              child: FormBuilderDropdown(
                initialValue: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Банк сонгох",
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
                name: 'paymentMethod',
                onChanged: (value) async {
                  setState(() {
                    // selectedMethod = value.toString();
                    // print(selectedMethod);
                  });
                },
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
                items: general.banks!
                    .map(
                      (item) => DropdownMenuItem(
                        onTap: () {
                          setState(() {
                            selectedMethod = item.id;
                            print(selectedMethod);
                          });
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
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: FormTextField(
                controller: textController,
                name: 'BankAccount',
                hintText: 'Дансны дугаараа оруулна уу',
                color: white,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButton(
                boxShadow: false,
                labelColor: buttonColor,
                labelText: 'Нэмэх',
                onClick: () {
                  onSubmit();
                },
                textColor: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
