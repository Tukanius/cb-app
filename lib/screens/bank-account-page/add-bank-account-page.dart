import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/banks.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/general.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddBankAccountPageArguments {
  ListenController listenController;
  AddBankAccountPageArguments({
    required this.listenController,
  });
}

class AddBankAccountPage extends StatefulWidget {
  static const routeName = 'AddBankAccountPage';
  final ListenController listenController;
  AddBankAccountPage({Key? key, required this.listenController})
      : super(key: key);

  @override
  State<AddBankAccountPage> createState() => _AddBankAccountPageState();
}

class _AddBankAccountPageState extends State<AddBankAccountPage> {
  TextEditingController textController = TextEditingController();
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  General general = General();
  User user = User();
  Banks bank = Banks();
  Customer save = Customer();

  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      try {
        save = Customer.fromJson(fbKey.currentState!.value);
        save.customerId = user.customerId;
        save.bankId = bank.id;
        await CustomerApi().createBankAccount(save);
        widget.listenController.changeVariable("refresh");
        await show(context);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  show(ctx) async {
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
                        'Данс ажилттай холбогдлоо.',
                        textAlign: TextAlign.center,
                      ),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              "Дуусгах",
                              style: TextStyle(color: dark),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
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
    general = Provider.of<GeneralProvider>(context, listen: false).general;
    user = Provider.of<UserProvider>(context, listen: false).user;

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
          'Данс холбох',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: FormBuilder(
            key: fbKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 20),
                  child: Text(
                    'Банк сонгох',
                    style: TextStyle(
                      color: white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DropdownButtonFormField(
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Банкаа оруулна уу.')
                  ]),
                  icon: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: black,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      bank.id = value?.id;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Банк сонгоно уу',
                    hintStyle: TextStyle(fontSize: 14),
                    filled: true,
                    fillColor: white,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: white, width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: general.banks!
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            '${item.name}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                FormTextField(
                  labelText: "Дансны дугаар",
                  name: 'accountNumber',
                  hintText: 'Дансны дугаараа оруулна уу',
                  color: white,
                  validators: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Дансаа оруулна уу.')
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CustomButton(
                    boxShadow: false,
                    labelColor: buttonColor,
                    labelText: 'Нэмэх',
                    onClick: onSubmit,
                    textColor: white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
