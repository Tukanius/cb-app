import 'package:bank_core/models/customer.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  show(ctx) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: black.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 20),
                        child: Text(
                          'Гүйлгээний түүхийн дэлгэрэнгүй',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Divider(
                        color: grey.withOpacity(0.3),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Шилжүүлсэн данс',
                            style: TextStyle(color: grey),
                          ),
                          Text(
                            '${widget.data?.debitAccountNumber}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Харьцсан дансны нэр',
                            style: TextStyle(color: grey),
                          ),
                          Text(
                            '${widget.data?.debitAccountName}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Гүйлгээний дүн',
                            style: TextStyle(color: grey),
                          ),
                          Text(
                            '${widget.data?.amount}₮',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: grey.withOpacity(0.3),
                      ),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              "Болсон",
                              style: TextStyle(color: white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        show(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).splashColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMd()
                      .format(DateTime.parse("${widget.data?.createdAt}")),
                  style: TextStyle(
                    color: Theme.of(context).disabledColor,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                widget.data?.description != null
                    ? Text(
                        '${widget.data?.description}',
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Text(
              '${widget.data?.amount}',
              style: TextStyle(
                color: widget.data?.type != "ЗАРЛАГА"
                    ? Colors.red.shade600
                    : lightgreen,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
