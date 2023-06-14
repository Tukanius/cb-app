import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class TransactionHistoryCard extends StatefulWidget {
  final bool? isIncome;
  final Function()? onClick;
  const TransactionHistoryCard({
    this.onClick,
    Key? key,
    this.isIncome,
  }) : super(key: key);

  @override
  State<TransactionHistoryCard> createState() => _TransactionHistoryCardState();
}

class _TransactionHistoryCardState extends State<TransactionHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: darkGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '2023-6-10',
              style: TextStyle(
                color: widget.isIncome == true ? green : red,
              ),
            ),
            widget.isIncome == true
                ? Text(
                    '+300,000.00₮',
                    style: TextStyle(
                      color: green,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : Text(
                    '-300,000.00₮',
                    style: TextStyle(
                      color: red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
