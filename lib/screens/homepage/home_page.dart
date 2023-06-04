import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _sliderValue = 20000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            '0',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text(
                            '500000',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                      ),
                      child: const Text(
                        'Зээл авах',
                        style: TextStyle(fontSize: 20),
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
    );
  }
}
