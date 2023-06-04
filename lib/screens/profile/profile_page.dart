import 'package:bank_core/models/customer_address.dart';
import 'package:bank_core/screens/login/login.dart';
import 'package:bank_core/screens/profile/condition.dart';
import 'package:bank_core/screens/profile/card/connect_cart.dart';
import 'package:bank_core/screens/profile/customer_address.dart';
import 'package:bank_core/screens/profile/loginsettings.dart';
import 'package:bank_core/screens/profile/profileinformation.dart';
import 'package:bank_core/screens/profile/whotype.dart';
import 'package:bank_core/screens/splash/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User me = User();

  logout() async {
    await Provider.of<UserProvider>(context, listen: false).logout();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SplashPage()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    me = Provider.of<UserProvider>(context, listen: true).user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(7),
            decoration: ShapeDecoration(
              color: Colors.grey.shade700,
              shape:
                  CircleBorder(side: BorderSide(color: Colors.grey.shade500)),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        child: InkWell(
                          child: Container(
                            width: 80,
                            height: 80,
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.greenAccent,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Сайн уу? ",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              Text(
                                "${me.firstName}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${me.lastName}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
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
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ProfileInformation();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Миний мэдээлэл',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ConnectCard();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.credit_card_outlined,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Данс холбох',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return LoginSettings();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.lock_outline,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Нэвтрэх тохиргоо',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Condition();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.contact_mail_outlined,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Үйлчилгээний нөхцөл',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return WhoType();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.credit_card_outlined,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'WhoType',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Address();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.add_home_rounded,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Гэрийн хаяг нэмэх',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey.shade800,
        elevation: 0,
        destinations: [
          NavigationDestination(
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
              label: 'Тохиргоо'),
          NavigationDestination(
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.white,
              size: 30,
            ),
            label: 'Гарах',
          ),
        ],
        onDestinationSelected: (int index) {
          switch (index) {
            case 1:
              logout();
          }
        },
      ),
    );
  }
}
