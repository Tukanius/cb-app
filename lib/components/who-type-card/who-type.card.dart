import 'package:bank_core/models/customer.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class WhoTypeCard extends StatefulWidget {
  final Customer? data;
  const WhoTypeCard({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<WhoTypeCard> createState() => _WhoTypeCardState();
}

class _WhoTypeCardState extends State<WhoTypeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.data!.name}",
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${widget.data!.phone}",
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
