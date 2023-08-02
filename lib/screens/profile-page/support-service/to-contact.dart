import 'package:bank_core/api/general-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class ToContact extends StatefulWidget {
  static const routeName = 'ToContact';
  const ToContact({Key? key}) : super(key: key);

  @override
  State<ToContact> createState() => _ToContactState();
}

class _ToContactState extends State<ToContact> with AfterLayoutMixin {
  bool isLoading = true;
  Contact contact = Contact();

  @override
  void afterFirstLayout(BuildContext context) async {
    contact = await GeneralApi().contactList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        centerTitle: true,
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
        title: Text(
          " Холбоо барих",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).splashColor,
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Утас:',
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "${contact.phoneNumber}",
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).splashColor,
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'И-мэйл:',
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "${contact.email}",
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).splashColor,
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Хаяг:',
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "${contact.address}",
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
