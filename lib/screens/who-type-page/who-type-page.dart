import 'package:bank_core/api/auth-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/general.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class WhoTypePage extends StatefulWidget {
  static const routeName = 'WhoTypePage';
  const WhoTypePage({Key? key}) : super(key: key);

  @override
  State<WhoTypePage> createState() => _WhoTypePageState();
}

class _WhoTypePageState extends State<WhoTypePage> {
  GlobalKey<FormBuilderState> fbkey = GlobalKey<FormBuilderState>();
  String? selectedValue;
  String? whoTypeId;
  General general = General();
  User user = User();

  onSubmit() async {
    User save = User.fromJson(fbkey.currentState!.value);
    save.customerId = user.customerId;
    save.whoTypeId = whoTypeId;
    print('=======CustomerId======');
    print(user.customerId.toString());
    print('=======CustomerId======');
    // user = selectedValue.toString() as User;
    await AuthApi().createRelatedPerson(save);
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
              size: 12,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Холбоо хамааралтай хүн нэмэх',
              style: TextStyle(
                color: white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            FormBuilder(
              key: fbkey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    child: FormBuilderDropdown(
                      hint: Container(
                        child: Row(
                          children: [
                            const Text(
                              "Сонгох",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
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
                      name: 'whoTypes',
                      onChanged: (value) async {
                        setState(() {
                          selectedValue = value.toString();
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: white, width: 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: white, width: 0),
                        ),
                      ),
                      items: general.whoTypes!
                          .map(
                            (item) => DropdownMenuItem(
                              onTap: () {
                                setState(() {
                                  whoTypeId = item.id;
                                });
                              },
                              value: item,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: FormTextField(
                      name: 'lastName',
                      color: white,
                      hintText: 'Овог',
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: FormTextField(
                      name: 'firstName',
                      color: white,
                      hintText: 'Нэр',
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: FormTextField(
                      name: 'phone',
                      color: white,
                      hintText: 'Утасны дугаар',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
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
