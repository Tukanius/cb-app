import 'package:bank_core/models/customer_account.dart';
import 'package:bank_core/models/general.dart';
import 'package:bank_core/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:bank_core/widget/form_textfield.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/api/auth.dart';
import '../../../widget/custon_button.dart';
import '../../splash/index.dart';
import 'package:provider/provider.dart';
import 'package:bank_core/provider/user_provider.dart';

import 'package:after_layout/after_layout.dart';

class Bank extends StatefulWidget {
  const Bank({super.key});

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> with AfterLayoutMixin {
  @override
  afterFirstLayout(BuildContext context) async {
    print(general.toJson());
  }

  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      // print({...fbKey.currentState!.value, "isOriginal": 1});
      try {
        setState(() {
          isSubmit = true;
        });
        CustomerAccount data =
            CustomerAccount.fromJson(fbKey.currentState!.value);
        data.isOriginal = "1";
        await AuthApi().bankAccount(data);
        // CustomerAccount res = await Provider.of<UserProvider>(context, listen: false)
        //     .register(data);
        // await AuthApi().bankAccount(data);

        Navigator.of(context).pushNamed(SplashPage.routeName);
      } catch (e) {
        debugPrint(e.toString());
        setState(() {
          isSubmit = false;
        });
      }
    }
  }

  @override
  bool isSubmit = false;
  Bank bank = Bank();
  General general = General();
  User user = User();
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  User me = User();
  @override
  Widget build(BuildContext context) {
    me = Provider.of<UserProvider>(context, listen: true).user;
    general = Provider.of<GeneralProvider>(context, listen: true).general;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        automaticallyImplyLeading: false,
        elevation: 1,
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
              size: 13,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Данс холбох",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                  child: Text(
                    'Банк сонгох',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: FormBuilder(
                key: fbKey,
                initialValue: {
                  "bankId": null,
                  "accountNumber": null,
                  "isOriginal": 1
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade400),
                      child: FormBuilderDropdown(
                        name: 'bankId',
                        items: general.banks!
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text("${e.name}"),
                                value: e.id,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    FormTextField(
                      name: "accountNumber",
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
                        hintText: "Дансны дугаараа оруулна уу",
                        fillColor: Colors.white,
                      ),
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал бөглөх')
                      ]),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomButton(
                labelText: 'Данс нэмэх',
                color: Colors.greenAccent,
                textColor: Colors.white,
                onClick: () {
                  onSubmit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
