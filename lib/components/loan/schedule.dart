import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/cupertino.dart';

class LoanSchedule extends StatefulWidget {
  final bool? isSelected;
  final Function()? onClick;
  final String? data;
  const LoanSchedule({
    this.onClick,
    Key? key,
    this.isSelected,
    this.data,
  }) : super(key: key);

  @override
  State<LoanSchedule> createState() => _LoanScheduleState();
}

class _LoanScheduleState extends State<LoanSchedule> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: widget.isSelected == true ? buttonColor : darkGrey,
        ),
        child: Text(
          '${widget.data}',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
