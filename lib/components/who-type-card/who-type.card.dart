import 'package:bank_core/models/customer.dart';
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
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).splashColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.data?.whoType?.name}",
            style: TextStyle(
              color: Theme.of(context).disabledColor,
            ),
          ),
          Text(
            "${widget.data?.phone}",
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
