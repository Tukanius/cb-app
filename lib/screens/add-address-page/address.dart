import 'dart:async';

import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/address-card/address-card.dart';
import 'package:bank_core/models/result.dart';
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
  Result user = Result(count: 0, rows: []);
  int page = 1;
  int limit = 5;
  bool isLoading = true;

  list(page, limit) async {
    Offset offset = Offset(page: page, limit: limit);
    Filter filter = Filter(query: customer.customerId.toString());
    user = await CustomerApi()
        .addressList(ResultArguments(offset: offset, filter: filter));
    setState(() {
      isLoading = false;
    });
  }

  @override
  afterFirstLayout(BuildContext context) {
    list(page, limit);
  }

  User customer = User();

  @override
  Widget build(BuildContext context) {
    customer = Provider.of<UserProvider>(context, listen: false).user;
    print(customer.customerId);
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ActionButton(
              onClick: () {
                Navigator.of(context).pushNamed(AddAddressPage.routeName);
              },
              icon: Icon(
                Icons.add,
                color: white,
                size: 14,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: buttonColor,
                ),
              )
            : user.rows!.length == 0
                ? Center(
                    child: Lottie.asset('images/asdf.json', height: 300),
                  )
                : Column(
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
                        children: user.rows!
                            .map(
                              (e) => AddressCard(
                                data: e,
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
