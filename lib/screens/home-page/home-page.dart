import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/api/loan-api.dart';
import 'package:bank_core/components/active-loan-card/active-loan-card.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/potential-balance-card/potential-balance-card.dart';
import 'package:bank_core/models/customer.dart';
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
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  int limit = 10;
  Get get = Get();
  User user = User();
  Result loan = Result(count: 0, rows: []);
  ListenController listenController = ListenController();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  PageController pageController = PageController(viewportFraction: 0.35);
  Customer customers = Customer();

  @override
  void initState() {
    listenController.addListener(() async {
      get = await CustomerApi().accountGet(user.customerId!);
      list(limit, page);
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  afterFirstLayout(BuildContext context) async {
    customers = await LoanApi().loanProduct(true);
    get = await CustomerApi().accountGet(user.customerId!);
    list(limit, page);
    setState(() {
      isLoading = false;
    });
  }

  list(limit, page) async {
    Offset offset = Offset(page: page, limit: limit);
    Filter filter = Filter(query: '');
    loan = await LoanApi().activeList(
        ResultArguments(offset: offset, filter: filter), user.customerId!);
    setState(() {
      isLoading = false;
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    get = await CustomerApi().accountGet(user.customerId!);
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
                        'Зээл',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      height: 170,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: customers.rows?.length,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        controller: pageController,
                        itemBuilder: (context, index) {
                          return Card(
                            color: transparent,
                            elevation: 0,
                            key: ValueKey(customers.rows?[index]),
                            child: PotentialBalanceCard(
                              customer: customers.rows?[index],
                              data: get,
                              onClick: () {
                                Navigator.of(context).pushNamed(
                                    LoanPage.routeName,
                                    arguments: LoanPageArguments(
                                        listenController: listenController));
                              },
                            ),
                          );
                        },
                      ),
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
                              Container(
                                height: 245,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: loan.rows!.length,
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  controller: pageController,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: backgroundColor,
                                      key: ValueKey(loan.rows![index]),
                                      child: ActiveLoanCard(
                                        data: loan.rows![index],
                                        onClick: () {
                                          Navigator.of(context).pushNamed(
                                            LoanDetailPage.routeName,
                                            arguments: LoanDetailPageArguments(
                                              id: loan.rows![index].loanId,
                                              listenController:
                                                  listenController,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                child: SmoothPageIndicator(
                                  controller: pageController,
                                  count: loan.rows!.length,
                                  effect: WormEffect(
                                    dotColor: greyDark,
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    activeDotColor: buttonColor,
                                  ),
                                  onDotClicked: (index) {},
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
