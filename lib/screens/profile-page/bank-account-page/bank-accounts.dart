import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/bank-account-card/bank-account-card.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/custom-button/custom_button.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/profile-page/bank-account-page/add-bank-account-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';

class BankAccounts extends StatefulWidget {
  static const routeName = 'BankAccounts';
  const BankAccounts({super.key});

  @override
  State<BankAccounts> createState() => _BankAccountsState();
}

class _BankAccountsState extends State<BankAccounts> with AfterLayoutMixin {
  bool isLoading = true;
  Customer customer = Customer();
  User user = User();
  ListenController listenController = ListenController();

  @override
  afterFirstLayout(BuildContext context) async {
    customer = await CustomerApi().bankAccountList(user.customerId!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    listenController.addListener(() async {
      customer = await CustomerApi().bankAccountList(user.customerId!);
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;
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
          'Дансны мэдээлэл',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : customer.rows?.length == 0
              ? Column(
                  children: [
                    Lottie.asset('assets/lottie/empty.json', height: 200),
                    Text(
                      "Данс холбоогүй байна",
                      style: TextStyle(color: grey),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, bottom: 10, top: 20),
                        child: Text(
                          'Холбогдсон данс',
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
                              (e) => BankAccountCard(
                                data: e,
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CustomButton(
                          labelColor: buttonColor,
                          textColor: white,
                          onClick: () {
                            Navigator.of(context).pushNamed(
                                AddBankAccountPage.routeName,
                                arguments: AddBankAccountPageArguments(
                                    listenController: listenController));
                          },
                          labelText: "Данс нэмэх",
                          boxShadow: true,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
