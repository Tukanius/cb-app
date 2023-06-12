import 'package:bank_core/components/transaction-history-card/transaction-history-card.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  static const routeName = 'HistoryPage';
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  late TabController tabController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.index = currentIndex;
    super.initState();
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
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          changePage(0);
                        },
                        child: Container(
                          width: 80,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: tabController.index == 0
                                ? darkGrey
                                : transparent,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              'Бүгд',
                              style: TextStyle(
                                color: tabController.index == 0 ? white : grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          changePage(1);
                        },
                        child: Container(
                          width: 80,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: tabController.index == 1
                                ? darkGrey
                                : transparent,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              'Орлого',
                              style: TextStyle(
                                color: tabController.index == 1 ? white : grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          changePage(2);
                        },
                        child: Container(
                          width: 80,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: tabController.index == 2
                                ? darkGrey
                                : transparent,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              'Зарлага',
                              style: TextStyle(
                                color: tabController.index == 2 ? white : grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ];
        },
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            Column(
              children: [
                TransactionHistoryCard(
                  onClick: () {
                    show(context);
                  },
                  isIncome: true,
                ),
              ],
            ),
            Column(
              children: [
                TransactionHistoryCard(
                  isIncome: true,
                ),
              ],
            ),
            Column(
              children: [
                TransactionHistoryCard(
                  isIncome: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
