part '../parts/customer_account.dart';

class CustomerAccount {
  String? customerId;
  String? isOriginal;
  String? bankId;
  String? accountNumber;

  CustomerAccount({
    this.customerId,
    this.isOriginal,
    this.bankId,
    this.accountNumber,
  });

  static $fromJson(Map<String, dynamic> json) =>
      _$CustomerAccountFromJson(json);

  factory CustomerAccount.fromJson(Map<String, dynamic> json) =>
      _$CustomerAccountFromJson(json);
  Map<String, dynamic> toJson() => $CustomerAccountToJson(this);
}
