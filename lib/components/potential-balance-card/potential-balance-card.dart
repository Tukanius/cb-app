import 'package:bank_core/models/get.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class PotentialBalanceCard extends StatefulWidget {
  final Function()? onClick;
  final Get? data;
  final bool? slider;
  final bool? button;
  const PotentialBalanceCard({
    this.data,
    this.slider,
    this.button,
    Key? key,
    this.onClick,
  }) : super(key: key);

  @override
  State<PotentialBalanceCard> createState() => _PotentialBalanceCardState();
}

class _PotentialBalanceCardState extends State<PotentialBalanceCard> {
  double maxValue = 400000;
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    var division = maxValue / 10000;
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
                widget.slider == false || widget.slider == null
                    ? Container(
                        child: Text(
                          'Боломжит үлдэгдэл',
                          style: TextStyle(
                            color: grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      )
                    : Container(
                        child: Text(
                          'Эргэн төлөлтийн дүн',
                          style: TextStyle(
                            color: grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                widget.slider == false || widget.slider == null
                    ? Text(
                        "${widget.data!.balance}₮",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      )
                    : Text(
                        '${currentValue.toInt()}',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
              ],
            ),
          ),
          widget.slider == true || widget.slider == null
              ? Slider(
                  min: 0,
                  max: maxValue,
                  thumbColor: buttonColor,
                  activeColor: white,
                  inactiveColor: grey.withOpacity(0.2),
                  label: '${currentValue.toInt()}',
                  divisions: division.toInt(),
                  value: currentValue,
                  onChanged: (double value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                )
              : SizedBox(),
          widget.button == true || widget.button == null
              ? GestureDetector(
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
              : SizedBox(),
          widget.slider != true || widget.slider == null
              ? SizedBox()
              : SizedBox(
                  height: 40,
                )
        ],
      ),
    );
  }
}
