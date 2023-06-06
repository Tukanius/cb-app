import 'dart:async';

import 'package:bank_core/api/customer-api.dart';
import 'package:bank_core/components/action-button.dart';
import 'package:bank_core/components/loan/schedule-card.dart';
import 'package:bank_core/models/result.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class LoanSchedulePageArguments {
  String id;
  LoanSchedulePageArguments({
    required this.id,
  });
}

class LoanSchedulePage extends StatefulWidget {
  final String id;
  static const routeName = "LoanSchedulePage";
  const LoanSchedulePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<LoanSchedulePage> createState() => _LoanSchedulePageState();
}

class _LoanSchedulePageState extends State<LoanSchedulePage>
    with AfterLayoutMixin {
  @override
  afterFirstLayout(BuildContext context) async {
    list(page, limit);
  }

  int page = 1;
  int limit = 5;
  Result loanSchedule = Result(count: 0, rows: []);
  bool isLoading = true;

  list(page, limit) async {
    Offset offset = Offset(page: page, limit: limit);
    Filter filter = Filter();
    loanSchedule = await CustomerApi().loanSchedule(
        ResultArguments(offset: offset, filter: filter), widget.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.all(10),
          child: ActionButton(
            onClick: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: white,
              size: 10,
            ),
          ),
        ),
        title: Text(
          'Зээл төлөх',
          style: TextStyle(
            color: white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: loanSchedule.rows!
              .map(
                (e) => LoanScheduleCard(
                  data: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
