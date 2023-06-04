import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function()? onClick;
  final String? labelText;
  final Color? color;
  final Color? textColor;
  const CustomButton({
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
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ElevatedButton(
        onPressed: widget.onClick,
        child: Text(
          '${widget.labelText}',
          style: TextStyle(
            color: widget.textColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
        ),
      ),
    );
  }
}
