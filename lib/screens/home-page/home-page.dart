import 'package:bank_core/api/auth-api.dart';
import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/active-loan-card/active-loan-card.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/potential-balance-card/potential-balance-card.dart';
import 'package:bank_core/models/get.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/loan/loan-detail-page.dart';
import 'package:bank_core/screens/loan/loan-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePageArguments {
  String id;
  HomePageArguments({
    required this.id,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  bool isLoading = true;
  int page = 1;
  int limit = 5;
  Get get = Get();
  User user = User();
  Result loan = Result(count: 0, rows: []);
  ListenController listenController = ListenController();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    listenController.addListener(() async {
      get = await AuthApi().accountGet(user.customerId!);
      list(limit, page);
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  afterFirstLayout(BuildContext context) async {
    get = await AuthApi().accountGet(user.customerId!);
    list(limit, page);
    setState(() {
      isLoading = false;
    });
  }

  list(limit, page) async {
    Offset offset = Offset(page: page, limit: limit);
    Filter filter = Filter(query: '');
    loan = await CustomerApi().activeList(
        ResultArguments(offset: offset, filter: filter), user.customerId!);
    setState(() {
      isLoading = false;
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    get = await AuthApi().accountGet(user.customerId!);
    setState(() {
      isLoading = true;
    });
    await list(page, limit);
    refreshController.refreshCompleted();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;

    return isLoading == true
        ? Center(
            child: CircularProgressIndicator(
              color: buttonColor,
            ),
          )
        : Container(
            color: backgroundColor,
            child: SmartRefresher(
              enablePullDown: true,
              controller: refreshController,
              header: WaterDropHeader(
                waterDropColor: grey,
              ),
              onRefresh: _onRefresh,
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
                      margin:
                          const EdgeInsets.only(left: 15, bottom: 15, top: 20),
                      child: Text(
                        'Дижитал зээл',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    PotentialBalanceCard(
                      data: get,
                      onClick: () {
                        Navigator.of(context).pushNamed(LoanPage.routeName,
                            arguments: LoanPageArguments(
                                listenController: listenController));
                      },
                    ),
                    loan.rows!.length != 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 15, bottom: 20, top: 30),
                                child: Text(
                                  'Идэвхтэй зээл',
                                  style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: loan.rows!
                                      .map((data) => Container(
                                            margin: EdgeInsets.only(left: 15),
                                            child: ActiveLoanCard(
                                              data: data,
                                              onClick: () {
                                                Navigator.of(context).pushNamed(
                                                  LoanDetailPage.routeName,
                                                  arguments:
                                                      LoanDetailPageArguments(
                                                    id: data.loanId,
                                                    listenController:
                                                        listenController,
                                                  ),
                                                );
                                              },
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 30,
                    ),
                    // Container(
                    //   margin: const EdgeInsets.symmetric(horizontal: 15),
                    //   decoration: BoxDecoration(),
                    //   height: 160,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(10),
                    //     child: Image(
                    //       image: NetworkImage(
                    //           'https://officebanao.com/wp-content/uploads/2022/10/Modern-office-design-5-1024x576.jpg'),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              ),
            ),
          );
  }
}
