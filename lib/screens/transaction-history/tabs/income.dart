import 'package:bank_core/components/transaction-history-card/transaction-history-card.dart';
import 'package:flutter/material.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TransactionHistoryCard(isIncome: true),
        ],
      ),
    );
  }
}
