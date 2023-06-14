import 'package:bank_core/models/customer.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class TransactionHistoryCard extends StatefulWidget {
  final bool? isIncome;
  final Customer? data;
  final Function()? onClick;
  const TransactionHistoryCard({
    this.onClick,
    this.data,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2023-6-10',
                  style: TextStyle(
                    color: grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.data?.description}',
                  style: TextStyle(
                    color: white,
                  ),
                ),
              ],
            ),
            widget.data?.type != "зарлага"
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
