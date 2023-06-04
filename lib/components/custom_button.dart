import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function()? onClick;
  final bool? boxShadow;
  final String? labelText;
  final Color? color;
  final Color? textColor;
  const CustomButton({
    this.boxShadow,
    this.textColor,
    this.color,
    this.labelText,
    Key? key,
    this.onClick,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          widget.boxShadow == true
              ? BoxShadow(
                  color: buttonColor.withOpacity(0.5),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                )
              : BoxShadow(
                  color: buttonColor.withOpacity(0.5),
                  blurRadius: 0,
                  offset: Offset(0, 0),
                )
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 56,
      child: ElevatedButton(
        onPressed: widget.onClick,
        child: Text(
          '${widget.labelText}',
          style: TextStyle(
            color: widget.textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
        ),
      ),
    );
  }
}
