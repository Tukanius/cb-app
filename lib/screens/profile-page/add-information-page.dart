import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class AddInformationPage extends StatefulWidget {
  static const routeName = 'AddInformationPage';
  const AddInformationPage({Key? key}) : super(key: key);

  @override
  State<AddInformationPage> createState() => _AddInformationPageState();
}

class _AddInformationPageState extends State<AddInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
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
          "Нэмэлт мэдээлэл бөглөх",
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
