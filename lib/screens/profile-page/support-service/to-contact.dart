import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class ToContact extends StatefulWidget {
  static const routeName = 'ToContact';
  const ToContact({super.key});

  @override
  State<ToContact> createState() => _ToContactState();
}

class _ToContactState extends State<ToContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
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
              color: white,
              size: 10,
            ),
          ),
        ),
        title: Text(
          " Холбоо барих",
          style: TextStyle(
            fontSize: 16,
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: darkGrey,
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Утас:',
                    style: TextStyle(
                      color: grey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Null",
                    style: TextStyle(
                      color: white,
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
                color: darkGrey,
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'И-мэйл:',
                    style: TextStyle(
                      color: grey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Null",
                    style: TextStyle(
                      color: white,
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
                color: darkGrey,
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Хаяг:',
                    style: TextStyle(
                      color: grey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Null",
                    style: TextStyle(
                      color: white,
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
