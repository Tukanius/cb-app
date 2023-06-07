import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/bank-account-card/bank-account-card.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/bank-account-page/add-bank-account-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BankAccounts extends StatefulWidget {
  static const routeName = 'BankAccounts';
  const BankAccounts({super.key});

  @override
  State<BankAccounts> createState() => _BankAccountsState();
}

class _BankAccountsState extends State<BankAccounts> with AfterLayoutMixin {
  Result bank = Result(rows: [], count: 0);
  int page = 1;
  int limit = 5;
  bool isLoading = true;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  afterFirstLayout(BuildContext context) async {
    customer = await CustomerApi().bankAccountList(user.customerId!);
    setState(() {
      isLoading = false;
    });
  }

  list(page, limit) async {
    // bank = await CustomerApi().bankAccountList(user.id!);
    setState(() {
      isLoading = false;
    });
  }

  void _onLoading() async {
    setState(() {
      limit += 10;
    });
    await list(page, limit);
    refreshController.refreshCompleted();
    setState(() {
      isLoading = false;
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      isLoading = true;
    });
    await list(page, limit);
    refreshController.refreshCompleted();
    isLoading = false;
  }

  Customer customer = Customer();
  User user = User();

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
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ActionButton(
              onClick: () {
                Navigator.of(context).pushNamed(AddBankAccountPage.routeName);
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
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : bank.rows!.length != 0
              ? SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  controller: refreshController,
                  header: WaterDropHeader(
                    waterDropColor: grey,
                  ),
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  footer: CustomFooter(
                    builder: (context, mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = const Text("");
                      } else if (mode == LoadStatus.loading) {
                        body = const CupertinoActivityIndicator(
                          color: CupertinoColors.white,
                        );
                      } else if (mode == LoadStatus.failed) {
                        body = const Text("Алдаа гарлаа. Дахин үзнэ үү!");
                      } else {
                        body = const Text("Мэдээлэл алга байна");
                      }
                      return SizedBox(
                        height: 55.0,
                        child: Center(child: body),
                      );
                    },
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15, bottom: 10, top: 20),
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
                          children: bank.rows!
                              .map(
                                (e) => BankAccountCard(
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
                )
              : Column(
                  children: [
                    Lottie.asset('images/asdf.json', height: 300),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Данс холбоогүй байна",
                      style: TextStyle(color: grey),
                    ),
                  ],
                ),
    );
  }
}
