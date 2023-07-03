import 'package:flutter/material.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';

class CustomButton extends StatefulWidget {
  final bool? boxShadow;
  final String labelText;
  final Function()? onClick;
  final Color? labelColor;
  final bool? isLoading;
  final double? borderWidth;
  final Color? borderColor;
  final Color? textColor;
  CustomButton({
    this.boxShadow,
    this.textColor,
    this.labelColor,
    this.isLoading,
    this.onClick,
    this.labelText = '',
    this.borderWidth = 0,
    this.borderColor = transparent,
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
          border: Border.all(
              color: widget.borderColor!, width: widget.borderWidth!),
          borderRadius: BorderRadius.circular(10),
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
          onPressed: widget.isLoading == false ? widget.onClick : () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.isLoading == true)
                Container(
                  margin: EdgeInsets.only(
                    right: 15,
                  ),
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: backgroundColor,
                    strokeWidth: 2.5,
                  ),
                ),
              Text(
                widget.labelText.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: widget.textColor == null ? white : widget.textColor,
                ),
              ),
            ],
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
