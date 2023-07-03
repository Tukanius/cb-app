part '../parts/loan.dart';

class Loan {
  int? amount;
  String? customerId;
  String? loanDate;
  String? loanRate;
  String? loanTimeId;
  String? accountId;

  Loan({
    this.accountId,
    this.amount,
    this.customerId,
    this.loanDate,
    this.loanRate,
    this.loanTimeId,
  });

  static $fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);

  factory Loan.fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);
  Map<String, dynamic> toJson() => _$LoanToJson(this);
}
