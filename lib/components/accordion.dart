import 'package:bank_core/models/answer.dart';
import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  final Answer data;

  const Accordion({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        widget.data.type == "USER_RELATED"
            ? Text('Хэрэглэгчтэй холбоотой')
            : widget.data.type == 'CONTACT_RELATED'
                ? Text('Холбоо барих')
                : widget.data.type == "LOAN_RELATED"
                    ? Text('Зээлтэй холбоотой')
                    : SizedBox(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).splashColor,
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
                      widget.data.question.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    trailing: Icon(_showContent
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down),
                    iconColor: Theme.of(context).iconTheme.color,
                  ),
                  _showContent
                      ? Container(
                          padding: EdgeInsets.only(
                            right: 15,
                            left: 15,
                            bottom: 5,
                          ),
                          child: Text(
                            widget.data.answer.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
