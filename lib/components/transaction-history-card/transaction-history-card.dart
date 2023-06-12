import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class TransactionHistoryCard extends StatefulWidget {
  final bool? isIncome;
  const TransactionHistoryCard({
    Key? key,
    this.isIncome,
  }) : super(key: key);

  @override
  State<TransactionHistoryCard> createState() => _TransactionHistoryCardState();
}

class _TransactionHistoryCardState extends State<TransactionHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '300,000.00₮',
            style: TextStyle(
              color: widget.isIncome == true ? green : red,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '2023-6-10',
            style: TextStyle(
              color: widget.isIncome == true ? green : red,
            ),
          ),
        ],
      ),
    );
  }
}
