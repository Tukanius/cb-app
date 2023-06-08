import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/notification-card/notification-card.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = 'NotificationPage';
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Мэдэгдэл',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ActionButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: white,
              size: 10,
            ),
            onClick: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                children: ["", "", "", "", ""]
                    .map((e) => Column(
                          children: [
                            NotificationCard(),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
