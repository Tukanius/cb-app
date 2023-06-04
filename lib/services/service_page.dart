import 'package:flutter/material.dart';
import 'package:bank_core/screens/lending/lend.dart';
import 'package:bank_core/screens/main/main_page.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(50),
              child: Center(
                child: Image(image: AssetImage("images/1.png")),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {},
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
                          Icons.file_copy,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Тодорхойлолт авах',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
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
                          Icons.tab,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Зээлийн эрх ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
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
                          Icons.lock_open_outlined,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Цахим гэрээ авах ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                Icons.apps,
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
    );
  }
}
