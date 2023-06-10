part of '../models/loan.dart';

Loan _$LoanFromJson(Map<String, dynamic> json) {
  return Loan(
    amount:
        json['amount'] != null ? double.parse(json['amount'].toString()) : null,
    customerId:
        json['customerId'] != null ? json['customerId'] as String : null,
    loanDate: json['loanDate'] != null ? json['loanDate'] as String : null,
    loanRate: json['loanRate'] != null ? json['loanRate'] as String : null,
    loanTimeId:
        json['loanTimeId'] != null ? json['loanTimeId'] as String : null,
    accountId: json['accountId'] != null ? json['accountId'] as String : null,
  );
}

Map<String, dynamic> _$LoanToJson(Loan instance) {
  Map<String, dynamic> json = {};

  if (instance.accountId != null) json['accountId'] = instance.accountId;
  if (instance.amount != null) json['amount'] = instance.amount;
  if (instance.customerId != null) json['customerId'] = instance.customerId;
  if (instance.loanDate != null) json['loanDate'] = instance.loanDate;
  if (instance.loanRate != null) json['loanRate'] = instance.loanRate;
  if (instance.loanTimeId != null) json['loanTimeId'] = instance.loanTimeId;
  return json;
}
