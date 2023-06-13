import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
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
import 'package:bank_core/api/customer-api.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddWhoTypePageArguments {
  ListenController listenController;
  AddWhoTypePageArguments({
    required this.listenController,
  });
}

class AddWhoTypePage extends StatefulWidget {
  static const routeName = 'AddWhoTypePage';
  final ListenController listenController;
  const AddWhoTypePage({Key? key, required this.listenController})
      : super(key: key);

  @override
  State<AddWhoTypePage> createState() => _WhoTypePageState();
}

class _WhoTypePageState extends State<AddWhoTypePage> {
  GlobalKey<FormBuilderState> fbkey = GlobalKey<FormBuilderState>();
  String? selectedValue;
  String? whoTypeId;
  General general = General();
  User user = User();
  bool isSubmit = false;

  onSubmit() async {
    if (fbkey.currentState!.saveAndValidate()) {
      try {
        setState(() {
          isSubmit = true;
        });
        User save = User.fromJson(fbkey.currentState!.value);
        save.customerId = user.customerId;
        save.whoTypeId = whoTypeId;
        await CustomerApi().createRelatedPerson(save);
        widget.listenController.changeVariable("whotypes");
        await show(context);
      } catch (e) {
        debugPrint(e.toString());
        setState(() {
          isSubmit = false;
        });
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
                        'Холбоо хамаарлын мэдээлэл амжилттай нэмэгдлээ.',
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
              size: 10,
              color: white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Холбоо хамааралтай хүн нэмэх',
                style: TextStyle(
                  color: white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FormBuilder(
                key: fbkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Таны хэн болох ?",
                        style: TextStyle(
                            color: white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    FormBuilderDropdown(
                      dropdownColor: mainColor,
                      initialValue: 'Холбоо хамаарал сонгох',
                      icon: Container(
                        decoration: BoxDecoration(
                          color: darkGrey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.arrow_drop_down,
                          color: white,
                        ),
                      ),
                      name: 'whoTypes',
                      onChanged: (value) async {
                        setState(() {
                          selectedValue = value.toString();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Холбоо хамаарал сонгох',
                        hintStyle: TextStyle(fontSize: 14, color: greyDark),
                        filled: true,
                        fillColor: darkGrey,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: general.whoTypes!
                          .map(
                            (item) => DropdownMenuItem(
                              onTap: () {
                                setState(() {
                                  whoTypeId = item.id;
                                });
                              },
                              value: item,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      '${item.name}',
                                      style:
                                          TextStyle(fontSize: 14, color: white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTextField(
                      name: 'lastName',
                      labelText: "Овог",
                      color: darkGrey,
                      hintText: 'Овог',
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Овог оруулна уу')
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTextField(
                      labelText: "Нэр",
                      name: 'firstName',
                      color: darkGrey,
                      hintText: 'Нэр',
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Нэр оруулна уу')
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTextField(
                      labelText: "Утасны дугаар",
                      name: 'phone',
                      color: darkGrey,
                      showCounter: false,
                      maxLenght: 8,
                      hintText: 'Утасны дугаар',
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Утасны дугаар оруулна уу')
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                isLoading: isSubmit,
                boxShadow: false,
                labelColor: buttonColor,
                labelText: 'Нэмэх',
                onClick: () {
                  onSubmit();
                },
                textColor: white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
