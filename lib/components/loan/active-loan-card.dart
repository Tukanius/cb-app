import 'package:bank_core/models/customer.dart';
import 'package:bank_core/utils/utils.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:after_layout/after_layout.dart';
import 'package:intl/intl.dart';

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

class _ActiveLoanCardState extends State<ActiveLoanCard> with AfterLayoutMixin {
  Duration duration = Duration();
  bool isLoading = true;

  afterFirstLayout(BuildContext context) async {
    String dateString = widget.data!.payDate.toString();

    DateFormat dateFormat = DateFormat("yyyy-MM-dd");

    DateTime expirationDate = dateFormat.parse(dateString);

    DateTime currentDate = DateTime.now();

    duration = expirationDate.difference(currentDate);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).splashColor,
        ),
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 50,
              percent: 1 - (13 / 14),
              progressColor: buttonColor,
              backgroundColor: black,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isLoading == false
                      ? Text(
                          "${duration.inDays}",
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(""),
                  Text(
                    'хоног',
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
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
                        color: Theme.of(context).disabledColor,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${Utils().formatCurrency(widget.data!.total_pay_amount)}₮',
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
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
                        color: Theme.of(context).disabledColor,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${widget.data!.payDate}',
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
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
                        color: Theme.of(context).disabledColor,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${widget.data!.loan?.loanType?.name}',
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
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
