import 'package:bank_core/models/customer.dart';
import 'package:bank_core/utils/utils.dart';
import 'package:flutter/material.dart';

class LoanScheduleCard extends StatefulWidget {
  final Customer? data;
  const LoanScheduleCard({
    Key? key,
    this.data,
  }) : super(key: key);

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
        color: Theme.of(context).splashColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            // '${widget.data!.payDate}',
            '2023-10-01',
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            color: Colors.grey,
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
                  color: Theme.of(context).disabledColor,
                  fontSize: 12,
                ),
              ),
              Text(
                "${Utils().formatCurrency(widget.data!.totalPayAmount)}₮",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
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
                  color: Theme.of(context).disabledColor,
                  fontSize: 12,
                ),
              ),
              Text(
                "${Utils().formatCurrency(widget.data!.loanResidual)}₮",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
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
                  color: Theme.of(context).disabledColor,
                  fontSize: 12,
                ),
              ),
              Text(
                "${Utils().formatCurrency(widget.data!.rateAmount)}₮",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
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
                  color: Theme.of(context).disabledColor,
                  fontSize: 12,
                ),
              ),
              Text(
                "${Utils().formatCurrency(widget.data!.mainLoanPayAmount)}₮",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
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
