import 'package:bank_core/api/loan-api.dart';
import 'package:bank_core/components/transaction-history-card/transaction-history-card.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:after_layout/after_layout.dart';
import 'package:lottie/lottie.dart';

class AllHistoryPage extends StatefulWidget {
  final String? startDate;
  final String? endDate;
  const AllHistoryPage({
    this.startDate,
    this.endDate,
    Key? key,
  }) : super(key: key);

  @override
  State<AllHistoryPage> createState() => _AllHistoryPageState();
}

class _AllHistoryPageState extends State<AllHistoryPage> with AfterLayoutMixin {
  bool isLoading = true;
  int page = 1;
  int limit = 10;
  Result transactionList = Result(rows: [], count: 0);

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

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
    setState(() {
      isLoading = false;
    });
  }

  list(page, limit) async {
    Offset offset = Offset(page: page, limit: limit);
    Filter filter = Filter();
    transactionList = await LoanApi()
        .transactionList(ResultArguments(offset: offset, filter: filter));
    setState(() {
      isLoading = false;
    });
  }

  @override
  afterFirstLayout(BuildContext context) async {
    list(page, limit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: refreshController,
              header: WaterDropHeader(
                waterDropColor: darkGrey,
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
                      color: buttonColor,
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
              child: transactionList.rows!.length != 0
                  ? ListView.builder(
                      itemCount: transactionList.rows!.length,
                      itemBuilder: (context, index) {
                        final item = transactionList.rows![index];
                        return TransactionHistoryCard(
                          data: item,
                        );
                      },
                    )
                  : Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Lottie.asset('assets/lottie/empty.json',
                                height: 150),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Гүйлгээний түүх хоосон байна",
                            style: TextStyle(
                              color: Theme.of(context).disabledColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
    );
  }
}
