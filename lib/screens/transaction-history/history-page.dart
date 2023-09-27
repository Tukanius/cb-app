import 'package:bank_core/api/loan-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/transaction-history-card/transaction-history-card.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/notification-page/notification-page.dart';
import 'package:bank_core/screens/profile-page/profile-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  late TabController tabController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.index = currentIndex;
    super.initState();
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
  afterFirstLayout(BuildContext context) async {
    list(page, limit);
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
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Column(
                            children: transactionList.rows!
                                .map(
                                  (item) => TransactionHistoryCard(
                                    data: item,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        // SliverList(
                        //   delegate: SliverChildBuilderDelegate(
                        //     (BuildContext context, int index) {
                        //       return Column(
                        //         children: transactionList.rows!
                        //             .map(
                        //               (item) => TransactionHistoryCard(
                        //                 data: item,
                        //               ),
                        //             )
                        //             .toList(),
                        //       );
                        //     },
                        //     childCount: 1,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
/*
SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CustomAppBar(),
                      SizedBox(
                        height: 20,
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
                )
 */