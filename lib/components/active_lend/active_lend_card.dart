import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActiveLendCard extends StatefulWidget {
  const ActiveLendCard({super.key});

  @override
  State<ActiveLendCard> createState() => _ActiveLendCardState();
}

class _ActiveLendCardState extends State<ActiveLendCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 50,
            percent: 0.3,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '5',
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'хоног',
                  style: TextStyle(
                    color: grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            progressColor: buttonColor,
            backgroundColor: Colors.black,
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Эргэн төлөх дүн: ',
                    style: TextStyle(
                      color: grey,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '120000₮',
                    style: TextStyle(
                      color: white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Эргэн төлөх өдөр',
                    style: TextStyle(
                      color: grey,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '2023.03.21',
                    style: TextStyle(
                      color: white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Зээлийн төлөв',
                    style: TextStyle(
                      color: grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Хэвийн',
                    style: TextStyle(
                      color: white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
