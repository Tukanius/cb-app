import 'package:bank_core/models/customer.dart';
import 'package:bank_core/utils/utils.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActiveLoanCard extends StatefulWidget {
  final Customer? data;
  final Function()? onClick;
  const ActiveLoanCard({
    Key? key,
    this.data,
    this.onClick,
  }) : super(key: key);

  @override
  State<ActiveLoanCard> createState() => _ActiveLoanCardState();
}

class _ActiveLoanCardState extends State<ActiveLoanCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: darkGrey,
        ),
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 50,
              percent: 0.3,
              progressColor: buttonColor,
              backgroundColor: black,
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
                      '${Utils().formatCurrency(widget.data!.totalPayAmount)}₮',
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
                      'Эргэн төлөх өдөр: ',
                      style: TextStyle(
                        color: grey,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${widget.data!.payDate}',
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
                      'Зээлийн төлөв: ',
                      style: TextStyle(
                        color: grey,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${widget.data!.loan!.loanStatusId}',
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
      ),
    );
  }
}
