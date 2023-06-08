import 'dart:io';

import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/home-page/home-page.dart';
import 'package:bank_core/screens/profile-page/profile-page.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  static const routeName = 'MainPage';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  User user = User();
  int currentIndex = 0;
  bool isView = false;

  static const List<Widget> currentPages = [
    HomePage(),
    Text("2"),
    Text("3"),
  ];

  ontappedItem(index) {
    setState(() {
      currentIndex = index;
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
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: backgroundColor,
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
                      color: white,
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
                      'Сайн уу?',
                      style: TextStyle(
                        color: grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${user.firstName}',
                      style: TextStyle(
                        color: white,
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
                icon: isView == false
                    ? Icon(
                        Icons.visibility,
                        color: white,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: white,
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
                icon: Icon(
                  Icons.notifications,
                  color: white,
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          body: currentPages.elementAt(currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: grey,
            backgroundColor: backgroundColor,
            selectedItemColor: buttonColor,
            onTap: ontappedItem,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      'images/home.svg',
                      color: currentIndex == 0 ? buttonColor : grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Нүүр',
                      style: TextStyle(
                        color: currentIndex == 0 ? buttonColor : grey,
                      ),
                    )
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      'images/lend.svg',
                      color: currentIndex == 1 ? buttonColor : grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Зээл',
                      style: TextStyle(
                        color: currentIndex == 1 ? buttonColor : grey,
                      ),
                    )
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      'images/shop.svg',
                      color: currentIndex == 2 ? buttonColor : grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Дэлгүүр',
                      style: TextStyle(
                        color: currentIndex == 2 ? buttonColor : grey,
                      ),
                    )
                  ],
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
