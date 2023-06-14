import 'package:bank_core/components/transaction-history-card/transaction-history-card.dart';
import 'package:flutter/material.dart';

class Expenditure extends StatefulWidget {
  const Expenditure({super.key});

  @override
  State<Expenditure> createState() => _ExpenditureState();
}

class _ExpenditureState extends State<Expenditure> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TransactionHistoryCard(isIncome: false),
    );
  }
}
