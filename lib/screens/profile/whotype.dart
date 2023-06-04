import 'package:bank_core/models/customer_related_person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:bank_core/widget/form_textfield.dart';
import 'package:provider/provider.dart';
import '../../api/auth.dart';
import 'package:bank_core/models/general.dart';
import '../../models/user.dart';
import '../../provider/user_provider.dart';
import '../../widget/custon_button.dart';
import '../splash/index.dart';
import 'package:after_layout/after_layout.dart';
import 'package:bank_core/provider/general_provider.dart';

class WhoType extends StatefulWidget {
  const WhoType({super.key});

  @override
  State<WhoType> createState() => _WhoTypeState();
}

class _WhoTypeState extends State<WhoType> with AfterLayoutMixin {
  bool isSubmit = false;
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  User user = User();
  User me = User();
  WhoType whoType = WhoType();
  CustomerRelated customerRelated = CustomerRelated();

  afterFirstLayout(BuildContext context) async {
    print(general.toJson());
  }

  onSubmit() async {
    if (fbKey.currentState!.saveAndValidate()) {
      try {
        setState(() {
          isSubmit = true;
        });

        print("=============FORMDATA==================");
        print(me.id);
        print("=============FORMDATA==================");

        CustomerRelated data =
            CustomerRelated.fromJson(fbKey.currentState!.value);
        data.customerId = me.id;
        await AuthApi().relatedPerson(data);

        Navigator.of(context).pushNamed(SplashPage.routeName);
      } catch (e) {
        debugPrint(e.toString());
        setState(() {
          isSubmit = false;
        });
      }
    }
  }

  General general = General();
  @override
  Widget build(BuildContext context) {
    me = Provider.of<UserProvider>(context, listen: true).user;
    general = Provider.of<GeneralProvider>(context, listen: true).general;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(7),
            decoration: ShapeDecoration(
              color: Colors.grey.shade700,
              shape:
                  CircleBorder(side: BorderSide(color: Colors.grey.shade500)),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: FormBuilder(
                key: fbKey,
                child: Column(
                  children: [
                    TextButton(
                      child: Text('${me.id}'),
                      onPressed: () {},
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade400),
                      child: FormBuilderDropdown(
                        name: 'whoTypeId',
                        items: general.whotypes!
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text("${e.name}"),
                                value: e.id,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormTextField(
                      name: "firstName",
                      inputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      decoration: InputDecoration(
                        enabled: true,
                        counterText: "",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        prefixIconColor: Colors.green,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        disabledBorder: InputBorder.none,
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Colors.black54, fontSize: 14),
                        hintText: "Овог",
                        fillColor: Colors.white,
                      ),
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал бөглөх')
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormTextField(
                      name: "lastName",
                      inputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      decoration: InputDecoration(
                        enabled: true,
                        counterText: "",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        prefixIconColor: Colors.green,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        disabledBorder: InputBorder.none,
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Colors.black54, fontSize: 14),
                        hintText: "Нэр",
                        fillColor: Colors.white,
                      ),
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал бөглөх')
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormTextField(
                      name: "phone",
                      inputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      decoration: InputDecoration(
                        enabled: true,
                        counterText: "",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        prefixIconColor: Colors.green,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        disabledBorder: InputBorder.none,
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Colors.black54, fontSize: 14),
                        hintText: "Утасны дугаар",
                        fillColor: Colors.white,
                      ),
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Заавал бөглөх')
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomButton(
                labelText: 'Нэмэх',
                color: Colors.greenAccent,
                textColor: Colors.white,
                onClick: () {
                  onSubmit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
