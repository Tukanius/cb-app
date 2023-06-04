import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/home_page/home_page.dart';
import 'package:bank_core/screens/profile/profile_page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:bank_core/screens/lending/lend.dart';
import 'package:bank_core/screens/profile/notification.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  static const routeName = 'MainPage';
  const MainPage({
    Key? key,
  }) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  bool _isVisible = true;
  int number = 500000;
  int selectedIndex = 0;
  User me = User();
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  static const List<Widget> currentPages = [
    HomePage(),
    Text('2'),
    Text('3'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    me = Provider.of<UserProvider>(context, listen: false).user;
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: backgroundColor,
          centerTitle: false,
          title: Container(
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return ProfilePage();
                          }));
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: buttonColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Сайн уу? 👋 ",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "${me.firstName}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.grey.shade700,
                shape:
                    CircleBorder(side: BorderSide(color: Colors.grey.shade500)),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                icon: _isVisible
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.white,
                      ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.grey.shade700,
                shape:
                    CircleBorder(side: BorderSide(color: Colors.grey.shade500)),
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return NotificationPage();
                    }));
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: currentPages.elementAt(selectedIndex),
        bottomNavigationBar: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: BottomNavigationBar(
            useLegacyColorScheme: true,
            selectedItemColor: buttonColor,
            unselectedItemColor: grey,
            unselectedLabelStyle: TextStyle(color: grey),
            backgroundColor: backgroundColor,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    selectedIndex == 0
                        ? Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 50,
                            height: 2,
                            color: buttonColor,
                          )
                        : Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 50,
                            height: 2,
                            color: transparent,
                          ),
                    SvgPicture.asset('images/home.svg'),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                label: 'Нүүр',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    selectedIndex == 1
                        ? Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 50,
                            height: 2,
                            color: buttonColor,
                          )
                        : Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 50,
                            height: 2,
                            color: transparent,
                          ),
                    SvgPicture.asset('images/lend.svg'),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                label: 'Зээл',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    selectedIndex == 2
                        ? Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 50,
                            height: 2,
                            color: buttonColor,
                          )
                        : Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 50,
                            height: 2,
                            color: transparent,
                          ),
                    SvgPicture.asset('images/shop.svg'),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                label: 'Дэлгүүр',
              ),
            ],
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
      ..strokeWidth = 5
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), _paint);
  }
}
