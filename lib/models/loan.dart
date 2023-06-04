import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../utils/http_request.dart';

class Loan {
  final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  String? productTypeId;
  String? loanTypeId;
  String? loanCategoryId;
  String? amount;
  String? customerId;
  String? loanDate;
  String? loanRate;

  Loan({
    this.amount,
    this.customerId,
    this.loanCategoryId,
    this.loanDate,
    this.loanRate,
    this.loanTypeId,
    this.productTypeId,
  });
}
