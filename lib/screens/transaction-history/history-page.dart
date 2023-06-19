import 'package:bank_core/api/loan-api.dart';
import 'package:bank_core/components/transaction-history-card/transaction-history-card.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:lottie/lottie.dart';

class HistoryPage extends StatefulWidget {
  static const routeName = 'HistoryPage';
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin {
  int currentIndex = 0;
  int page = 1;
  int limit = 5;
  Result transactionList = Result(rows: [], count: 0);
  bool isLoading = true;

  late TabController tabController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.index = currentIndex;
    super.initState();
  }

  @override
  afterFirstLayout(BuildContext context) async {
    list(page, limit);
    setState(() {
      isLoading = false;
    });
  }

  list(page, limit) async {
    Offset offset = Offset(page: page, limit: limit);
    Filter filter = Filter();
    transactionList = await LoanApi()
        .transactionList(ResultArguments(offset: offset, filter: filter));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  changePage(index) {
    setState(() {
      tabController.index = index;
    });
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: darkGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 20),
                        child: Text(
                          'Гүйлгээний түүхийн дэлгэрэнгүй',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Divider(
                        color: grey.withOpacity(0.3),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Шилжүүлсэн данс',
                            style: TextStyle(color: grey),
                          ),
                          Text(
                            '5102113468',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Гүйлгээний дүн',
                            style: TextStyle(color: grey),
                          ),
                          Text(
                            '300,000₮',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: grey.withOpacity(0.3),
                      ),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              "Болсон",
                              style: TextStyle(color: white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : transactionList.rows?.length == 0
              ? Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child:
                          Lottie.asset('assets/lottie/empty.json', height: 150),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Гүйлгээний түүх хоосон байна",
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: transactionList.rows!
                            .map(
                              (item) => TransactionHistoryCard(
                                onClick: () {
                                  show(context);
                                },
                                data: item,
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                ),
    );
  }
}
