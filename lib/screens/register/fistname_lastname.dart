import 'package:bank_core/screens/register/gender.dart';
import 'package:flutter/material.dart';

class FirstName extends StatefulWidget {
  const FirstName({super.key});

  @override
  State<FirstName> createState() => _FirstNameState();
}

class _FirstNameState extends State<FirstName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: AppBar(
              backgroundColor: Colors.grey.shade800,
              automaticallyImplyLeading: false,
              elevation: 0,
              leading: Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(7),
                decoration: ShapeDecoration(
                  color: Colors.grey.shade700,
                  shape: CircleBorder(
                      side: BorderSide(color: Colors.grey.shade500)),
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
                "Овог нэр",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 238, 238, 238), width: 1),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(),
                    hintText: 'Овог',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 238, 238, 238), width: 1),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(),
                    hintText: 'Нэр',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                  return Gender();
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
