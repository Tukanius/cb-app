import 'package:flutter/material.dart';
import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/paid-back-card/paid-back-card.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/screens/loan-schedule-page/loan-schedule-page.dart';
import 'package:bank_core/screens/payment-page/payment-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:after_layout/after_layout.dart';

class LoanDetailPageArguments {
  String id;
  LoanDetailPageArguments({
    required this.id,
  });
}

class LoanDetailPage extends StatefulWidget {
  final String id;
  static const routeName = 'LoanDetailPage';
  const LoanDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<LoanDetailPage> createState() => _LoanDetailPageState();
}

class _LoanDetailPageState extends State<LoanDetailPage> with AfterLayoutMixin {
  bool isLoading = false;
  int page = 1;
  int limit = 5;
  Result list = Result(rows: [], count: 0);
  double? totalAmount = 0;

  @override
  afterFirstLayout(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    customer = await CustomerApi().activeLoanGet(widget.id);

    paidList(page, limit);
    setState(() {
      isLoading = false;
    });
  }

  paidList(page, limit) async {
    Offset offset = Offset(limit: limit, page: page);
    Filter filter = Filter(query: '');
    list = await CustomerApi()
        .paidList(ResultArguments(offset: offset, filter: filter), widget.id);
  }

  Customer customer = Customer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
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
              color: white,
              size: 10,
            ),
          ),
        ),
        title: Text(
          'Зээлийн дэлгэрэнгүй',
          style: TextStyle(
            color: white,
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
                        color: white,
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
                      color: darkGrey,
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
                                        color: grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${customer.loan?.amount}",
                                      style: TextStyle(
                                        color: white,
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
                                        color: grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${customer.loanRate}%",
                                      style: TextStyle(
                                        color: white,
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
                          color: grey.withOpacity(0.2),
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
                                          color: grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${customer.loanResidual}₮",
                                      style: TextStyle(
                                        color: white,
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
                                        color: grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${customer.rateAmount}₮",
                                      style: TextStyle(
                                        color: white,
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        PaymentPage.routeName,
                        arguments: PaymentPageArguments(
                            id: widget.id,
                            loanResidual: customer.totalPayAmount.toString()
                            // totalAmount.toString(),
                            ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.only(
                                left: 15, top: 20, right: 5),
                            decoration: BoxDecoration(
                              color: darkGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('images/lend.svg'),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Зээл төлөх',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.only(
                                right: 15, top: 20, left: 5),
                            decoration: BoxDecoration(
                              color: darkGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('images/loan_close.svg'),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Зээл хаах',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        LoanSchedulePage.routeName,
                        arguments: LoanSchedulePageArguments(id: widget.id),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: darkGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 25),
                      child: Row(
                        children: [
                          SvgPicture.asset('images/schedule.svg'),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Зээлийн хуваарь',
                            style: TextStyle(
                              color: white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  list.rows!.length == 0
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
                  Column(
                    children: list.rows!.map((e) => PaidBackCard()).toList(),
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
