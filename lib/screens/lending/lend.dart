import 'package:flutter/material.dart';
import 'package:bank_core/screens/main/main_page.dart';
import 'package:bank_core/screens/lending/lend.dart';

class Lending extends StatefulWidget {
  static const routeName = 'Lending';
  const Lending({super.key});

  @override
  State<Lending> createState() => _LendingState();
}

class _LendingState extends State<Lending> {
  double _sliderValue = 0;
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        automaticallyImplyLeading: false,
        elevation: 1,
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
              size: 13,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Зээл авах",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: Colors.grey.shade700,
              shape:
                  CircleBorder(side: BorderSide(color: Colors.grey.shade500)),
            ),
            child: IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Divider(
            //   color: Colors.grey,
            // ),
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
            Container(
              margin: EdgeInsets.only(left: 15, top: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Хугацаа',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Зээлийн хугацаа сонгох: ',
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade500),
                      ),
                      Text(
                        '/Хоног/',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        BoxDecoration(color: Colors.greenAccent);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black54,
                      ),
                      child: Center(
                        child: Text(
                          '7',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black54,
                    ),
                    child: Center(
                      child: Text(
                        '14',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black54,
                    ),
                    child: Center(
                      child: Text(
                        '21',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 80,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black54,
                    ),
                    child: Center(
                      child: Text(
                        '30',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black54,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Зээлийн хүү',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      ' 4.5% ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black54,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Төлөх огноо',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      ' 2023.03.23 ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40, left: 15),
                        child: Text(
                          'Хүлээн авах данс',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: const DecorationImage(
                                        image: AssetImage('images/2.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Голомт банк",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          "1532052035",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
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
                          margin: EdgeInsets.only(right: 10),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Center(
                            child: const Text(
                          'Зээлийн нөхцөл',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                        content: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: Container(
                            child: Column(
                              children: [
                                const Divider(),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Хугацаа',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        '2023.03.23/ 30хоног /',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
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
                                        'Зээлийн үндсэн дүн',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        '50000.00₮',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
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
                                        'Сарын хүү 4.5%',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        '2000.00₮',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
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
                                        'Үйлчилгээний шимтгэл',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        '2000.00₮',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
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
                                        'Нийт төлөх дүн',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        '54000.00₮',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 140,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.greenAccent),
                                  ),
                                  child: InkWell(
                                    onTap: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: Container(
                                      child: Center(
                                          child: Text(
                                        'Татгалзах',
                                        style: TextStyle(
                                          color: Colors.greenAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.greenAccent,
                                  ),
                                  child: InkWell(
                                    onTap: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Icon(Icons.cancel),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                              ),
                                              Center(
                                                  child: const Text(
                                                'Баталгаажуулалт',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )),
                                            ],
                                          ),
                                        ),
                                        content: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 200,
                                          child: Container(
                                            child: Column(
                                              children: [
                                                const Divider(),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                    border: Border.all(
                                                      color: Colors.greenAccent,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 10),
                                                        child: Text(
                                                          'Нууц үг',
                                                          style: TextStyle(
                                                              color: Colors
                                                                      .greenAccent[
                                                                  400]),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: TextFormField(
                                                          obscureText: true,
                                                          obscuringCharacter:
                                                              "*",
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        15,
                                                                    vertical:
                                                                        15),
                                                            filled: true,
                                                            hintStyle:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .black54,
                                                                    fontSize:
                                                                        14),
                                                            fillColor: Colors
                                                                .grey.shade100,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 280,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.greenAccent,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () =>
                                                        showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                        title: Container(
                                                          child: Column(
                                                            children: [
                                                              Image(
                                                                  image: AssetImage(
                                                                      'images/1.png')),
                                                            ],
                                                          ),
                                                        ),
                                                        content: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 50,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                'Амжилттай',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        18),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          Center(
                                                            child: Container(
                                                              width: 200,
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                color: Colors
                                                                    .greenAccent,
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(
                                                                          MaterialPageRoute(
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return MainPage();
                                                                    },
                                                                  ));
                                                                },
                                                                child:
                                                                    Container(
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    'Ok',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            20),
                                                                  )),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    child: Container(
                                                      child: Center(
                                                          child: Text(
                                                        'Баталгаажуулах',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                        ),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    child: Container(
                                      child: Center(
                                          child: Text(
                                        'Зөвшөөрөх',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.greenAccent,
                      ),
                      child: Center(
                        child: Text(
                          'Үргэлжлүүлэх',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
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
