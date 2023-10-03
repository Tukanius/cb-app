// ignore_for_file: deprecated_member_use

import 'package:bank_core/api/loan-api.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/screens/payment-page/close-payment-page.dart';
import 'package:flutter/material.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/paid-back-card/paid-back-card.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/screens/loan/loan-schedule-page.dart';
import 'package:bank_core/screens/payment-page/payment-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:after_layout/after_layout.dart';

class LoanDetailPageArguments {
  String loanId;
  String id;
  ListenController listenController;
  LoanDetailPageArguments({
    required this.loanId,
    required this.id,
    required this.listenController,
  });
}

class LoanDetailPage extends StatefulWidget {
  final String loanId;
  final String id;
  final ListenController listenController;
  static const routeName = 'LoanDetailPage';
  const LoanDetailPage({
    required this.loanId,
    Key? key,
    required this.id,
    required this.listenController,
  }) : super(key: key);

  @override
  State<LoanDetailPage> createState() => _LoanDetailPageState();
}

class _LoanDetailPageState extends State<LoanDetailPage> with AfterLayoutMixin {
  bool isLoading = false;
  int page = 1;
  int limit = 5;
  double? totalAmount = 0;
  Customer payBackList = Customer();
  Customer customer = Customer();

  @override
  afterFirstLayout(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    customer = await LoanApi().activeLoanGet(widget.id);
    print(customer.toJson());
    payBackList = await LoanApi().paidList(widget.id);
    print('=======TODAY======');
    print(customer.todayAmount);
    print('=======TODAY======');

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.all(10),
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
          'Зээлийн дэлгэрэнгүй',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: Text(
                      'Дижитал зээл',
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(top: 35, bottom: 35, left: 30),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Зээлийн үлдэгдэл",
                          style: TextStyle(
                            color: white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          // "${Utils().formatCurrency(customer.totalPayAmount)}₮",
                          "${customer.totalPayAmount}₮",
                          style: TextStyle(
                            color: white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).splashColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Олгогдсон зээл',
                                      style: TextStyle(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      // "${Utils().formatCurrency("${customer.loan?.amount}")}₮",
                                      "${customer.loan?.amount}",
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Зээлийн хүү',
                                      style: TextStyle(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${customer.loan?.loanRate}%",
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Theme.of(context).disabledColor,
                          endIndent: 20,
                          indent: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Зээлийн үлдэгдэл',
                                        style: TextStyle(
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      // "${Utils().formatCurrency(customer.loanResidual)}₮",
                                      "${customer.loanResidual}₮",
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Хуримтлагдсан хүү',
                                      style: TextStyle(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      // "${Utils().formatCurrency(customer.rateAmount)}₮",
                                      "${customer.rateAmount}₮",
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              PaymentPage.routeName,
                              arguments: PaymentPageArguments(
                                code: customer.code!,
                                loanDate: customer.loan!.loanDate.toString(),
                                loanId: widget.loanId,
                                loanResidual:
                                    customer.totalPayAmount.toString(),
                                listenController: widget.listenController,
                                totalPayAmount: customer.totalPayAmount!,
                                loanPaybackGraphId: customer.id!,
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.only(
                                left: 15, top: 20, right: 5),
                            decoration: BoxDecoration(
                              color: Theme.of(context).splashColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/lend.svg',
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Зээл төлөх',
                                  style: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ClosePaymentPage.routeName,
                              arguments: ClosePaymentPageArguments(
                                todayAmount: customer.todayAmount!,
                                closeAmount: customer.todayAmount.toString(),
                                code: customer.code!,
                                loanDate: customer.loan!.loanDate.toString(),
                                loanId: widget.loanId,
                                loanResidual:
                                    customer.totalPayAmount.toString(),
                                listenController: widget.listenController,
                                totalPayAmount: customer.totalPayAmount!,
                                loanPaybackGraphId: customer.id!,
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.only(
                                right: 15, top: 20, left: 5),
                            decoration: BoxDecoration(
                              color: Theme.of(context).splashColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'images/loan_close.svg',
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Зээл хаах',
                                  style: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        LoanSchedulePage.routeName,
                        arguments: LoanSchedulePageArguments(id: widget.loanId),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).splashColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 25),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'images/schedule.svg',
                            color: Theme.of(context).iconTheme.color,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Зээлийн хуваарь',
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  payBackList.rows?.length == 0
                      ? SizedBox()
                      : Container(
                          margin: const EdgeInsets.only(
                              left: 15, bottom: 10, top: 40),
                          child: Text(
                            'Зээлийн түүх',
                            style: TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                  payBackList.rows == null
                      ? SizedBox()
                      : Column(
                          children: payBackList.rows!
                              .map((e) => PaidBackCard(
                                    data: e,
                                  ))
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
