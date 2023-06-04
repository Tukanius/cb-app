import 'package:bank_core/screens/register/confirmcode.dart';
import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  const Date({super.key});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
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
          "Төрсөн он сар өдөр",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade100,
            ),
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(_dateTime.year.toString(), style: TextStyle(fontSize: 15)),
                Text('он'),
                Text(_dateTime.month.toString(),
                    style: TextStyle(fontSize: 15)),
                Text('сарын'),
                Text(_dateTime.day.toString(), style: TextStyle(fontSize: 15)),
                MaterialButton(
                  onPressed: _showDatePicker,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
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
                  return ConfirmCode();
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
