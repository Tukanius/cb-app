import 'dart:io';

import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/home-page/home-page.dart';
import 'package:bank_core/screens/notification-page/notification-page.dart';
import 'package:bank_core/screens/profile-page/profile-page.dart';
import 'package:bank_core/screens/shop-page/shop-page.dart';
import 'package:bank_core/screens/transaction-history/history-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  static const routeName = 'MainPage';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  User user = User();
  bool isView = false;
  int currentIndex = 0;
  bool isDarkMode = false;

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    setState(() {
      currentIndex = tabController.index;
    });
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Баталгаажуулалт'),
      content: const Text('Та гарахдаа итгэлтэй байна уу?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Болих'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            exit(0);
          },
          child: const Text('Гарах'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: true).user;
    isView = Provider.of<UserProvider>(context, listen: true).isView;
    isDarkMode = Provider.of<UserProvider>(context, listen: true).check;

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          bottom: true,
          top: false,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 0,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfilePage.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).canvasColor,
                      ),
                      height: 40,
                      width: 40,
                    ),
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
              actions: [
                ActionButton(
                  icon: isDarkMode == false
                      ? SvgPicture.asset(
                          "assets/svg/dark-mode.svg",
                          height: 24,
                          width: 24,
                          color: black,
                        )
                      : SvgPicture.asset(
                          "assets/svg/dark-mode.svg",
                          height: 24,
                          width: 24,
                          color: white,
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
                    Navigator.of(context).pushNamed(NotificationPage.routeName);
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
            body: TabBarView(
              controller: tabController,
              children: [
                HomePage(),
                HistoryPage(),
                ShopPage(),
              ],
            ),
            bottomNavigationBar: Material(
              color: Theme.of(context).colorScheme.background,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: TabBar(
                  splashBorderRadius: BorderRadius.circular(20),
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => backgroundColor),
                  controller: tabController,
                  labelColor: buttonColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: greyDark,
                  labelPadding: EdgeInsets.only(
                    top: 5,
                  ),
                  indicator: TopIndicator(),
                  tabs: <Widget>[
                    Tab(
                        icon: SvgPicture.asset(
                          "assets/svg/home1.svg",
                          height: 24,
                          width: 24,
                          color: currentIndex == 0 ? buttonColor : greyDark,
                        ),
                        text: 'Нүүр'),
                    Tab(
                        icon: SvgPicture.asset(
                          "assets/svg/list.svg",
                          height: 24,
                          width: 24,
                          color: currentIndex == 1 ? buttonColor : greyDark,
                        ),
                        text: 'Түүх'),
                    Tab(
                        icon: SvgPicture.asset(
                          "assets/svg/shop.svg",
                          height: 24,
                          width: 24,
                          color: currentIndex == 2 ? buttonColor : greyDark,
                        ),
                        text: 'Дэлгүүр'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint _paint = Paint()
      ..color = buttonColor
      ..strokeWidth = 3
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), _paint);
  }
}
