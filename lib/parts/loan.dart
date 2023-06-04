import 'package:bank_core/models/loan.dart';

Loan $LoanFromJson(Map<String, dynamic> json) {
  String? productTypeId;
  String? loanTypeId;
  String? loanCategoryId;
  String? amount;
  String? customerId;
  String? loanDate;
  String? loanRate;

  if (json['productTypeId'] != null) productTypeId = json['productTypeId'];
  if (json['loanTypeId'] != null) loanTypeId = json['loanTypeId'];
  if (json['customerId'] != null) customerId = json['customerId'];
  if (json['amount'] != null) amount = json['amount'];
  if (json['loanCategoryId'] != null) loanCategoryId = json['loanCategoryId'];
  if (json['loanDate'] != null) loanDate = json['loanDate'];
  if (json['loanRate'] != null) loanRate = json['loanRate'];

  return Loan(
    productTypeId: productTypeId,
    loanTypeId: loanTypeId,
    loanCategoryId: loanCategoryId,
    amount: amount,
    customerId: customerId,
    loanDate: loanDate,
    loanRate: loanRate,
  );
}

Map<String, dynamic> _$LoanToJson(Loan instance) {
  Map<String, dynamic> json = {};

  if (instance.productTypeId != null)
    json['productTypeId'] = instance.productTypeId;
  if (instance.loanTypeId != null) json['loanTypeId'] = instance.loanTypeId;
  if (instance.customerId != null) json['customerId'] = instance.customerId;
  if (instance.loanCategoryId != null)
    json['loanCategoryId'] = instance.loanCategoryId;
  if (instance.amount != null) json['amount'] = instance.amount;
  if (instance.loanDate != null) json['loanDate'] = instance.loanDate;
  if (instance.loanRate != null) json['loanRate'] = instance.loanRate;

  return json;
}
