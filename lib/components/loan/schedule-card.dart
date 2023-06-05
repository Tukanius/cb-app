import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class LoanScheduleCard extends StatefulWidget {
  const LoanScheduleCard({super.key});

  @override
  State<LoanScheduleCard> createState() => _LoanScheduleCardState();
}

class _LoanScheduleCardState extends State<LoanScheduleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2024/04/12',
            style: TextStyle(
              color: white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            color: grey,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Төлөх дүн',
                style: TextStyle(
                  color: grey,
                  fontSize: 12,
                ),
              ),
              Text(
                "160'000₮",
                style: TextStyle(
                  color: white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Зээлийн үлдэгдэл',
                style: TextStyle(
                  color: grey,
                  fontSize: 12,
                ),
              ),
              Text(
                "160'000₮",
                style: TextStyle(
                  color: white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Зээлийн хүү',
                style: TextStyle(
                  color: grey,
                  fontSize: 12,
                ),
              ),
              Text(
                "160'000₮",
                style: TextStyle(
                  color: white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Үндсэн зээлээс',
                style: TextStyle(
                  color: grey,
                  fontSize: 12,
                ),
              ),
              Text(
                "160'000₮",
                style: TextStyle(
                  color: white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
