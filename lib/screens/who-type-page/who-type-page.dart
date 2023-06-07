import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/who-type-card/who-type.card.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/screens/who-type-page/add-who-type-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WhoTypePage extends StatefulWidget {
  static const routeName = 'WhoTypePage';
  const WhoTypePage({Key? key}) : super(key: key);

  @override
  State<WhoTypePage> createState() => _WhoTypePageState();
}

class _WhoTypePageState extends State<WhoTypePage> with AfterLayoutMixin {
  Result customer = Result(rows: [], count: 0);
  int page = 1;
  int limit = 5;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool isLoading = false;

  @override
  afterFirstLayout(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    list(int, page);
    setState(() {
      isLoading = false;
    });
  }

  list(int, page) async {
    Offset offset = Offset(page: page, limit: limit);
    Filter filter = Filter(query: '');
    customer = await CustomerApi().relatedPersonList(
      ResultArguments(offset: offset, filter: filter),
    );
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

  @override
  Widget build(BuildContext context) {
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
          'Who Type',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          customer.count! < 4
              ? Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ActionButton(
                    onClick: () {
                      Navigator.of(context).pushNamed(AddWhoTypePage.routeName);
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
          : SmartRefresher(
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
                child: customer.rows!.length == 0
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
                              'Жагсаалт',
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
                                  (e) => WhoTypeCard(
                                    data: e,
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
              ),
            ),
    );
  }
}
