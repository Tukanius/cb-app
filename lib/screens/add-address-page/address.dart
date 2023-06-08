import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/address-card/address-card.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/add-address-page/add-address-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class AddAddress extends StatefulWidget {
  static const routeName = 'AddAddress';
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> with AfterLayoutMixin {
  User user = User();
  bool isLoading = true;
  Customer customer = Customer();
  ListenController listenController = ListenController();

  @override
  afterFirstLayout(BuildContext context) async {
    customer = await CustomerApi().addressList(user.customerId!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    listenController.addListener(() async {
      customer = await CustomerApi().addressList(user.customerId!);
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          'Оршин суугаа хаяг',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          isLoading == false
              ? customer.rows!.length >= 3
                  ? SizedBox()
                  : Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: ActionButton(
                        onClick: () {
                          Navigator.of(context).pushNamed(
                              AddAddressPage.routeName,
                              arguments: AddAddressPageArguments(
                                  listenController: listenController));
                        },
                        icon: Icon(
                          Icons.add,
                          color: white,
                          size: 14,
                        ),
                      ),
                    )
              : SizedBox(),
        ],
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : customer.rows?.length == 0
              ? Center(
                  child: Lottie.asset('assets/lottie/empty.json', height: 300),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, bottom: 10, top: 20),
                        child: Text(
                          'Оршин суугаа хаяг',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Column(
                        children: customer.rows!
                            .map(
                              (data) => AddressCard(
                                data: data,
                              ),
                            )
                            .toList(),
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
