import 'package:bank_core/models/customer.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionHistoryCard extends StatefulWidget {
  final Customer? data;
  final Function()? onClick;
  const TransactionHistoryCard({
    this.onClick,
    this.data,
    Key? key,
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
                    color: Theme.of(context).colorScheme.background,
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
                            color: Theme.of(context).iconTheme.color,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Хүлээн авсан данс',
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          Text(
                            '${widget.data?.creditAccountNumber}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).iconTheme.color,
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
                            'Хүлээн авсан дансны нэр',
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          Text(
                            '${widget.data?.creditAccountName}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).iconTheme.color,
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
                            style: TextStyle(
                                color: Theme.of(context).iconTheme.color),
                          ),
                          Text(
                            '${widget.data?.amount}₮',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(color: Theme.of(context).iconTheme.color),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Text(
                              "Болсон",
                              style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                              ),
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
    print(widget.data?.toJson());
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
              '${widget.data?.amount} ₮',
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
