import 'package:bank_core/models/customer.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class BankAccountCard extends StatefulWidget {
  final Customer? data;
  const BankAccountCard({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<BankAccountCard> createState() => _BankAccountCardState();
}

class _BankAccountCardState extends State<BankAccountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage('images/2.png'),
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.data!.bank!.name}',
                    style: TextStyle(
                      color: grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${widget.data!.accountNumber}',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
          // Text(
          //   "${widget.data!.getPostDate()}",
          //   style: TextStyle(
          //     color: white,
          //     fontWeight: FontWeight.w600,
          //   ),
          // )
        ],
      ),
    );
  }
}
