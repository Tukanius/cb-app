import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentTypeCard extends StatefulWidget {
  final Function()? onClick;
  final String? data;
  final bool? value;
  final Image? image;
  final SvgPicture? svgPicture;
  const PaymentTypeCard({
    Key? key,
    this.image,
    this.onClick,
    this.svgPicture,
    this.value,
    this.data,
  }) : super(key: key);

  @override
  _PaymentTypeCardState createState() => _PaymentTypeCardState();
}

class _PaymentTypeCardState extends State<PaymentTypeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: widget.value == true ? buttonColor : darkGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                image: AssetImage('images/3.png'),
                height: 24,
                width: 24,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.data!,
              style: TextStyle(
                color: white,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
