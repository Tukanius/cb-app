import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ChangeEmailPage extends StatefulWidget {
  static const routeName = 'ChangeEmailPage';
  const ChangeEmailPage({Key? key}) : super(key: key);

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage>
    with AfterLayoutMixin {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  ListenController listenController = ListenController();

  bool isLaoding = true;
  Customer customer = Customer();
  User user = User();

  @override
  afterFirstLayout(BuildContext context) async {
    customer = await CustomerApi().customerGet(user.customerId!);
    setState(() {
      isLaoding = false;
    });
  }

  void initState() {
    listenController.addListener(() async {
      customer = await CustomerApi().customerGet(user.customerId!);
      setState(() {
        isLaoding = false;
      });
    });

    super.initState();
  }

  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      setState(() {
        isLaoding = true;
      });
      try {
        customer = Customer.fromJson(fbKey.currentState!.value);
        listenController.changeVariable("refresh");
        await CustomerApi().changeEmail(user.customerId!, customer);
        showSuccess(context);
        setState(() {
          isLaoding = false;
        });
      } catch (e) {
        setState(() {
          isLaoding = false;
        });
        print(e.toString());
      }
    }
  }

  showSuccess(ctx) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 75),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Амжилттай',
                        style: TextStyle(
                            color: dark,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'И-мэйл амжилттай солигдлоо.',
                        textAlign: TextAlign.center,
                      ),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text(
                              "Буцах",
                              style: TextStyle(color: dark),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(ctx).pop();
                              Navigator.of(ctx).pop();
                              Navigator.of(ctx).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Lottie.asset('assets/lottie/success.json',
                    height: 150, repeat: false),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;
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
        centerTitle: true,
        title: Text(
          'И-мэйл солих',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: isLaoding == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : customer.result?.email == null
              ? Container(
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
                        "Бүртгэлтэй И-мэйл байхгүй байна",
                        style:
                            TextStyle(color: Theme.of(context).disabledColor),
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: FormBuilder(
                    key: fbKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FormTextField(
                          textColor: Theme.of(context).iconTheme.color,
                          labelText: "Шинэ И-мэйл оруулах",
                          inputType: TextInputType.emailAddress,
                          name: 'email',
                          hintText: "Шинэ И-мэйл оруулна уу",
                          color: Theme.of(context).splashColor,
                          validators: FormBuilderValidators.compose([
                            (value) {
                              return validateEmail(value.toString(), context);
                            }
                          ]),
                        ),
                        CustomButton(
                          isLoading: isLaoding,
                          onClick: () {
                            onSubmit();
                          },
                          boxShadow: true,
                          labelColor: buttonColor,
                          labelText: "Үргэлжлүүлэх",
                          textColor: white,
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}

String? validateEmail(String value, context) {
  RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (value.isEmpty) {
    return 'И-Мэйлээ оруулна уу';
  } else {
    if (!regex.hasMatch(value)) {
      return 'И-Мэйл буруу байна';
    } else {
      return null;
    }
  }
}
