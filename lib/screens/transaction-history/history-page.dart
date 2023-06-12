import 'package:bank_core/components/transaction-history-card/transaction-history-card.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  static const routeName = 'HistoryPage';
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              "Гүйлгээний түүх",
              style: TextStyle(color: white, fontWeight: FontWeight.w500),
            ),
          ),
          TransactionHistoryCard(),
          SizedBox(
            height: 8,
          ),
          TransactionHistoryCard(
            isIncome: true,
          ),
        ],
      ),
    );
  }
}
