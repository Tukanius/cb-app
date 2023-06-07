import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class OwnBankAccountCard extends StatefulWidget {
  final bool? arrowDown;
  static const routeName = "OwnBankAccountCard";
  const OwnBankAccountCard({Key? key, this.arrowDown}) : super(key: key);

  @override
  State<OwnBankAccountCard> createState() => _OwnBankAccountCardState();
}

class _OwnBankAccountCardState extends State<OwnBankAccountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    image: AssetImage('images/2.png'),
                    height: 35,
                    width: 35,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Golomt bank',
                    style: TextStyle(
                      color: grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '141 423 8739',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
          widget.arrowDown == true || widget.arrowDown == null
              ? Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: white,
                  size: 25,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
