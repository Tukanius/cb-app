import 'package:bank_core/models/customer.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatefulWidget {
  final Customer data;
  const AddressCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).splashColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Хаягын төрөл',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${widget.data.addressType?.name}",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Аймаг/Хот',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${widget.data.province?.name}',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Дүүргэ/Сум',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${widget.data.district?.name}',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Хороо/Баг',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${widget.data.khoroo?.name}',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Хаяг/Тоот',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${widget.data.address}',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
