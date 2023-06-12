import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String label;
  final String name;
  final bool isDone;
  final Function() onTap;
  const Description(
      {Key? key,
      required this.label,
      required this.name,
      required this.isDone,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: grey,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              isDone == false
                  ? GestureDetector(
                      onTap: onTap,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          "Баталгаажуулах",
                          style: TextStyle(
                            color: greyDark,
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(3),
                      child: Text(
                        "Баталгаажсан",
                        style: TextStyle(
                          color: buttonColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
