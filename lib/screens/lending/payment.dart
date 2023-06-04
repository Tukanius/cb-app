import 'package:flutter/material.dart';
import 'package:bank_core/screens/main/main_page.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  double _sliderValue = 20000;
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
          "Зээл төлөх",
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
                    'Төлөх дүн',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              height: 180,
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
                        'Эргэн төлөлтийн дүн',
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Text(
                    'Төлөх',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Container(
                    child: Column(
                      children: [
                        Image(image: AssetImage('images/1.png')),
                      ],
                    ),
                  ),
                  content: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Column(
                      children: [
                        Text(
                          'Амжилттай',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    Center(
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.greenAccent,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return MainPage();
                              },
                            ));
                          },
                          child: Container(
                            child: Center(
                                child: Text(
                              'Ok',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage('images/4.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Social Pay',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
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
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: const DecorationImage(
                        image: AssetImage('images/3.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Q Pay',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
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
                  Container(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.home,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Шилжүүлэг хийх',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Text(
                    'Дараагийн төлөлт',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: MediaQuery.of(context).size.width,
              height: 60,
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
                        Icons.calendar_month,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Төлбөр хийх өдөр',
                        style: TextStyle(color: Colors.grey.shade400),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '2023/3/23',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: MediaQuery.of(context).size.width,
              height: 60,
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
                        Icons.money,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Төлбөрийн дүн',
                        style: TextStyle(color: Colors.grey.shade400),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '400000₮',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: MediaQuery.of(context).size.width,
              height: 60,
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
                        Icons.percent,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Нэмэгдүүлсэн хүүгийн дүн',
                        style: TextStyle(color: Colors.grey.shade400),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '400000₮',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
    );
  }
}
