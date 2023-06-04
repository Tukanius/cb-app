import 'package:bank_core/screens/lending/lendschedule.dart';
import 'package:bank_core/screens/lending/payment.dart';
import 'package:flutter/material.dart';

class LendInformation extends StatefulWidget {
  const LendInformation({super.key});

  @override
  State<LendInformation> createState() => _LendInformationState();
}

class _LendInformationState extends State<LendInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(7),
          decoration: ShapeDecoration(
            color: Colors.grey.shade700,
            shape: CircleBorder(side: BorderSide(color: Colors.grey.shade500)),
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
        centerTitle: true,
        title: const Text(
          "Зээлийн дэлгэрэнгүй",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'Дижитал зээл',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black54,
              ),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.greenAccent,
                    ),
                    child: Container(
                      margin: EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Зээлийн үлдэгдэл',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                '400000₮',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: 70, left: 20, bottom: 10, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Олгогдсон зээл',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    '500,000₮',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 20, left: 20, bottom: 10, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Зээлийн хүү',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    '2.35%',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade400,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: 55, left: 20, bottom: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Зээлийн үлдэгдэл',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    '400,000₮',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 20, left: 20, bottom: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Хуримтлагдсан хүү',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    '12000₮',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
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
              margin: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Payment();
                          },
                        ),
                      );
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return Payment();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 170,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 35,
                            ),
                            Icon(
                              Icons.clean_hands_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Зээл төлөх',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 170,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Icon(
                          Icons.money,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Зээл хаах',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
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
                      return Schedule();
                    },
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Зээлийн хуваарь',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 35, bottom: 15),
              child: Row(
                children: [
                  Text(
                    'Зээлийн түүх',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
              height: 500,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  for (var i = 0; i < 10; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black54,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.check,
                                color: Colors.greenAccent,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '2024/04/12',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '400000₮',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
