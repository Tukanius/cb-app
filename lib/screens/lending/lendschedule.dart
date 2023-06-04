import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
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
          "Зээл хуваарь",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  for (var i = 0; i < 6; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black54,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: Text(
                                  '2024/04/12',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Төлөх дүн',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '160000₮',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Зээлийн үлдэгдэл',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '360000₮',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Зээлийн хүү',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '3000₮',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Үндсэн зээлээс',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '160000₮',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
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
