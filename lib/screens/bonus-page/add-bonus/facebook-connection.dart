import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FacebookAuth extends StatefulWidget {
  static const routeName = 'FacebookAuth';
  const FacebookAuth({super.key});

  @override
  State<FacebookAuth> createState() => _FacebookAuthState();
}

class _FacebookAuthState extends State<FacebookAuth> {
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
          'Facebook холбох',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          Lottie.asset(
            'assets/lottie/facebook.json',
            height: 150,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Text('Та Facebook account-аа холбосноор 10 оноо авах юм.'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              boxShadow: true,
              labelColor: buttonColor,
              labelText: 'Холбох',
            ),
          ),
        ],
      ),
    );
  }
}
