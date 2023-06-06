import 'package:bank_core/models/customer.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class PaidBackCard extends StatefulWidget {
  final Customer? data;
  const PaidBackCard({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<PaidBackCard> createState() => _PaidBackCardState();
}

class _PaidBackCardState extends State<PaidBackCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: darkGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.check,
                color: buttonColor,
                size: 14,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '2024/04/12',
                style: TextStyle(
                  color: grey,
                  fontSize: 12,
                ),
              )
            ],
          ),
          Text(
            "400'000₮",
            style: TextStyle(
              color: white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
