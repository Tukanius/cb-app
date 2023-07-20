import 'package:bank_core/components/action-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';

class ChangeEmailPage extends StatefulWidget {
  static const routeName = 'ChangeEmailPage';
  const ChangeEmailPage({Key? key}) : super(key: key);

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          automaticallyImplyLeading: false,
          elevation: 0,
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
            'И-мэйл солих',
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Container(
          height: 300,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Lottie.asset('assets/lottie/empty.json', height: 100),
              SizedBox(
                height: 15,
              ),
              Text(
                "Тун удахгүй.",
                style: TextStyle(color: Theme.of(context).disabledColor),
              ),
            ],
          ),
        )
        // GestureDetector(
        //   onTap: () => FocusScope.of(context).unfocus(),
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 15),
        //     child: FormBuilder(
        //       key: fbKey,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Column(
        //             children: [
        //               SizedBox(
        //                 height: 30,
        //               ),
        //               FormTextField(
        //                 textColor: Theme.of(context).iconTheme.color,
        //                 labelText: "Шинэ И-мэйл оруулах",
        //                 inputType: TextInputType.emailAddress,
        //                 name: 'newEmail',
        //                 hintText: "Шинэ И-мэйл оруулна уу",
        //                 color: Theme.of(context).splashColor,
        //                 validators: FormBuilderValidators.compose([
        //                   FormBuilderValidators.required(
        //                       errorText: "И-мэйл оруулна уу"),
        //                 ]),
        //               ),
        //             ],
        //           ),
        //           Container(
        //             margin: const EdgeInsets.only(bottom: 30),
        //             child: CustomButton(
        //               isLoading: false,
        //               onClick: () {},
        //               boxShadow: true,
        //               labelColor: buttonColor,
        //               labelText: "Үргэлжлүүлэх",
        //               textColor: white,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
