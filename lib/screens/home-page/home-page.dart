import 'dart:async';
import 'package:bank_core/api/loan-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/loan/active-loan-card.dart';
import 'package:bank_core/components/controller/listen.dart';
import 'package:bank_core/components/potential-balance-card/potential-balance-card.dart';
import 'package:bank_core/models/customer.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/bonus-page/bonus-credit.dart';
// import 'package:bank_core/screens/home-page/bonus-credit.dart';
import 'package:bank_core/screens/loan/loan-detail-page.dart';
import 'package:bank_core/screens/loan/loan-page.dart';
import 'package:bank_core/screens/notification-page/notification-page.dart';
import 'package:bank_core/screens/profile-page/profile-detail-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  bool isLoading = true;
  bool isLoadingPage = true;
  bool isView = false;
  bool isDarkMode = false;
  int page = 1;
  int limit = 10;
  User user = User();
  Result loan = Result(count: 0, rows: []);
  ListenController listenController = ListenController();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  PageController pageController = PageController(viewportFraction: 0.35);
  Customer customers = Customer();
  double currentValue = 0;

  @override
  void initState() {
    listenController.addListener(() async {
      customers = await LoanApi().loanProduct(true);
      list(limit, page);
      setState(() {
        isLoading = false;
        isLoadingPage = false;
      });
    });
    super.initState();
  }

  showSuccess(ctx) async {
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
                margin: const EdgeInsets.only(top: 75),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Амжилттай',
                      style: TextStyle(
                          color: dark,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Зээлийн эрх амжилттай тооцогдлоо.',
                      textAlign: TextAlign.center,
                    ),
                    ButtonBar(
                      buttonMinWidth: 100,
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: const Text(
                            "Буцах",
                            style: TextStyle(color: dark),
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
              Lottie.asset('assets/lottie/success.json',
                  height: 150, repeat: false),
            ],
          ),
        );
      },
    );
  }

  @override
  afterFirstLayout(BuildContext context) async {
    customers = await LoanApi().loanProduct(true);
    list(limit, page);
    setState(() {
      isLoadingPage = false;
    });
  }

  void dispose() {
    listenController.dispose();
    super.dispose();
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
    setState(() {
      isLoading = true;
    });
    customers = await LoanApi().loanProduct(true);
    await list(page, limit);
    await Provider.of<UserProvider>(context, listen: false).me(true);
    refreshController.refreshCompleted();
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

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;
    isView = Provider.of<UserProvider>(context, listen: true).isView;
    isDarkMode = Provider.of<UserProvider>(context, listen: true).check;
    int currentStep =
        Provider.of<UserProvider>(context, listen: false).currentStep;
    int totalSteps =
        Provider.of<UserProvider>(context, listen: false).totalSteps;
    return isLoadingPage == true
        ? Center(
            child: CircularProgressIndicator(
              color: buttonColor,
            ),
          )
        : NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 56,
                  automaticallyImplyLeading: false,
                  pinned: false,
                  snap: true,
                  floating: true,
                  elevation: 0,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  title: GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/avatar.svg',
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Сайн уу? 👋',
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '${user.firstName}',
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ActionButton(
                      icon: isDarkMode == false
                          ? SvgPicture.asset(
                              "assets/svg/dark-mode.svg",
                              height: 24,
                              width: 24,
                              color: white,
                            )
                          : SvgPicture.asset(
                              "assets/svg/dark-mode.svg",
                              height: 24,
                              width: 24,
                              color: black,
                            ),
                      onClick: () {
                        Provider.of<UserProvider>(context, listen: false)
                            .toggleDarkMode(!isDarkMode);
                        final provider =
                            Provider.of<UserProvider>(context, listen: false);
                        provider.toggleTheme(!provider.isDarkMode);
                        print(!provider.isDarkMode);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ActionButton(
                      icon: isView == false
                          ? Icon(
                              Icons.visibility,
                              color: Theme.of(context).hoverColor,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Theme.of(context).hoverColor,
                            ),
                      onClick: () async {
                        await Provider.of<UserProvider>(context, listen: false)
                            .setView(!isView);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ActionButton(
                      onClick: () {
                        Navigator.of(context)
                            .pushNamed(NotificationPage.routeName);
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: Theme.of(context).hoverColor,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ];
            },
            body: SmartRefresher(
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 25, bottom: 4, top: 10),
                      child: Text(
                        'Зээл',
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
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
                              isLoading: isLoading,
                              customer: customers.rows?[index],
                              onClick: () async {
                                if (isLoading == false) {
                                  if (customers.rows?[index].loanAmount ==
                                          "0.00" &&
                                      customers.rows?[index].balance ==
                                          "0.00" &&
                                      user.isVerified != false) {
                                    try {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      var res = await LoanApi().scoring();
                                      if (res.success == true) {
                                        showSuccess(context);
                                      }
                                      listenController.refreshList('change');
                                      setState(() {
                                        isLoading = false;
                                      });
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  } else if (customers
                                              .rows?[index].loanAmount ==
                                          "0.00" &&
                                      customers.rows?[index].balance ==
                                          "0.00" &&
                                      user.isVerified == false) {
                                    Navigator.of(context)
                                        .pushNamed(ProfileDetailPage.routeName);
                                  } else {
                                    Navigator.of(context).pushNamed(
                                      LoanPage.routeName,
                                      arguments: LoanPageArguments(
                                          listenController: listenController,
                                          maxRate: '5'),
                                    );
                                  }
                                }
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
                                    left: 25, bottom: 4, top: 30),
                                child: Text(
                                  'Идэвхтэй зээл',
                                  style: TextStyle(
                                    color: Theme.of(context).iconTheme.color,
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
                                      shadowColor: transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      key: ValueKey(loan.rows![index]),
                                      child: ActiveLoanCard(
                                        data: loan.rows![index],
                                        onClick: () {
                                          Navigator.of(context).pushNamed(
                                            LoanDetailPage.routeName,
                                            arguments: LoanDetailPageArguments(
                                              loanId: loan.rows![index].loan.id,
                                              id: loan.rows![index].id,
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
                              // Container(
                              //   margin: EdgeInsets.only(top: 10),
                              //   width: MediaQuery.of(context).size.width,
                              //   alignment: Alignment.center,
                              //   child: SmoothPageIndicator(
                              //     controller: pageController,
                              //     count: loan.rows!.length,
                              //     effect: WormEffect(
                              //       dotColor: greyDark,
                              //       dotHeight: 10,
                              //       dotWidth: 10,
                              //       activeDotColor: buttonColor,
                              //     ),
                              //     onDotClicked: (index) {},
                              //   ),
                              // ),
                            ],
                          )
                        : SizedBox(),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 25, bottom: 4, top: 26),
                      child: Text(
                        'Бонус оноо',
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(BonusCredit.routeName);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).splashColor,
                        ),
                        height: 160,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Бонус оноо',
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).iconTheme.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              '$currentStep/$totalSteps',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).iconTheme.color),
                            ),
                            Expanded(
                              child: SliderTheme(
                                data: SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 3),
                                  tickMarkShape: RoundSliderTickMarkShape(
                                      tickMarkRadius: 0),
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: StepProgressIndicator(
                                          totalSteps:
                                              Provider.of<UserProvider>(context)
                                                  .totalSteps,
                                          currentStep:
                                              Provider.of<UserProvider>(context)
                                                  .currentStep,
                                          selectedColor: Colors.red.shade600,
                                          unselectedColor: darkGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(),
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: NetworkImage(
                              'https://officebanao.com/wp-content/uploads/2022/10/Modern-office-design-5-1024x576.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
