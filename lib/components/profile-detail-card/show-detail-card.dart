import 'package:bank_core/models/customer.dart';
import 'package:flutter/material.dart';

class ShowDetailCard extends StatefulWidget {
  final Customer? data;
  const ShowDetailCard({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<ShowDetailCard> createState() => _ShowDetailCardState();
}

class _ShowDetailCardState extends State<ShowDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).splashColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "И-мэйл",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                "${widget.data?.result?.email}",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ургийн овог",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                "${widget.data?.result?.familyName}",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Яс үндэс",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                "${widget.data?.result?.nationalityType?.name}",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Боловсрол",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                "${widget.data?.result?.educationType?.name}",
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Гэрлэлтийн байдал",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                "${widget.data?.result?.marriageStatus?.name}",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ам бүлийн тоо",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                "${widget.data?.result?.familyCount}",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Сарын орлого",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                "${widget.data?.result?.incomeAmountMonth}",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Хүйс",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                "${widget.data?.result?.gender!.name}",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Төрсөн газар",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                "${widget.data?.result?.birthPlace}",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ажил эрхлэлт",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                "${widget.data?.result?.workStatus?.name}",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Төрсөн өдөр",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                "${widget.data?.result?.birthDate}",
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
