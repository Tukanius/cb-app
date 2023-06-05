import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/auth/login.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'RegisterPage';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with AfterLayoutMixin {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  User user = User();

  String datepickervalue = "";

  @override
  afterFirstLayout(BuildContext context) async {}

  onItemTapped() async {
    final form = fbKey.currentState;
    if (form?.saveAndValidate() ?? false) {
      try {
        print("12312321312");
        User data = User.fromJson(form!.value);
        data.birthDate = datepickervalue;
        await Provider.of<UserProvider>(context, listen: false).register(data);
        Navigator.of(context).pushNamed(LoginScreen.routeName);
      } catch (e) {
        print('==========err==========');
        print(e.toString());
        print('==========err==========');
      }
    }
  }
  // onSubmit() async {
  //   if (fbKey.currentState!.saveAndValidate()) {
  //     User data = User.fromJson(fbKey.currentState!.value);
  //   }
  // }

  bool isVisible = true;
  bool isVisible1 = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              color: white,
              size: 10,
            ),
          ),
        ),
        title: Text(
          'Бүртгүүлэх',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('images/register.json', height: 150),
            SizedBox(
              height: 50,
            ),
            FormBuilder(
              key: fbKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    FormTextField(
                      name: 'lastName',
                      hintText: 'Овог',
                      color: white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTextField(
                      name: 'firstName',
                      hintText: 'Нэр',
                      color: white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTextField(
                      name: 'registerNo',
                      hintText: 'Регистер №',
                      color: white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTextField(
                      name: 'phone',
                      hintText: 'Утасны дугаар',
                      color: white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTextField(
                      name: 'email',
                      hintText: 'И-мэйл хаяг',
                      color: white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(15),
                    //   height: MediaQuery.of(context).size.width / 3,
                    //   child: Center(
                    //     child: TextField(
                    //       controller: dateInput,
                    //       //editing controller of this TextField
                    //       decoration: InputDecoration(
                    //           icon: Icon(
                    //               Icons.calendar_today), //icon of text field
                    //           labelText:
                    //               "Төрсөн он, сар, өдөр" //label text of field
                    //           ),
                    //       readOnly: true,
                    //       //set it true, so that user will not able to edit text
                    //       onTap: () async {
                    //         DateTime? pickedDate = await showDatePicker(
                    //             context: context,
                    //             initialDate: DateTime.now(),
                    //             firstDate: DateTime(1950),
                    //             //DateTime.now() - not to allow to choose before today.
                    //             lastDate: DateTime(2100));

                    //         if (pickedDate != null) {
                    //           print(
                    //               pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    //           String formattedDate =
                    //               DateFormat('yyyy-MM-dd').format(pickedDate);
                    //           print(
                    //               formattedDate); //formatted date output using intl package =>  2021-03-16
                    //           setState(() {
                    //             dateInput.text =
                    //                 formattedDate; //set output date to TextField value.
                    //           });
                    //         } else {}
                    //       },
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
                          setState(() {
                            datepickervalue = formattedDate;
                          });
                        } else {}
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: datepickervalue == ''
                            ? Text(
                                'Төрсөн он, сар, өдөр',
                                style: TextStyle(color: darkGrey),
                              )
                            : Text(
                                datepickervalue,
                                style: TextStyle(color: darkGrey),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTextField(
                      obscureText: isVisible1,
                      name: 'password',
                      hintText: 'Нууц үг',
                      color: white,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible1 = !isVisible1;
                          });
                        },
                        icon: isVisible1 == true
                            ? Icon(
                                Icons.visibility,
                                color: darkGrey,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: darkGrey,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTextField(
                      name: 'password_verify',
                      hintText: 'Нууц үг давтан оруулна уу',
                      color: white,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: isVisible == true
                            ? Icon(
                                Icons.visibility,
                                color: darkGrey,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: darkGrey,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButton(
                onClick: onItemTapped,
                labelColor: buttonColor,
                labelText: 'Бүртгүүлэх',
                boxShadow: false,
                textColor: white,
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
