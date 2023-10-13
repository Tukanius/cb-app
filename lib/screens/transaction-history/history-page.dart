import 'package:bank_core/api/loan-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/notification-page/notification-page.dart';
import 'package:bank_core/screens/profile-page/profile-page.dart';
import 'package:bank_core/screens/transaction-history/all-history.dart';
import 'package:bank_core/screens/transaction-history/loan-history.dart';
import 'package:bank_core/screens/transaction-history/paid-loan-history.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  static const routeName = 'HistoryPage';
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin {
  User user = User();
  bool isView = false;
  bool isDarkMode = false;
  int currentIndex = 0;
  int page = 1;
  int limit = 10;
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
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  changePage(index) {
    setState(() {
      tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;
    isView = Provider.of<UserProvider>(context, listen: true).isView;
    isDarkMode = Provider.of<UserProvider>(context, listen: true).check;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : transactionList.rows?.length == 0
              ? SafeArea(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        expandedHeight: 56,
                        automaticallyImplyLeading: false,
                        pinned: false,
                        snap: true,
                        floating: true,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        title: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ProfilePage.routeName);
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
                              final provider = Provider.of<UserProvider>(
                                  context,
                                  listen: false);
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
                              await Provider.of<UserProvider>(context,
                                      listen: false)
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
                      SliverToBoxAdapter(
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
                    ],
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
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        title: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ProfilePage.routeName);
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
                              final provider = Provider.of<UserProvider>(
                                  context,
                                  listen: false);
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
                              await Provider.of<UserProvider>(context,
                                      listen: false)
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
                          ),
                        ],
                        bottom: TabBar(
                          controller: tabController,
                          indicator: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                          ),
                          tabs: <Widget>[
                            GestureDetector(
                              onTap: () {
                                changePage(0);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: tabController.index == 0
                                      ? Theme.of(context).splashColor
                                      : transparent,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Text(
                                    'Бүгд',
                                    style: TextStyle(
                                      color: tabController.index == 0
                                          ? Theme.of(context).iconTheme.color
                                          : Theme.of(context).canvasColor,
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
                                width: 120,
                                height: 40,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: tabController.index == 1
                                      ? Theme.of(context).splashColor
                                      : transparent,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Text(
                                    'Зээл авсан',
                                    style: TextStyle(
                                      color: tabController.index == 1
                                          ? Theme.of(context).iconTheme.color
                                          : Theme.of(context).canvasColor,
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
                                width: 120,
                                height: 40,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: tabController.index == 2
                                      ? Theme.of(context).splashColor
                                      : transparent,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Text(
                                    'Зээл төлсөн',
                                    style: TextStyle(
                                      color: tabController.index == 2
                                          ? Theme.of(context).iconTheme.color
                                          : Theme.of(context).canvasColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      AllHistoryPage(),
                      LoanHistory(),
                      PaidHistory(),
                    ],
                  ),
                ),
    );
  }
}
