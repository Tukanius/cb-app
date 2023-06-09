import 'package:flutter/material.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';

class CustomButton extends StatefulWidget {
  final bool? boxShadow;
  final String labelText;
  final Function()? onClick;
  final Color? labelColor;
  final Color? textColor;
  CustomButton({
    this.boxShadow,
    this.textColor,
    this.labelColor,
    this.onClick,
    this.labelText = '',
    Key? key,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 42,
        decoration: BoxDecoration(
          boxShadow: [
            widget.boxShadow == true || widget.boxShadow == null
                ? BoxShadow(
                    blurRadius: 12,
                    color: buttonColor.withOpacity(0.5),
                    offset: Offset(0, 3),
                  )
                : BoxShadow(
                    blurRadius: 0,
                    color: buttonColor.withOpacity(0.0),
                    offset: Offset(0, 0),
                  ),
          ],
        ),
        child: ElevatedButton(
          onPressed: widget.onClick,
          child: Text(
            widget.labelText.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: widget.textColor == null ? white : widget.textColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            shadowColor: Colors.transparent,
            backgroundColor: widget.labelColor,
          ),
        ),
      ),
    );
  }
}
