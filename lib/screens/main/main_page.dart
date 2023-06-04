import 'package:bank_core/screens/lending/lending_information.dart';
import 'package:bank_core/models/user.dart';
import 'package:bank_core/screens/profile/profile_page.dart';
import 'package:bank_core/services/service_page.dart';
import 'package:flutter/material.dart';
import 'package:bank_core/screens/lending/lend.dart';
import 'package:bank_core/screens/lending/lending_information.dart';
import 'package:bank_core/screens/profile/notification.dart';
import 'package:provider/provider.dart';
import 'package:bank_core/provider/user_provider.dart';

class MainPage extends StatefulWidget {
  static const routeName = 'MainPage';
  final User? user;
  const MainPage({Key? key, this.user}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

const List<Widget> tabContainer = <Widget>[
  MainPage(),
  Lending(),
];

class _MainPageState extends State<MainPage> {
  bool _isVisible = true;
  int number = 500000;
  double _sliderValue = 20000;
  int selectedIndex = 0;
  User me = User();

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  User user = User();

  @override
  Widget build(BuildContext context) {
    me = Provider.of<UserProvider>(context, listen: true).user;
    return SafeArea(
      bottom: false,
      top: false,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.grey.shade800,
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
                            // decoration: BoxDecoration(
                            //   image: const DecorationImage(
                            //       image: AssetImage('images/1.png'),
                            //       fit: BoxFit.cover),
                            //   borderRadius: BorderRadius.circular(100),
                            // ),
                            width: 60,
                            height: 60,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.greenAccent),
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
                  shape: CircleBorder(
                      side: BorderSide(color: Colors.grey.shade500)),
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
                  shape: CircleBorder(
                      side: BorderSide(color: Colors.grey.shade500)),
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
          backgroundColor: Colors.grey.shade800,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 15,
                    ),
                    child: Row(
                      children: const [
                        Text('Дижитал зээл',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade900,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Center(
                          child: Text(
                            'Боломжит үлдэгдэл',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            '$_sliderValue₮',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Slider(
                        activeColor: Colors.white,
                        thumbColor: Colors.green.shade500,
                        inactiveColor: Colors.grey.shade600,
                        value: _sliderValue,
                        max: 500000,
                        divisions: 10,
                        label: _sliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _sliderValue = value;
                          });
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                '0₮',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                '500000₮',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Lending();
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Зээл авах',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        'Идэвхтэй зээл',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return LendInformation();
                              },
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 250,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade900,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.greenAccent,
                                  radius: 50,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey.shade900,
                                    radius: 47,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                          '5',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          'хоног',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Эргэн төлөх дүн:',
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 11),
                                        ),
                                        Text(
                                          '120000₮',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Эргэн төлөх өдөр:',
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 11),
                                        ),
                                        Text(
                                          '2023.03.21',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Зээлийн төлөв:',
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 11),
                                        ),
                                        Text(
                                          'Хэвийн',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        height: 250,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade900,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.greenAccent,
                                radius: 50,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade900,
                                  radius: 47,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text(
                                        '5',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        'хоног',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Эргэн төлөх дүн:',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 11),
                                      ),
                                      Text(
                                        '120000₮',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Эргэн төлөх өдөр:',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 11),
                                      ),
                                      Text(
                                        '2023.03.21',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Зээлийн төлөв:',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 11),
                                      ),
                                      Text(
                                        'Хэвийн',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(
                            'images/1.png',
                          ),
                          fit: BoxFit.cover)),
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
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: 'Нүүр'),
              NavigationDestination(
                icon: Icon(
                  Icons.clean_hands,
                  color: Colors.white,
                ),
                label: 'Зээл',
              ),
              NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: 'Үйлчилгээ'),
            ],
            onDestinationSelected: (int index) {
              switch (index) {
                case 0:
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return MainPage();
                  }));
                  break;

                case 1:
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Lending();
                  }));
                  break;

                case 2:
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return ServicePage();
                  }));
                  break;
              }
            },
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   backgroundColor: Colors.grey.shade800,
          //   elevation: 0,
          //   showSelectedLabels: false,
          //   showUnselectedLabels: false,
          //   items: const <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'Нүүр',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.clean_hands_rounded),
          //       label: 'Зээл авах',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.apps),
          //       label: 'Үйлчилгээ',
          //     ),
          //   ],
          //   currentIndex: selectedIndex,
          //   selectedItemColor: Colors.greenAccent,
          //   unselectedItemColor: Colors.grey,
          //   onTap: _onItemTapped,
          // ),
        ),
      ),
    );
  }
}
