import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final Function()? onClick;
  final Widget? icon;
  const ActionButton({
    this.onClick,
    Key? key,
    this.icon,
  }) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: grey.withOpacity(0.12), width: 0.5),
          color: grey.withOpacity(0.05),
        ),
        child: widget.icon,
      ),
    );
  }
}
