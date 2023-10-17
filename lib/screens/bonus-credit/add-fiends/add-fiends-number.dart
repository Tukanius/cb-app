import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_sms/flutter_sms.dart';

class InviteFriends extends StatefulWidget {
  static const routeName = 'InviteFriends';
  const InviteFriends({super.key});

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  final TextEditingController phoneController = TextEditingController();
  List<String> number = [""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Найзаа урих',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Урих найзынхаа утасны дугаарыг оруулна уу.'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: FormTextField(
                    textColor: Theme.of(context).iconTheme.color,
                    labelText: "Утасны дугаар",
                    inputType: TextInputType.text,
                    name: 'phone',
                    controller: phoneController,
                    hintText: 'Утасны дугаар',
                    validators: FormBuilderValidators.compose([
                      (value) {
                        return validatePhone(value.toString(), context);
                      }
                    ]),
                    color: Theme.of(context).splashColor,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                String input = phoneController.text;
                List<String> newRecipients = input.split(',');
                newRecipients =
                    newRecipients.map((recipient) => recipient.trim()).toList();
                setState(() {
                  number = newRecipients;
                });
                sendSMS(
                    message:
                        'Та T-Wallet app-д бүртгүүлж, гэрээ байгуулсан тохиолдолд 100 бонус оноо бэлэглэнэ.',
                    recipients: newRecipients);
              },
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: buttonColor),
                child: Center(
                  child: Text(
                    'Урих',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
