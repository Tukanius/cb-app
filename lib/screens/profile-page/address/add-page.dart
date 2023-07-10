import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/general.dart';
import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/form_textfield.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';

class AddAddressPageArguments {
  ListenController listenController;
  AddAddressPageArguments({
    required this.listenController,
  });
}

class AddAddressPage extends StatefulWidget {
  static const routeName = 'AddAddressPage';
  final ListenController listenController;
  const AddAddressPage({Key? key, required this.listenController})
      : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> with AfterLayoutMixin {
  afterFirstLayout(BuildContext context) async {}

  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  String? addressTypeId;
  String? provinceId;
  String? districtId;
  String? khoroosId;
  User user = User();
  General general = General();
  Customer customer = Customer();

  onItemTapped() async {
    if (fbKey.currentState!.saveAndValidate()) {
      try {
        customer = Customer.fromJson(fbKey.currentState!.value);
        customer.addressTypeId = addressTypeId;
        customer.provinceId = provinceId;
        customer.districtId = districtId;
        customer.khorooId = khoroosId;
        await CustomerApi().customerAddress(customer);
        widget.listenController.changeVariable("addAddress");
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
                        'Таны бүртгэл амжилттай үүслээ.',
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
    general = Provider.of<GeneralProvider>(context, listen: true).general;
    user = Provider.of<UserProvider>(context, listen: true).user;
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
        title: Text(
          'Гэрийн хаяг нэмэх',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: fbKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 20),
                  child: Text(
                    'Хаяг',
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DropdownButtonFormField(
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Заавал оруулна уу.')
                  ]),
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
                  onChanged: (value) {
                    setState(() {
                      addressTypeId = value?.id;
                      print(addressTypeId.toString());
                      print('=====addresstypeid=====');
                    });
                  },
                  dropdownColor: Theme.of(context).colorScheme.onBackground,
                  elevation: 2,
                  decoration: InputDecoration(
                    hintText: 'Оршин сууж байгаа хаягын төрөл',
                    hintStyle: TextStyle(
                        fontSize: 14, color: Theme.of(context).disabledColor),
                    filled: true,
                    fillColor: Theme.of(context).splashColor,
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
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: general.addressTypes!
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            '${item.name}',
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                addressTypeId != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Аймаг / Хот',
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DropdownButtonFormField(
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Заавал оруулна уу.')
                            ]),
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
                            onChanged: (value) {
                              setState(() {
                                provinceId = value?.id;
                              });
                            },
                            dropdownColor:
                                Theme.of(context).colorScheme.onBackground,
                            elevation: 2,
                            decoration: InputDecoration(
                              hintText: 'Аймаг / Хот',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).disabledColor),
                              filled: true,
                              fillColor: Theme.of(context).splashColor,
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
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            items: general.provinces!
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      '${item.name}',
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                    : SizedBox(),
                provinceId != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Сум / Дүүрэг',
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DropdownButtonFormField(
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Заавал оруулна уу.')
                            ]),
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
                            onChanged: (value) {
                              setState(() {
                                districtId = value?.id;
                              });
                            },
                            dropdownColor:
                                Theme.of(context).colorScheme.onBackground,
                            elevation: 2,
                            decoration: InputDecoration(
                              hintText: 'Сум / Дүүрэг',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).disabledColor),
                              filled: true,
                              fillColor: Theme.of(context).splashColor,
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
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            items: general.districts!
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: provinceId == item.provinceId
                                        ? Text(
                                            '${item.name}',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                              fontSize: 14,
                                            ),
                                          )
                                        : Text(''),
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                    : SizedBox(),
                districtId != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Баг / Хороо',
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DropdownButtonFormField(
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Заавал оруулна уу.')
                            ]),
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
                            onChanged: (value) {
                              setState(() {
                                khoroosId = value?.id;
                              });
                            },
                            dropdownColor:
                                Theme.of(context).colorScheme.onBackground,
                            elevation: 2,
                            decoration: InputDecoration(
                              hintText: 'Баг / Хороо',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).disabledColor),
                              filled: true,
                              fillColor: Theme.of(context).splashColor,
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
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            items: general.khoroos!
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: districtId == item.districtId
                                        ? Text(
                                            '${item.name}',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                              fontSize: 14,
                                            ),
                                          )
                                        : Text(''),
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      )
                    : SizedBox(),
                khoroosId != null
                    ? FormTextField(
                        textColor: Theme.of(context).iconTheme.color,
                        labelText: "Тоот",
                        inputType: TextInputType.text,
                        hintText: "Тоот",
                        name: 'address',
                        color: Theme.of(context).splashColor,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Заавал оруулна уу')
                        ]),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 30,
                ),
                khoroosId != null
                    ? Container(
                        child: CustomButton(
                          isLoading: false,
                          boxShadow: false,
                          labelColor: buttonColor,
                          labelText: 'Нэмэх',
                          onClick: onItemTapped,
                          textColor: white,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
