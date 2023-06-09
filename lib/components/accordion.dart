import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String content;

  const Accordion({Key? key, required this.title, required this.content})
      : super(key: key);
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: darkGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _showContent = !_showContent;
          });
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: white,
                  ),
                ),
                trailing: Icon(
                    _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                iconColor: white,
              ),
              _showContent
                  ? Container(
                      padding: EdgeInsets.only(
                        right: 15,
                        left: 15,
                        bottom: 5,
                      ),
                      child: Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: 12,
                          color: white,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
