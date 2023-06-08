import 'package:bank_core/models/get.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/utils/utils.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PotentialBalanceCard extends StatefulWidget {
  final Function()? onClick;
  final Get? data;
  final bool? button;
  const PotentialBalanceCard({
    this.data,
    this.button,
    Key? key,
    this.onClick,
  }) : super(key: key);

  @override
  State<PotentialBalanceCard> createState() => _PotentialBalanceCardState();
}

class _PotentialBalanceCardState extends State<PotentialBalanceCard> {
  bool isView = false;

  @override
  Widget build(BuildContext context) {
    isView = Provider.of<UserProvider>(context, listen: true).isView;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: darkGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Боломжит үлдэгдэл',
                    style: TextStyle(
                      color: grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                isView == false
                    ? Text(
                        "${Utils().formatCurrency(widget.data?.balance)}₮",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      )
                    : Text(
                        '*******',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
              ],
            ),
          ),
          GestureDetector(
            onTap: widget.onClick,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: buttonColor,
              ),
              child: Text(
                'Зээл авах',
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
