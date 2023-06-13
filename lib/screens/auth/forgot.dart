import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/screens/otp/otp-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ForgotPage extends StatefulWidget {
  static const routeName = 'ForgotPage';
  const ForgotPage({Key? key}) : super(key: key);

  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  bool isSubmit = false;

  onSubmit() {
    if (fbKey.currentState!.saveAndValidate()) {
      setState(() {
        isSubmit = true;
      });
      Navigator.of(context).pushNamed(OtpVerifyPage.routeName,
          arguments: OtpVerifyPageArguments(
              username: fbKey.currentState?.value["email"]));
      print(fbKey.currentState!.value);
      setState(() {
        isSubmit = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SafeArea(
        bottom: true,
        child: Scaffold(
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
              'Нууц үг сэргээх',
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: FormBuilder(
              key: fbKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormTextField(
                    labelText: "И-Мейл",
                    inputType: TextInputType.emailAddress,
                    name: 'email',
                    hintText: "И-Мейлээ оруулна уу",
                    color: darkGrey,
                    validators: FormBuilderValidators.compose([
                      (value) {
                        return validateEmail(value.toString(), context);
                      }
                    ]),
                  ),
                  CustomButton(
                    labelColor: buttonColor,
                    labelText: "Үргэлжлүүлэх",
                    onClick: () {
                      if (isSubmit == false) {
                        onSubmit();
                      }
                    },
                    textColor: white,
                    boxShadow: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String value, context) {
  RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (value.isEmpty) {
    return 'И-Мейлээ оруулна уу';
  } else {
    if (!regex.hasMatch(value)) {
      return 'И-Мейлээ шалгана уу';
    } else {
      return null;
    }
  }
}
