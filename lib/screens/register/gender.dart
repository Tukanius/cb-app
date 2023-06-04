import 'package:bank_core/screens/register/date.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int _value = 1;
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
          "Хүйс",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      backgroundColor: Colors.grey.shade800,
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: _value == 1 ? Colors.black : Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade100,
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Radio(
                      value: 1,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.greenAccent),
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Эрэгтэй'),
                  ],
                ),
              ),
              Container(
                height: 50,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: _value == 2 ? Colors.black : Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade100,
                ),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.greenAccent),
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Эмэгтэй'),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.greenAccent,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Date();
                }));
              },
              child: Center(
                child: const Text(
                  'Үргэлжлүүлэх',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
